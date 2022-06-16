import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/widget/loading_indicator.dart';
import '../../../utils/widget/stf_wrapper.dart';
import '../../search_screen_provider.dart';

// class FirstLandingSearchScreen extends StatefulWidget {
//   const FirstLandingSearchScreen({Key? key}) : super(key: key);

//   @override
//   State<FirstLandingSearchScreen> createState() =>
//       _FirstLandingSearchScreenState();
// }

// class _FirstLandingSearchScreenState extends State<FirstLandingSearchScreen> {
//   final Duration duration = const Duration(seconds: 1);
//   bool isLoad = true;
//   void togglePage() => setState(() => isLoad = !isLoad);

//   @override
//   Widget build(BuildContext context) {
//     Widget buildChild() => PageTransitionSwitcher(
//           duration: const Duration(milliseconds: 400),
//           reverse: !isLoad,
//           transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
//               SharedAxisTransition(
//             animation: primaryAnimation,
//             secondaryAnimation: secondaryAnimation,
//             transitionType: SharedAxisTransitionType.horizontal,
//             child: child,
//           ),
//           child: isLoad
//               ? Center(
//                   child: IconButton(
//                       onPressed: togglePage, icon: const Text('Transition')),
//                 )
//               : Center(
//                   child: SizedBox(
//                     height: 580.h,
//                     width: 240.w,
//                     child: Text(
//                       'FIND ALL YOUR FAVORITE ADIDAS PRODUCTS HERE...',
//                       style: AppStyles.boldRegularTextStyle,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//         );

//     return buildChild();
//   }
// }

class FirstLandingSearchScreen extends StatelessWidget {
  const FirstLandingSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget buildChild() => Consumer<SearchScreenProvider>(
    //       builder: (_, __, ___) => PageTransitionSwitcher(
    //         duration: const Duration(milliseconds: 400),
    //         reverse: !context.read<SearchScreenProvider>().isSearching,
    //         transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
    //             SharedAxisTransition(
    //           animation: primaryAnimation,
    //           secondaryAnimation: secondaryAnimation,
    //           transitionType: SharedAxisTransitionType.horizontal,
    //           child: child,
    //         ),
    //         child: context.read<SearchScreenProvider>().isSearching
    //             ? Center(
    //                 child: LoadingIndicator(),
    //               )
    //             : Center(
    //                 child: SizedBox(
    //                   height: 580.h,
    //                   width: 240.w,
    //                   child: Text(
    //                     'FIND ALL YOUR FAVORITE ADIDAS PRODUCTS HERE...',
    //                     style: AppStyles.boldRegularTextStyle,
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 ),
    //               ),
    //       ),
    //     );

    return StatefulWrapper(
      onInit: () {
        Future.delayed(const Duration(seconds: 1)).then(
          (value) {
            context.read<SearchScreenProvider>().isSearching =
                !context.read<SearchScreenProvider>().isSearching;
          },
        );
      },
      child: Consumer<SearchScreenProvider>(
          builder: (_, __, ___) =>
              context.read<SearchScreenProvider>().isSearching
                  ? TransitionWidget(
                      child: Center(
                        child: LoadingIndicator(),
                      ),
                      transitionKey: const ValueKey('Loading'),
                    )
                  : TransitionWidget(
                      child: SizedBox(
                        width: 240.w,
                        child: Center(
                          child: Text(
                            'FIND ALL YOUR FAVORITE ADIDAS PRODUCTS HERE...',
                            style: AppStyles.boldRegularTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      transitionKey: const ValueKey('Display'),
                    )),
    );
  }
}

class TransitionWidget extends StatelessWidget {
  const TransitionWidget({required this.child, required this.transitionKey})
      : super(key: transitionKey);
  final Widget child;
  final ValueKey transitionKey;
  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
          SharedAxisTransition(
        animation: primaryAnimation,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.horizontal,
        child: child,
      ),
      child: child,
    );
  }
}
