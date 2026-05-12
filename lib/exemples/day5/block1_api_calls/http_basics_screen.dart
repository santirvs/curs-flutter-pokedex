import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpBasicsScreen extends StatefulWidget {
  const HttpBasicsScreen({super.key});

  @override
  State<HttpBasicsScreen> createState() => _HttpBasicsScreenState();
}

class _HttpBasicsScreenState extends State<HttpBasicsScreen> {
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
      appBar: AppBar(title: const Text('http · GET bàsic')),
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
  static final Uri _postOne = Uri.parse(
    'https://jsonplaceholder.typicode.com/posts/1',
  );

  Future<String> getPostTitle() async {
    final response = await http.get(_postOne);

    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode}');
    }

    final map = jsonDecode(response.body) as Map<String, dynamic>;
    return map['title'] as String;
  }
}
