import 'package:flutter_adidas_clone/models/order_item.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/models/store.dart';
import 'package:flutter_adidas_clone/models/user_address.dart';

import '../../models/product_category.dart';
import '../../models/product_type.dart';

class AppMockData {
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
      name: 'D??P adilette COMFORT',
      isFav: false,
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/535610eb253e4bf5a004ae0c01551432_9366/FORUM_84_LOW_8K_Mau_xanh_da_troi_GZ6479_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 5800000,
      name: 'FORUM 84 LOW 8K',
      isFav: false,
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8129befd83a043678710adf5007bf1e7_9366/Giay_ZX_22_BOOST_trang_GY6695_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 3200000,
      name: 'Gi??y ZX 22 BOOST',
      isFav: false,
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fbaf991a78bc4896a3e9ad7800abcec6_9366/Giay_Ultraboost_22_DJen_GZ0127_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 5200000,
      name: 'Gi??y Ultraboost 22',
      isFav: false,
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5b1027d7e2ba472895e4ae310057664a_9366/Giay_ZX_22_BOOST_trang_GY6694_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 3100000,
      name: 'Gi??y ZX 8000',
      isFav: false,
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/168c2c9bf310442ea387ad660078f3ec_9366/Dep_adidas_adilette_Comfort_x_LEGO(r)_DJen_GW0822_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 950000,
      name: 'D??P adilette COMFORT X LEGO',
      isFav: false,
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/95d6943dc72849cd8c8ead86012ed34f_9366/Giay_DJa_Bong_X_Speedflow.3_Firm_Ground_trang_GW7480_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 1900000,
      name: 'Gi??y ???? B??ng X Speedflow.3',
      isFav: false,
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/864091d7955f4521a12facc9018519b9_9366/Giay_Golf_Alphaflex_21_BOA_trang_FZ1032_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 4300000,
      name: 'Gi??y Golf AlphaFlex 21 BOA',
      isFav: false,
    ),
    Product(
      imageUrl: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/110eb76afa3f4a298f3eadfb00089a5b_9366/DAME_8_BIG_MOOD_DJen_GW4336_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 3200000,
      name: 'DAME 8 BIG MOOD',
      isFav: false,
    ),
  ];

  final List<OrderItem> _orderItems = [
    OrderItem(
      product: Product(
        imageUrl: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/923bec57082443e39f92ad6e00cbed3d_9366/Dep_adilette_Comfort_DJen_GZ5896_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 850000,
        name: 'D??P adilette COMFORT',
        isFav: true,
      ),
      size: 9.5,
      quantity: 2,
      total: 1500000,
    ),
    OrderItem(
      product: Product(
        imageUrl: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/535610eb253e4bf5a004ae0c01551432_9366/FORUM_84_LOW_8K_Mau_xanh_da_troi_GZ6479_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 5800000,
        name: 'FORUM 84 LOW 8K',
        isFav: true,
      ),
      size: 9,
      quantity: 3,
      total: 5800000 * 3 - 400,
    ),
    OrderItem(
      product: Product(
        imageUrl: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8129befd83a043678710adf5007bf1e7_9366/Giay_ZX_22_BOOST_trang_GY6695_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 3200000,
        name: 'Gi??y ZX 22 BOOST',
        isFav: false,
      ),
      size: 8,
      quantity: 1,
      total: 3200000,
    ),
    OrderItem(
      product: Product(
        imageUrl: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fbaf991a78bc4896a3e9ad7800abcec6_9366/Giay_Ultraboost_22_DJen_GZ0127_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 5200000,
        name: 'Gi??y Ultraboost 22',
        isFav: true,
      ),
      size: 9.5,
      quantity: 1,
      total: 5200000,
    ),
    OrderItem(
      product: Product(
        imageUrl: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5b1027d7e2ba472895e4ae310057664a_9366/Giay_ZX_22_BOOST_trang_GY6694_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 3100000,
        name: 'Gi??y ZX 8000',
        isFav: false,
      ),
      size: 9,
      quantity: 1,
      total: 3100000,
    ),
    OrderItem(
      product: Product(
        imageUrl: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/864091d7955f4521a12facc9018519b9_9366/Giay_Golf_Alphaflex_21_BOA_trang_FZ1032_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 4300000,
        isFav: false,
        name: 'Gi??y Golf AlphaFlex 21 BOA',
      ),
      size: 9,
      quantity: 2,
      total: 4300000 * 2 - 200,
    ),
  ];

  final List<UserAddress> _userAddresses = [
    UserAddress(
      id: 'mock_data_1',
      userId: '1',
      receptionName: 'B??i Thi???n Nh??n',
      receptionPhoneNumber: '0762796747',
      address: '05/66 Phan ????ng L??u, P9, Tp Tuy H??a, Ph?? Y??n',
      country: 'VietNam',
    ),
    UserAddress(
      id: 'mock_data_2',
      userId: '1',
      receptionName: 'Phan Duy Lu??n',
      receptionPhoneNumber: '0765326865',
      address: '48 Nguy???n C??ng Tr???, P4, Tp Tuy H??a, Ph?? Y??n',
      country: 'VietNam',
    ),
    UserAddress(
      id: 'mock_data_3',
      userId: '1',
      receptionName: 'D????ng Ho??ng Long',
      receptionPhoneNumber: '02532411645',
      address: '151/26 D2, Phan V??n Tr??, B??nh Th???nh, TP HCM',
      country: 'VietNam',
    ),
  ];
  final List<Store> _stores = [
    Store(
      id: '1',
      name: 'Adidas Outlet Store, HCM, Vincom Thu Duc Shopping Mall',
      address:
          'Vincom, 216, 09/10/11 ??. V?? V??n Ng??n, Th??? ?????c, Th??nh ph??? H??? Ch?? Minh 700000, Vi???t Nam',
      openTime: 9,
      closeTime: 22,
    ),
    Store(
      id: '2',
      name: 'Adidas Performance, Ha Noi Highway',
      address:
          '161 XL H?? N???i, Th???o ??i???n, Qu???n 2, Th??nh ph??? H??? Ch?? Minh 700000, Vi???t Nam',
      openTime: 9,
      closeTime: 22,
    ),
    Store(
      id: '3',
      name: 'Adidas Land Mark 81',
      address:
          'L2 - 08 - 09, Vinhomes T??n C???ng, B??nh Th???nh, Th??nh ph??? H??? Ch?? Minh, Vi???t Nam',
      openTime: 10,
      closeTime: 23,
    ),
    Store(
      id: '4',
      name: 'Adidas SPC Aeon Mall B??nh D????ng',
      address:
          'Gian h??ng G12-15 TTTM Aeon Mall Cannarry, 01 ?????i l??? B??nh D????ng, An Ph??, Thu???n An, B??nh D????ng, Vi???t Nam',
      openTime: 9,
      closeTime: 21,
    ),
    Store(
      id: '5',
      name: 'Adidas Outlet Store Phan V??n Tr???',
      address:
          '62 ??. Phan V??n Tr???, Ph?????ng 7, G?? V???p, Th??nh ph??? H??? Ch?? Minh, Vi???t Nam',
      openTime: 9,
      closeTime: 22,
    ),
    Store(
      id: '6',
      name: 'Adidas Originals Store HCM, Vincom Dong Khoi',
      address:
          'Vincom B, 72 L?? Th??nh T??n, B???n Ngh??, Qu???n 1, Th??nh ph??? H??? Ch?? Minh, Vi???t Nam',
      openTime: 8,
      closeTime: 21,
    ),
    Store(
      id: '7',
      name: 'Adidas Neo',
      address:
          '39 Nguy????n Hu????, B???n Ngh??, Qu???n 1, Th??nh ph??? H??? Ch?? Minh, Vi???t Nam',
      openTime: 9,
      closeTime: 22,
    ),
    Store(
      id: '8',
      name: 'Adidas Performance, Nguyen Oanh',
      address:
          '10 Nguy???n Oanh, Ph?????ng 7, G?? V???p, Th??nh ph??? H??? Ch?? Minh 70000, Vi???t Nam',
      openTime: 9,
      closeTime: 22,
    ),
  ];

  ProductType get shoes => _shoes;
  List<Product> get products => _products;
  List<Store> get stores => _stores;
  List<OrderItem> get orderItems => _orderItems;
  List<UserAddress> get userAddresses => _userAddresses;
}
