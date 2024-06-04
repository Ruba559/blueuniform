import 'orderDetail.dart';

class Order {
  final int id;
  final num totalPrice;
  final int status;
  final List<OrderDetail> orderDetails;
  Order({
    required this.id,
    required this.totalPrice,
    required this.status,
    required this.orderDetails,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as int,
      totalPrice: map['total_price'] ?? 0,
      status: map['status'],
      orderDetails: List<OrderDetail>.from(
        (map['details'] as List<dynamic>).map<OrderDetail>(
              (x) => OrderDetail.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
