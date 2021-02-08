import 'package:emag_clone_gad/src/models/auth/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key key, @required this.cartItem, @required this.product}) : super(key: key);

  final CartItem cartItem;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .25,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Image.network(
              '${product.images.first}',
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width * .2,
            ),
            const SizedBox(width: 16.0),
            Container(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * .7,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      '${product.title}',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${product.description}',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: Center(
                            child: Text('${cartItem.quantity}'),
                          ),
                        ),
                        //const Spacer(),
                        Text(
                          '${product.price * cartItem.quantity} \$',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.trashAlt,
                            color: Colors.red,
                            size: 22,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
