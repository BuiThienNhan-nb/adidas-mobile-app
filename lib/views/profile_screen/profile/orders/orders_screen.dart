import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/cart_provider.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/orders/empty_order_screen.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({Key? key}) : super(key: key);

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // return context.read<CartProvider>().count == 0
//     //     ? const EmptyOrderScreen()
//     //     : Center(
//     //         child: TextButton(
//     //           onPressed: context.read<CartProvider>().increaseCart(),
//     //           child: const Text("onClick"),
//     //         ),
//     //       );
//     return Center(
//       child: TextButton(
//         onPressed: () => context.read<CartProvider>().increaseCart(),
//         child: Text("onClick ${context.read<CartProvider>().count}"),
//       ),
//     );
//   }
// }

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return context.read<CartProvider>().count == 0
        ? const EmptyOrderScreen()
        :
        // template screen when there's something in user cart
        Center(
            child: TextButton(
              onPressed: () =>
                  setState(() => context.read<CartProvider>().increaseCart()),
              child: const Text("onClick"),
            ),
          );
  }
}
