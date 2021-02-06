import 'package:emag_clone_gad/src/containers/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/presentation/products/product_item.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: SelectedCategoryContainer(
          builder: (BuildContext context, String category) {
            return Text(category);
          },
        ),
      ),
      body: SelectedCategoryProductsContainer(
        builder: (BuildContext context, List<Product> products) {
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              final Product product = products[index];
              return ProductItem(product: product);
            },
          );
        },
      ),
    );
  }
}
