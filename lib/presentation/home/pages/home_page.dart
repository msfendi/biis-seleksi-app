import 'package:biis_seleksi_app/presentation/cart/pages/cart_page.dart';
import 'package:biis_seleksi_app/presentation/home/bloc/all_products/all_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
// import '../widgets/organism/menu_categories.dart';
import '../widgets/organism/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    context
        .read<AllProductsBloc>()
        .add(const AllProductsEvent.getAllProducts());
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cwb Store'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add_outlined, size: 24.0),
          ),
          IconButton(
            onPressed: () {
              // context.goNamed(
              //   RouteConstants.cart,
              //   pathParameters: PathParameters().toMap(),
              // );
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
            },
            icon: const Icon(Icons.shopping_cart_outlined, size: 24.0),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SearchInput(
            controller: searchController,
            onTap: () {
              // context.pushReplacementNamed(
              //   RouteConstants.root,
              //   pathParameters: PathParameters(
              //     rootTab: RootTab.explore,
              //   ).toMap(),
              // );
            },
          ),
          const SpaceHeight(30.0),
          BlocBuilder<AllProductsBloc, AllProductsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loaded: (products) => ProductList(
                  title: 'All Products',
                  onSeeAllTap: () {},
                  items: products,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
