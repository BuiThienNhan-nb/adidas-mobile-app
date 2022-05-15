class ProductEndPoint {
  static const getProducts = "product/getProducts";
  static getProductById(String id) => "product/getProductByCategoryId/$id";
  static buyProduct(String id, String size, String color) =>
      "product/buyProduct/$id/$size/$color";
  static likeProduct(String idProd, String idUser) =>
      "product/likeProduct/$idProd/$idUser";
  static dislikeProduct(String idProd, String idUser) =>
      "product/dislikeProduct/$idProd/$idUser";
}
