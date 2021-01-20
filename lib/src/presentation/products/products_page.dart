import 'package:emag_clone_gad/src/containers/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/presentation/products/product_item.dart';
import 'package:emag_clone_gad/src/presentation/routes.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.searchProducts);
          },
          child: Material(
            elevation: 4.0,
            shape: const StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    'Tap to search',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ProductsContainer(builder: (BuildContext context, List<Product> products) {
        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final Product product = products[index];
            return ProductItem(product: product);
          },
        );
      }),
    );
  }
}
