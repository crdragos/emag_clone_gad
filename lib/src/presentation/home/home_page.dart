import 'package:emag_clone_gad/src/containers/auth/index.dart';
import 'package:emag_clone_gad/src/models/auth/index.dart';
import 'package:emag_clone_gad/src/presentation/cart/cart_page.dart';
import 'package:emag_clone_gad/src/presentation/products/products_page.dart';
import 'package:emag_clone_gad/src/presentation/products/searched_products_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const ProductsPage(),
        const SearchedProductsPage(),
        const CartPage(),
        Container(color: Colors.green),
        Container(color: Colors.blue),
      ][_page],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        showUnselectedLabels: true,
        currentIndex: _page,
        iconSize: 28,
        onTap: (int index) {
          setState(() {
            _page = index;
          });
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: UserContainer(
              builder: (BuildContext context, AppUser user) {
                return Stack(
                  children: <Widget>[
                    const Icon(Icons.shopping_cart),
                    if (user.cart != null && user.cart.items.isNotEmpty)
                      Positioned(
                        bottom: 6,
                        left: 12,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red[700],
                          ),
                          child: Center(
                            child: Text(
                              '${user.cart.totalProducts}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidHeart),
            label: 'Favorites',
          ),
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidUser),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
