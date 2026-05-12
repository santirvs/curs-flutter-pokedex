import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_screen.freezed.dart';
part 'pagination_screen.g.dart';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({super.key});

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  static const _pageSize = 20;

  final _repository = PaginationRepository();
  final _scroll = ScrollController();
  final List<PaginationProduct> _items = [];

  int _skip = 0;
  bool _loading = false;
  bool _hasMore = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    _loadNext();
  }

  void _onScroll() {
    if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 200) {
      _loadNext();
    }
  }

  Future<void> _loadNext() async {
    if (_loading || !_hasMore) return;
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final page = await _repository.fetchPage(limit: _pageSize, skip: _skip);

      setState(() {
        _items.addAll(page.products);
        _skip += page.products.length;
        _hasMore = _skip < page.total;
      });
    } on DioException catch (e) {
      if (!mounted) return;
      final status = e.response?.statusCode;
      _error = status != null
          ? 'HTTP $status'
          : 'Error de xarxa: ${e.message ?? e}';
    } catch (e) {
      if (!mounted) return;
      _error = 'Error de xarxa: $e';
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _items.clear();
      _skip = 0;
      _hasMore = true;
      _error = null;
    });
    await _loadNext();
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    _repository.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scroll infinit · skip/limit')),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
          controller: _scroll,
          itemCount: _items.length + 1,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (context, i) {
            if (i == _items.length) {
              return _Footer(
                loading: _loading,
                error: _error,
                hasMore: _hasMore,
              );
            }
            final item = _items[i];
            return ListTile(
              leading: CircleAvatar(child: Text('${item.id}')),
              title: Text(item.title),
              subtitle: Text(
                '${item.price.toStringAsFixed(2)} € · Stock ${item.stock}',
              ),
            );
          },
        ),
      ),
    );
  }
}

class PaginationRepository {
  PaginationRepository();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<PaginationProductsPage> fetchPage({
    required int limit,
    required int skip,
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/products',
      queryParameters: {'limit': limit, 'skip': skip},
    );
    final data = res.data;
    if (data == null) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'Resposta buida',
      );
    }
    return PaginationProductsPage.fromJson(data);
  }

  void close() => _dio.close();
}

@freezed
abstract class PaginationProduct with _$PaginationProduct {
  const factory PaginationProduct({
    required int id,
    required String title,
    required double price,
    required int stock,
  }) = _PaginationProduct;

  factory PaginationProduct.fromJson(Map<String, dynamic> json) =>
      _$PaginationProductFromJson(json);
}

@freezed
abstract class PaginationProductsPage with _$PaginationProductsPage {
  const factory PaginationProductsPage({
    required List<PaginationProduct> products,
    required int total,
  }) = _PaginationProductsPage;

  factory PaginationProductsPage.fromJson(Map<String, dynamic> json) =>
      _$PaginationProductsPageFromJson(json);
}

class _Footer extends StatelessWidget {
  const _Footer({
    required this.loading,
    required this.error,
    required this.hasMore,
  });

  final bool loading;
  final String? error;
  final bool hasMore;

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
    if (!hasMore) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('— Fi de la llista —', textAlign: TextAlign.center),
      );
    }
    return const SizedBox(height: 80);
  }
}
