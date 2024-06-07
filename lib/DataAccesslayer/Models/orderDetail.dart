import 'category.dart';

class OrderDetail {
  final int id;
  final String product;
  final int quantity;
  final num price;
  final num total;
  final int product_id;
  final Category? category;

  OrderDetail({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.total,
    required this.product_id,
    required this.category,
  });

  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
      id: map['id'] as int,
      product: map['product'] as String,
      quantity: map['quantity'] ,
      price: map['price'],
      total: map['total'],
      product_id: map['product_id'],
      category: Category.fromMap(map['category']),
    );
  }
}