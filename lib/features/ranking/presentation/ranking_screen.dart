import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../admin/domain/pokemon_model.dart';
import '../../../widgets/cards/pokemon_card.dart';
import 'ranking_screen_controller.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  static const _pageSize = 20;
  static const _maxPokemon = 240;

  final _controller = RankingScreenController();
  final _scroll = ScrollController();
  final _items = <Pokemon>[];

  int _offset = 0;
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
    if (_items.length >= _maxPokemon) {
      setState(() => _hasMore = false);
      return;
    }

    final remaining = _maxPokemon - _items.length;
    final requestLimit = remaining < _pageSize ? remaining : _pageSize;

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final batch = await _controller.fetchPokemonPage(
        limit: requestLimit,
        offset: _offset,
      );

      if (!mounted) return;

      setState(() {
        _items.addAll(batch);
        _offset += batch.length;
        _hasMore =
            batch.isNotEmpty &&
            batch.length == requestLimit &&
            _items.length < _maxPokemon;
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
      _offset = 0;
      _hasMore = true;
      _error = null;
    });
    await _loadNext();
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        controller: _scroll,
        itemCount: _items.length + 1,
        itemBuilder: (context, i) {
          if (i == _items.length) {
            return _RankingFooter(
              loading: _loading,
              error: _error,
              hasMore: _hasMore,
            );
          }
          return PokemonCard(pokemon: _items[i]);
        },
      ),
    );
  }
}

class _RankingFooter extends StatelessWidget {
  const _RankingFooter({
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
