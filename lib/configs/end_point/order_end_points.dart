class OrderEndPoint {
  static getOrderById(String id) => "order/getOrderById/$id";
  static checkOutOrder(String id) => "order/checkOutOrder/$id";
}
