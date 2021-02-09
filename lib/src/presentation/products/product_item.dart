import 'package:cached_network_image/cached_network_image.dart';
import 'package:emag_clone_gad/src/containers/auth/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key key, @required this.product}) : super(key: key);

  final Product product;

  String _getState(ProductState productState) {
    switch (productState) {
      case ProductState.inStock:
        return 'In stock';
      case ProductState.lastItem:
        return 'Last item';
      case ProductState.outOfStock:
        return 'Out of stock';
      default:
        throw FallThroughError();
    }
  }

  Color _getColor(ProductState productState) {
    switch (productState) {
      case ProductState.inStock:
        return Colors.green;
      case ProductState.lastItem:
        return Colors.orange;
      case ProductState.outOfStock:
        return Colors.red;
      default:
        throw FallThroughError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        StoreProvider.of<AppState>(context).dispatch(SetSelectedProductId(product.id));
        Navigator.pushNamed(context, AppRoutes.productPage);
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .4,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16.0),
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: <Widget>[
                      Center(
                        child: CachedNetworkImage(imageUrl: product.images.first),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  product.title,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: List<Widget>.generate(
                        5,
                        (int index) {
                          final bool isSelected = product.review.floor() > index;
                          return Icon(
                            Icons.star,
                            color: isSelected ? Colors.amber : Colors.grey,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '${product.review}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.circle,
                      color: _getColor(product.productState),
                      size: 16.0,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      _getState(product.productState),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Spacer(),
                    UserContainer(
                      builder: (BuildContext context, AppUser user) {
                        return IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            Cart cart = user.cart ?? Cart();
                            cart = cart.rebuild((CartBuilder b) {
                              final int index = cart.items.indexWhere((CartItem item) => product.id == item.productId);
                              if (index == -1) {
                                b.items.add(CartItem(product.id, 1));
                              } else {
                                b.items[index] =
                                    cart.items[index].rebuild((CartItemBuilder b) => b.quantity = b.quantity + 1);
                              }
                            });
                            StoreProvider.of<AppState>(context).dispatch(UpdateCart(cart));
                          },
                        );
                      },
                    ),
                  ],
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(color: Colors.red, fontSize: 18.0),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
