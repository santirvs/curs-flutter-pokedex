import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'codegen_parsing_screen.freezed.dart';
part 'codegen_parsing_screen.g.dart';

class CodegenParsingScreen extends StatefulWidget {
  const CodegenParsingScreen({super.key});

  @override
  State<CodegenParsingScreen> createState() => _CodegenParsingScreenState();
}

class _CodegenParsingScreenState extends State<CodegenParsingScreen> {
  final _repository = const ProductRepository();

  Product? _product;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSampleProduct();
  }

  void _loadSampleProduct() {
    try {
      _product = _repository.sampleProduct();
      _error = null;
    } catch (e) {
      _error = 'No s’ha pogut parsejar: $e';
      _product = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Freezed + json_serializable')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (_error != null)
            Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(_error!),
              ),
            )
          else if (_product != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('id: ${_product!.id}'),
                    Text('title: ${_product!.title}'),
                    Text('price: ${_product!.price}'),
                    Text('stock: ${_product!.stock}'),
                    Text('tags: ${_product!.tags.join(', ')}'),
                    const Divider(),
                    SelectableText(
                      const JsonEncoder.withIndent(
                        '  ',
                      ).convert(_product!.toJson()),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ProductRepository {
  const ProductRepository();

  static const _sampleJson = '''
{
  "id": 8,
  "title": "Apple MacBook Pro 16",
  "price": 1749.99,
  "stock": 34,
  "tags": ["laptops", "apple"]
}
''';

  Product sampleProduct() {
    final map = jsonDecode(_sampleJson) as Map<String, dynamic>;
    return Product.fromJson(map);
  }
}

@freezed
abstract class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required double price,
    required int stock,
    required List<String> tags,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
