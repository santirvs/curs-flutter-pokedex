import 'dart:convert';

import 'package:flutter/material.dart';

class ManualParsingScreen extends StatefulWidget {
  const ManualParsingScreen({super.key});

  @override
  State<ManualParsingScreen> createState() => _ManualParsingScreenState();
}

class _ManualParsingScreenState extends State<ManualParsingScreen> {
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
      appBar: AppBar(title: const Text('Conversió manual')),
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
                    Text(
                      'Mateix JSON que a «json_serializable i freezed»',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
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

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.stock,
    required this.tags,
  });

  final int id;
  final String title;
  final double price;
  final int stock;
  final List<String> tags;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as double,
      stock: json['stock'] as int,
      tags: (json['tags'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'stock': stock,
    'tags': tags,
  };
}
