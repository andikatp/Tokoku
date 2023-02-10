import 'dart:convert';

class Product {
  final String name;
  final String description;
  final List<String> imageUrl;
  final String category;
  final double price;
  final int quantity;
  final String? id;
  final String? userId;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.quantity,
    this.id,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'category': category});
    result.addAll({'price': price});
    result.addAll({'quantity': quantity});
    if(id != null){
      result.addAll({'_id': id});
    }
    if(userId != null){
      result.addAll({'userId': userId});
    }
  
    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: List<String>.from(map['imageUrl']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      id: map['_id'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
