import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../../home/models/products_quantity_model.dart';

class CartTile extends StatelessWidget {
  final ProductsQuantityModel data;
  const CartTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.stroke),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Row(
              children: [
                Container(
                  width: 68.0,
                  height: 68.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: data.product.color!.toColor,
                  ),
                ),
                const SpaceWidth(14.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.product.name!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          data.product.year.toString(),
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: InkWell(
                        onTap: () {
                          // if (data.quantity > 1) {
                          context.read<CheckoutBloc>().add(
                                CheckoutEvent.removeProductFromCart(
                                  product: data.product,
                                ),
                              );
                          // }
                        },
                        child: const ColoredBox(
                          color: AppColors.primary,
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.remove,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SpaceWidth(4.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${data.quantity}'),
                    ),
                    const SpaceWidth(4.0),
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: InkWell(
                        onTap: () {
                          context.read<CheckoutBloc>().add(
                                CheckoutEvent.addProductToCart(
                                  product: data.product,
                                ),
                              );
                        },
                        child: const ColoredBox(
                          color: AppColors.primary,
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
