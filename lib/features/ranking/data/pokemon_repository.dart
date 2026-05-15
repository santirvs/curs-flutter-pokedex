import 'package:dio/dio.dart';

import '../../admin/domain/pokemon_model.dart';

class PokemonRepository {
  PokemonRepository();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  Future<List<Pokemon>> fetchPokemonPage({
    required int limit,
    required int offset,
  }) async {
    final listRes = await _dio.get(
      '/pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );

    if (listRes.statusCode != 200 || listRes.data == null) {
      throw DioException(
        requestOptions: listRes.requestOptions,
        message: 'Resposta de llista invàlida (${listRes.statusCode})',
      );
    }

    final body = listRes.data!;
    final results = body['results'] as List<dynamic>;

    if (results.isEmpty) {
      return const [];
    }

    final detailFutures = results.map((e) async {
      final url = (e as Map<String, dynamic>)['url'] as String;
      final detailRes = await _dio.get(url);
      final data = detailRes.data;
      if (data == null) {
        throw DioException(
          requestOptions: detailRes.requestOptions,
          message: 'Fitxa buida',
        );
      }
      return _pokemonFromPokeApiDetail(data);
    });

    return Future.wait(detailFutures);
  }

  void close() => _dio.close();

  Pokemon _pokemonFromPokeApiDetail(Map<String, dynamic> json) {
    final nameRaw = json['name'] as String;
    final displayName = _formatPokemonName(nameRaw);

    int stat(String key) {
      for (final item in json['stats'] as List<dynamic>) {
        final m = item as Map<String, dynamic>;
        final statMap = m['stat'] as Map<String, dynamic>;
        if (statMap['name'] == key) {
          return (m['base_stat'] as num).toInt();
        }
      }
      return 0;
    }

    final types = List<Map<String, dynamic>>.from(
      (json['types'] as List<dynamic>).cast<Map<String, dynamic>>(),
    )..sort((a, b) => (a['slot'] as int).compareTo(b['slot'] as int));

    final typeName =
        (types.first['type'] as Map<String, dynamic>)['name'] as String;

    final sprites = json['sprites'] as Map<String, dynamic>?;
    String? imageUrl;
    if (sprites != null) {
      final other = sprites['other'] as Map<String, dynamic>?;
      final artwork = other?['official-artwork'] as Map<String, dynamic>?;
      imageUrl =
          artwork?['front_default'] as String? ??
          sprites['front_default'] as String?;
    }

    return Pokemon(
      id: (json['id'] as num).toInt(),
      name: displayName,
      type: PokemonType.fromPokeApiName(typeName),
      hp: stat('hp'),
      attack: stat('attack'),
      defense: stat('defense'),
      imageUrl: imageUrl,
    );
  }

  String _formatPokemonName(String slug) {
    return slug
        .split('-')
        .map(
          (w) => w.isEmpty
              ? w
              : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}',
        )
        .join(' ');
  }
}
