import 'package:flutter_adidas_clone/models/product.dart';

import '../../../models/product_category.dart';
import '../../../models/product_type.dart';

class SearchScreenMockData {
  final ProductType _shoes = ProductType(
    id: 'shoes',
    name: 'SHOES',
    categories: [
      ProductCategory(
        id: '1',
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/923bec57082443e39f92ad6e00cbed3d_9366/Dep_adilette_Comfort_DJen_GZ5896_01_standard.jpg',
        name: 'ALL SHOES',
      ),
      ProductCategory(
        id: '2',
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/535610eb253e4bf5a004ae0c01551432_9366/FORUM_84_LOW_8K_Mau_xanh_da_troi_GZ6479_01_standard.jpg',
        name: 'NEW ARRIVALS',
      ),
      ProductCategory(
        id: '3',
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8129befd83a043678710adf5007bf1e7_9366/Giay_ZX_22_BOOST_trang_GY6695_01_standard.jpg',
        name: 'ORIGINALS',
      ),
      ProductCategory(
        id: '4',
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fbaf991a78bc4896a3e9ad7800abcec6_9366/Giay_Ultraboost_22_DJen_GZ0127_01_standard.jpg',
        name: 'RUNNING',
      ),
      ProductCategory(
        id: '5',
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5b1027d7e2ba472895e4ae310057664a_9366/Giay_ZX_22_BOOST_trang_GY6694_01_standard.jpg',
        name: 'LIFE STYLE',
      ),
      ProductCategory(
        id: '6',
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/168c2c9bf310442ea387ad660078f3ec_9366/Dep_adidas_adilette_Comfort_x_LEGO(r)_DJen_GW0822_01_standard.jpg',
        name: 'SLIDES',
      ),
      ProductCategory(
        id: '7',
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/95d6943dc72849cd8c8ead86012ed34f_9366/Giay_DJa_Bong_X_Speedflow.3_Firm_Ground_trang_GW7480_01_standard.jpg',
        name: 'FOOTBALL',
      ),
      ProductCategory(
        id: '8',
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/864091d7955f4521a12facc9018519b9_9366/Giay_Golf_Alphaflex_21_BOA_trang_FZ1032_01_standard.jpg',
        name: 'GOLF',
      ),
      ProductCategory(
        id: '9',
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/110eb76afa3f4a298f3eadfb00089a5b_9366/DAME_8_BIG_MOOD_DJen_GW4336_01_standard.jpg',
        name: 'BASKETBALL',
      ),
    ],
  );

  final List<Product> _products = [
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/923bec57082443e39f92ad6e00cbed3d_9366/Dep_adilette_Comfort_DJen_GZ5896_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 850000,
      name: 'DÉP adilette COMFORT',
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/535610eb253e4bf5a004ae0c01551432_9366/FORUM_84_LOW_8K_Mau_xanh_da_troi_GZ6479_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 5800000,
      name: 'FORUM 84 LOW 8K',
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8129befd83a043678710adf5007bf1e7_9366/Giay_ZX_22_BOOST_trang_GY6695_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 3200000,
      name: 'Giày ZX 22 BOOST',
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fbaf991a78bc4896a3e9ad7800abcec6_9366/Giay_Ultraboost_22_DJen_GZ0127_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 5200000,
      name: 'Giày Ultraboost 22',
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5b1027d7e2ba472895e4ae310057664a_9366/Giay_ZX_22_BOOST_trang_GY6694_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 3100000,
      name: 'Giày ZX 8000',
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/168c2c9bf310442ea387ad660078f3ec_9366/Dep_adidas_adilette_Comfort_x_LEGO(r)_DJen_GW0822_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 950000,
      name: 'DÉP adilette COMFORT X LEGO',
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/95d6943dc72849cd8c8ead86012ed34f_9366/Giay_DJa_Bong_X_Speedflow.3_Firm_Ground_trang_GW7480_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 1900000,
      name: 'Giày Đá Bóng X Speedflow.3',
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/864091d7955f4521a12facc9018519b9_9366/Giay_Golf_Alphaflex_21_BOA_trang_FZ1032_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 4300000,
      name: 'Giày Golf AlphaFlex 21 BOA',
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/110eb76afa3f4a298f3eadfb00089a5b_9366/DAME_8_BIG_MOOD_DJen_GW4336_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 3200000,
      name: 'DAME 8 BIG MOOD',
    ),
  ];

  ProductType get shoes => _shoes;
  List<Product> get products => _products;
}
