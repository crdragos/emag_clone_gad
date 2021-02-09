import 'package:emag_clone_gad/src/containers/auth/index.dart';
import 'package:emag_clone_gad/src/containers/index.dart';
import 'package:emag_clone_gad/src/models/auth/index.dart';
import 'package:emag_clone_gad/src/models/products/index.dart';
import 'package:emag_clone_gad/src/presentation/cart/cart_item_widget.dart';
import 'package:emag_clone_gad/src/presentation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping cart'),
        centerTitle: true,
      ),
      body: UserContainer(
        builder: (BuildContext context, AppUser user) {
          if (user.cart != null && user.cart.items.isNotEmpty) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: user.cart.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductContainer(
                        productId: user.cart.items[index].productId,
                        builder: (BuildContext context, Product product) {
                          return CartItemWidget(user: user, cartItem: user.cart.items[index], product: product);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Order details',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: const <Widget>[
                          Text(
                            'Products total:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '2131.21 \$',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const <Widget>[
                          Text(
                            'Delivery cost:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Free',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const <Widget>[
                          Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '2131.21 \$',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Center(
                        child: InkWell(
                          onTap: () {
                            print('continua');
                          },
                          child: Material(
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * .8,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(24.0),
                                      ),
                                    ),
                                    child: const Icon(
                                      FontAwesomeIcons.arrowCircleRight,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * .2),
                                  const Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    FontAwesomeIcons.shoppingCart,
                    size: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Find best offers and buy safe!',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .7,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: FlatButton(
                      child: const Text(
                        'View products in shop',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
