import 'package:ea_software/common/bottom_bar.dart';
import 'package:ea_software/features/address/address_screen.dart';
import 'package:ea_software/features/admin/screens/add_product_screen.dart';
import 'package:ea_software/features/home/screens/category_deal_screen.dart';
import 'package:ea_software/features/home/screens/home_screen.dart';
import 'package:ea_software/features/auth/screens/auth_screen.dart';
import 'package:ea_software/features/order_details/order_details.dart';
import 'package:ea_software/features/product_details/product_details_screen.dart';
import 'package:ea_software/features/search/search_screen.dart';
import 'package:ea_software/models/order.dart';
import 'package:ea_software/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // I use switch and key statement because
  //& many routes in applications need to match each and every route
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>const AddProductScreen(),
      );
    case CategoryDealScreen.routeName:
    var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
    var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
    var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case AddressScreen.routeName:
    var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:  
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen not found!'),
          ),
        ),
      );
  }
}
