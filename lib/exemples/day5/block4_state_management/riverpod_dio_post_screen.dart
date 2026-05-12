import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_dio_post_screen.g.dart';

class RiverpodDioPostScreen extends StatelessWidget {
  const RiverpodDioPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: _RiverpodDioPostView());
  }
}

class Post {
  const Post({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

class JsonPlaceholderPostsRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Post> fetchPostById(int id) async {
    final res = await _dio.get<Map<String, dynamic>>('/posts/$id');
    final data = res.data;
    if (data == null) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'Resposta buida',
      );
    }
    return Post.fromJson(data);
  }

  void close() => _dio.close();
}

@riverpod
class RandomPostController extends _$RandomPostController {
  final JsonPlaceholderPostsRepository _repo = JsonPlaceholderPostsRepository();

  @override
  Future<Post> build() async {
    ref.onDispose(_repo.close);
    return _fetchRandom();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchRandom);
  }

  Future<Post> _fetchRandom() async {
    final id = Random().nextInt(100) + 1;
    return _repo.fetchPostById(id);
  }
}

class _RiverpodDioPostView extends ConsumerWidget {
  const _RiverpodDioPostView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final postAsync = ref.watch(randomPostControllerProvider);
    final notifier = ref.read(randomPostControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod + dio · @riverpod')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: postAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(
                  child: Text(
                    'Error: $e',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ),
                data: (post) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Post #${post.id}',
                          style: theme.textTheme.titleSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(post.title, style: theme.textTheme.titleLarge),
                        const Divider(height: 24),
                        Text(post.body),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: postAsync.isLoading ? null : notifier.refresh,
              icon: const Icon(Icons.refresh),
              label: const Text('Carregar un altre post'),
            ),
          ],
        ),
      ),
    );
  }
}
