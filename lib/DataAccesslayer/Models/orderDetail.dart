import 'category.dart';
import 'product.dart';

class OrderDetail {
  final int id;
  final Product? product;
  final int quantity;
  final num price;
  final num total;
  final Category? category;

  OrderDetail({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.total,
    required this.category,
  });

  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
      id: map['id'] as int,
      product: Product.fromMap(map['product']),
      quantity: map['quantity'] ,
      price: map['price'],
      total: map['total'],
      category: Category.fromMap(map['category']),
    );
  }
}