class ProductEndPoint {
  static const getProducts = "product/getProducts";
  static getProductById(String id) => "product/getProductByCategoryId/$id";
  static buyProduct(String id, String size, String color) =>
      "product/buyProduct/$id/$size/$color";
  static likeProduct(String idProd, String idUser) =>
      "product/likeProduct/$idProd/$idUser";
  static dislikeProduct(String idProd, String idUser) =>
      "product/dislikeProduct/$idProd/$idUser";

  static addToBag(String idProd, String idUser) =>
      "product/addToBag/$idProd/$idUser";
  static removeFromBag(String idProd, String idUser) =>
      "product/removeFromBag/$idProd/$idUser";
}
