import 'package:biis_seleksi_app/presentation/cart/pages/cart_page.dart';
import 'package:flutter/material.dart';

import 'core/core.dart';
import 'presentation/home/pages/home_page.dart';

class DashboardPage extends StatefulWidget {
  final int currentTab;
  const DashboardPage({super.key, required this.currentTab});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late int _selectedIndex;
  final List<Widget> _pages = [
    const HomePage(),
    const CartPage(),
    const HomePage(),
    const CartPage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    _selectedIndex = widget.currentTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.grey),
            activeIcon: Icon(Icons.home, color: AppColors.primary),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, color: AppColors.grey),
            activeIcon:
                Icon(Icons.shopping_cart_outlined, color: AppColors.primary),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.grey),
            activeIcon: Icon(Icons.home, color: AppColors.primary),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.grey),
            activeIcon: Icon(Icons.home, color: AppColors.primary),
            label: 'HOME',
          ),
        ],
      ),
    );
  }
}
