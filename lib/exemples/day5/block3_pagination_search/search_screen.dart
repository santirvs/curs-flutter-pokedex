import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_screen.freezed.dart';
part 'search_screen.g.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _repository = SearchRepository();
  Timer? _debouncer;

  bool _loading = false;
  String? _error;
  List<SearchProduct> _results = const [];
  String _query = '';

  void _onChanged(String text) {
    final q = text.trim();
    _debouncer?.cancel();
    _debouncer = Timer(const Duration(milliseconds: 300), () => _fetch(q));
  }

  Future<void> _fetch(String q) async {
    if (q.isEmpty) {
      setState(() {
        _query = '';
        _results = const [];
        _error = null;
        _loading = false;
      });
      return;
    }

    setState(() {
      _query = q;
      _loading = true;
      _error = null;
    });

    try {
      final result = await _repository.search(q);
      setState(() => _results = result.products);
    } catch (e) {
      setState(() {
        _error = e is DioException && e.response?.statusCode != null
            ? 'HTTP ${e.response!.statusCode}'
            : 'Error de xarxa: $e';
        _results = const [];
      });
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _debouncer?.cancel();
    _repository.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cerca amb debounce')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: _onChanged,
              decoration: const InputDecoration(
                labelText: 'Cerca productes',
                hintText: 'Ex.: phone, laptop, perfume',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => _fetch(_query),
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _results.length + 1,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, i) {
                  if (i == _results.length) {
                    return _Footer(
                      loading: _loading,
                      error: _error,
                      query: _query,
                      resultsEmpty: _results.isEmpty,
                    );
                  }
                  final item = _results[i];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${item.id}')),
                    title: Text(item.title),
                    subtitle: Text('${item.price.toStringAsFixed(2)} €'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchRepository {
  SearchRepository();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<SearchProductsResult> search(String query) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/products/search',
      queryParameters: {'q': query},
    );
    final data = res.data;
    if (data == null) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'Resposta buida',
      );
    }
    return SearchProductsResult.fromJson(data);
  }

  void close() => _dio.close();
}

@freezed
abstract class SearchProduct with _$SearchProduct {
  const factory SearchProduct({
    required int id,
    required String title,
    required double price,
  }) = _SearchProduct;

  factory SearchProduct.fromJson(Map<String, dynamic> json) =>
      _$SearchProductFromJson(json);
}

@freezed
abstract class SearchProductsResult with _$SearchProductsResult {
  const factory SearchProductsResult({
    @Default(<SearchProduct>[]) List<SearchProduct> products,
  }) = _SearchProductsResult;

  factory SearchProductsResult.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsResultFromJson(json);
}

class _Footer extends StatelessWidget {
  const _Footer({
    required this.loading,
    required this.error,
    required this.query,
    required this.resultsEmpty,
  });

  final bool loading;
  final String? error;
  final String query;
  final bool resultsEmpty;

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(error!, textAlign: TextAlign.center),
      );
    }
    if (loading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (query.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Comença a escriure per buscar',
          textAlign: TextAlign.center,
        ),
      );
    }
    if (resultsEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Cap resultat per «$query»', textAlign: TextAlign.center),
      );
    }
    return const SizedBox(height: 80);
  }
}
