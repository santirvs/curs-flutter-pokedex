import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioBasicsScreen extends StatefulWidget {
  const DioBasicsScreen({super.key});

  @override
  State<DioBasicsScreen> createState() => _DioBasicsScreenState();
}

class _DioBasicsScreenState extends State<DioBasicsScreen> {
  final PostsRepository _repo = PostsRepository();

  String _result = 'Encara no s’ha llançat cap petició';

  Future<void> _fetch() async {
    setState(() => _result = 'Carregant…');
    try {
      final title = await _repo.getPostTitle();
      if (!mounted) return;
      setState(() => _result = 'Títol: $title');
    } catch (e) {
      if (!mounted) return;
      setState(() => _result = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('dio · GET bàsic')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton.icon(
              onPressed: _fetch,
              icon: const Icon(Icons.cloud_download_outlined),
              label: const Text('Llançar GET'),
            ),
            const SizedBox(height: 16),
            Text(_result),
          ],
        ),
      ),
    );
  }
}

class PostsRepository {
  static const String _postOne = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<String> getPostTitle() async {
    final response = await Dio().get(_postOne);

    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode}');
    }

    final map = response.data!;
    return map['title'] as String;
  }
}
