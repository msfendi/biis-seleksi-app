import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../widgets/cart_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {
              // context.goNamed(
              //   RouteConstants.cart,
              //   pathParameters: PathParameters(
              //     rootTab: RootTab.order,
              //   ).toMap(),
              // );
            },
            icon: const Icon(Icons.shopping_cart_outlined, size: 24.0),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const SizedBox();
              }, loaded: (carts) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: carts.isNotEmpty ? carts.length : 0,
                  itemBuilder: (context, index) => CartTile(
                    data: carts[index],
                  ),
                  separatorBuilder: (context, index) => const SpaceHeight(16.0),
                );
              });
            },
          ),
          const SpaceHeight(50.0),
          Row(
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              // Text(
              //   350000.currencyFormatRp,
              //   style: const TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
            ],
          ),
          const SpaceHeight(40.0),
          Button.filled(
            onPressed: () {
              // context.goNamed(
              //   RouteConstants.address,
              //   pathParameters: PathParameters(
              //     rootTab: RootTab.order,
              //   ).toMap(),
              // );
            },
            label: 'Checkout',
          ),
        ],
      ),
    );
  }
}
