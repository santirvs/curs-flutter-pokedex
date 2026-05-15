import '../../admin/domain/pokemon_model.dart';
import '../data/pokemon_repository.dart';

class RankingScreenController {
  RankingScreenController({PokemonRepository? repository})
    : _repository = repository ?? PokemonRepository();

  final PokemonRepository _repository;

  Future<List<Pokemon>> fetchPokemonPage({
    required int limit,
    required int offset,
  }) {
    return _repository.fetchPokemonPage(limit: limit, offset: offset);
  }

  void dispose() => _repository.close();
}
