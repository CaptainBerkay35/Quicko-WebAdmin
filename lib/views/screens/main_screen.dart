import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:quicko_web_admin/views/screens/sidebar_screens/categories_screen.dart';
import 'package:quicko_web_admin/views/screens/sidebar_screens/dashboard_screen.dart';
import 'package:quicko_web_admin/views/screens/sidebar_screens/franchises_screen.dart';
import 'package:quicko_web_admin/views/screens/sidebar_screens/orders_screen.dart';
import 'package:quicko_web_admin/views/screens/sidebar_screens/products_screen.dart';
import 'package:quicko_web_admin/views/screens/sidebar_screens/uploadbanner_screen.dart';
import 'package:quicko_web_admin/views/screens/sidebar_screens/withdrawal_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = DashboardScreen();
  screenSelector(item){
    switch(item.route){
      case DashboardScreen.routeName:
        setState(() {
          _selectedItem = DashboardScreen();
        });
        break;
      case FranchisesScreen.routeName:
        setState(() {
          _selectedItem = FranchisesScreen();
        });
        break;
      case WithdrawalScreen.routeName:
        setState(() {
          _selectedItem = WithdrawalScreen();
        });
        break;
      case OrderScreen.routeName:
        setState(() {
          _selectedItem = OrderScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedItem = CategoriesScreen();
        });
        break;
      case ProductsScreen.routeName:
        setState(() {
          _selectedItem =ProductsScreen();
        });
        break;
      case UploadBannerScreen.routeName:
        setState(() {
          _selectedItem =UploadBannerScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Management'),
      ),
      body: _selectedItem,
      sideBar: SideBar(
        items: [
          AdminMenuItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            route: DashboardScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Franchises',
            icon: CupertinoIcons.person_3,
            route: FranchisesScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Withdrawal',
            icon: CupertinoIcons.money_dollar,
            route:WithdrawalScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Orders',
            icon: CupertinoIcons.shopping_cart,
            route: OrderScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Categories',
            icon: Icons.category,
            route: CategoriesScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Products',
            icon: Icons.shop,
            route: ProductsScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Upload Banner',
            icon: CupertinoIcons.add,
            route: UploadBannerScreen.routeName,
          ),
        ],
        selectedRoute: '',onSelected:(item){
          screenSelector(item);
      } ,
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
