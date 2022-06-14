import 'package:flutter_adidas_clone/models/order_item.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/models/promotion.dart';
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
      id: '1',
      productCategory: [],
      productType: ProductType(id: 'fake', name: 'SHOES'),
      imageUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/923bec57082443e39f92ad6e00cbed3d_9366/Dep_adilette_Comfort_DJen_GZ5896_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 850000,
      name: 'DÉP adilette COMFORT',
      isFavorite: false,
    ),
    Product(
      id: '2',
      productCategory: [],
      productType: ProductType(id: 'fake', name: 'SHOES'),
      imageUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/535610eb253e4bf5a004ae0c01551432_9366/FORUM_84_LOW_8K_Mau_xanh_da_troi_GZ6479_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 5800000,
      name: 'FORUM 84 LOW 8K',
      isFavorite: false,
    ),
    Product(
      id: '3',
      productCategory: [],
      productType: ProductType(id: 'fake', name: 'SHOES'),
      imageUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8129befd83a043678710adf5007bf1e7_9366/Giay_ZX_22_BOOST_trang_GY6695_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 3200000,
      name: 'Giày ZX 22 BOOST',
      isFavorite: false,
    ),
    Product(
      id: '4',
      productCategory: [],
      productType: ProductType(id: 'fake', name: 'SHOES'),
      imageUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fbaf991a78bc4896a3e9ad7800abcec6_9366/Giay_Ultraboost_22_DJen_GZ0127_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 5200000,
      name: 'Giày Ultraboost 22',
      isFavorite: false,
    ),
    Product(
      id: '5',
      productCategory: [],
      productType: ProductType(id: 'fake', name: 'SHOES'),
      imageUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5b1027d7e2ba472895e4ae310057664a_9366/Giay_ZX_22_BOOST_trang_GY6694_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 3100000,
      name: 'Giày ZX 8000',
      isFavorite: false,
    ),
    Product(
      id: '6',
      productCategory: [],
      productType: ProductType(id: 'fake', name: 'SHOES'),
      imageUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/168c2c9bf310442ea387ad660078f3ec_9366/Dep_adidas_adilette_Comfort_x_LEGO(r)_DJen_GW0822_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 950000,
      name: 'DÉP adilette COMFORT X LEGO',
      isFavorite: false,
    ),
    Product(
      id: '7',
      productCategory: [],
      productType: ProductType(id: 'fake', name: 'SHOES'),
      imageUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/95d6943dc72849cd8c8ead86012ed34f_9366/Giay_DJa_Bong_X_Speedflow.3_Firm_Ground_trang_GW7480_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 1900000,
      name: 'Giày Đá Bóng X Speedflow.3',
      isFavorite: false,
    ),
    Product(
      id: '8',
      productCategory: [],
      productType: ProductType(id: 'fake', name: 'SHOES'),
      imageUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/864091d7955f4521a12facc9018519b9_9366/Giay_Golf_Alphaflex_21_BOA_trang_FZ1032_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 4300000,
      name: 'Giày Golf AlphaFlex 21 BOA',
      isFavorite: false,
    ),
    Product(
      id: '9',
      productCategory: [],
      productType: ProductType(id: 'fake', name: 'SHOES'),
      imageUrls: [
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/110eb76afa3f4a298f3eadfb00089a5b_9366/DAME_8_BIG_MOOD_DJen_GW4336_01_standard.jpg',
      ],
      tag: 'NEW',
      price: 3200000,
      name: 'DAME 8 BIG MOOD',
      isFavorite: false,
    ),
  ];

  final List<OrderItem> _orderItems = [
    OrderItem(
      product: Product(
        id: '1',
        productCategory: [],
        productType: ProductType(id: 'fake', name: 'SHOES'),
        imageUrls: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/923bec57082443e39f92ad6e00cbed3d_9366/Dep_adilette_Comfort_DJen_GZ5896_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 850000,
        name: 'DÉP adilette COMFORT',
        isFavorite: true,
      ),
      size: 9.5,
      quantity: 2,
      total: 1500000,
    ),
    OrderItem(
      product: Product(
        id: '2',
        productCategory: [],
        productType: ProductType(id: 'fake', name: 'SHOES'),
        imageUrls: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/535610eb253e4bf5a004ae0c01551432_9366/FORUM_84_LOW_8K_Mau_xanh_da_troi_GZ6479_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 5800000,
        name: 'FORUM 84 LOW 8K',
        isFavorite: true,
      ),
      size: 9,
      quantity: 3,
      total: 5800000 * 3 - 400,
    ),
    OrderItem(
      product: Product(
        id: '3',
        productCategory: [],
        productType: ProductType(id: 'fake', name: 'SHOES'),
        imageUrls: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8129befd83a043678710adf5007bf1e7_9366/Giay_ZX_22_BOOST_trang_GY6695_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 3200000,
        name: 'Giày ZX 22 BOOST',
        isFavorite: false,
      ),
      size: 8,
      quantity: 1,
      total: 3200000,
    ),
    OrderItem(
      product: Product(
        id: '4',
        productCategory: [],
        productType: ProductType(id: 'fake', name: 'SHOES'),
        imageUrls: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fbaf991a78bc4896a3e9ad7800abcec6_9366/Giay_Ultraboost_22_DJen_GZ0127_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 5200000,
        name: 'Giày Ultraboost 22',
        isFavorite: true,
      ),
      size: 9.5,
      quantity: 1,
      total: 5200000,
    ),
    OrderItem(
      product: Product(
        id: '5',
        productCategory: [],
        productType: ProductType(id: 'fake', name: 'SHOES'),
        imageUrls: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5b1027d7e2ba472895e4ae310057664a_9366/Giay_ZX_22_BOOST_trang_GY6694_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 3100000,
        name: 'Giày ZX 8000',
        isFavorite: false,
      ),
      size: 9,
      quantity: 1,
      total: 3100000,
    ),
    OrderItem(
      product: Product(
        id: '6',
        productCategory: [],
        productType: ProductType(id: 'fake', name: 'SHOES'),
        imageUrls: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/864091d7955f4521a12facc9018519b9_9366/Giay_Golf_Alphaflex_21_BOA_trang_FZ1032_01_standard.jpg',
        ],
        tag: 'NEW',
        price: 4300000,
        isFavorite: false,
        name: 'Giày Golf AlphaFlex 21 BOA',
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
      receptionName: 'Bùi Thiện Nhân',
      receptionPhoneNumber: '0762796747',
      address: '05/66 Phan Đăng Lưu, P9, Tp Tuy Hòa, Phú Yên',
      country: 'VietNam',
    ),
    UserAddress(
      id: 'mock_data_2',
      userId: '1',
      receptionName: 'Phan Duy Luân',
      receptionPhoneNumber: '0765326865',
      address: '48 Nguyễn Công Trứ, P4, Tp Tuy Hòa, Phú Yên',
      country: 'VietNam',
    ),
    UserAddress(
      id: 'mock_data_3',
      userId: '1',
      receptionName: 'Dương Hoàng Long',
      receptionPhoneNumber: '02532411645',
      address: '151/26 D2, Phan Văn Trí, Bình Thạnh, TP HCM',
      country: 'VietNam',
    ),
  ];
  final List<Store> _stores = [
    Store(
      id: '1',
      name: 'Adidas Outlet Store, HCM, Vincom Thu Duc Shopping Mall',
      address:
          'Vincom, 216, 09/10/11 Đ. Võ Văn Ngân, Thủ Đức, Thành phố Hồ Chí Minh 700000, Việt Nam',
      openTime: 9,
      closeTime: 22,
    ),
    Store(
      id: '2',
      name: 'Adidas Performance, Ha Noi Highway',
      address:
          '161 XL Hà Nội, Thảo Điền, Quận 2, Thành phố Hồ Chí Minh 700000, Việt Nam',
      openTime: 9,
      closeTime: 22,
    ),
    Store(
      id: '3',
      name: 'Adidas Land Mark 81',
      address:
          'L2 - 08 - 09, Vinhomes Tân Cảng, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam',
      openTime: 10,
      closeTime: 23,
    ),
    Store(
      id: '4',
      name: 'Adidas SPC Aeon Mall Bình Dương',
      address:
          'Gian hàng G12-15 TTTM Aeon Mall Cannarry, 01 Đại lộ Bình Dương, An Phú, Thuận An, Bình Dương, Việt Nam',
      openTime: 9,
      closeTime: 21,
    ),
    Store(
      id: '5',
      name: 'Adidas Outlet Store Phan Văn Trị',
      address:
          '62 Đ. Phan Văn Trị, Phường 7, Gò Vấp, Thành phố Hồ Chí Minh, Việt Nam',
      openTime: 9,
      closeTime: 22,
    ),
    Store(
      id: '6',
      name: 'Adidas Originals Store HCM, Vincom Dong Khoi',
      address:
          'Vincom B, 72 Lê Thánh Tôn, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam',
      openTime: 8,
      closeTime: 21,
    ),
    Store(
      id: '7',
      name: 'Adidas Neo',
      address:
          '39 Nguyễn Huệ, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam',
      openTime: 9,
      closeTime: 22,
    ),
    Store(
      id: '8',
      name: 'Adidas Performance, Nguyen Oanh',
      address:
          '10 Nguyễn Oanh, Phường 7, Gò Vấp, Thành phố Hồ Chí Minh 70000, Việt Nam',
      openTime: 9,
      closeTime: 22,
    ),
  ];
  final List<Promotion> _promotion = [
    Promotion(
      id: 'ID12MS3NV5',
      name: 'test',
      description: 'test',
      expiredDate: DateTime.now().add(const Duration(days: 3)),
      discount: 0.2,
    ),
    Promotion(
      id: '12345678',
      name: 'test',
      description: 'test',
      expiredDate: DateTime.now().add(const Duration(days: -1)),
      discount: 200000,
    ),
    Promotion(
      id: 'ABC1234BCA',
      name: 'test',
      description: 'test',
      expiredDate: DateTime.now().add(const Duration(days: 5)),
      discount: 0.15,
    ),
    Promotion(
      id: 'Z9VNASD5AG3',
      name: 'test',
      description: 'test',
      expiredDate: DateTime.now().add(const Duration(days: 2)),
      discount: 0.1,
    ),
    Promotion(
      id: 'G326682FAW4',
      name: 'test',
      description: 'test',
      expiredDate: DateTime.now().add(const Duration(days: -6)),
      discount: 150000,
    ),
  ];

  ProductType get shoes => _shoes;
  List<Product> get products => _products;
  List<Promotion> get promotions => _promotion;
  List<Store> get stores => _stores;
  List<OrderItem> get orderItems => _orderItems;
  List<UserAddress> get userAddresses => _userAddresses;
}
