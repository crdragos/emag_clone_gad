import 'package:emag_clone_gad/src/containers/index.dart';
import 'package:emag_clone_gad/src/models/products/index.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectedProductContainer(
      builder: (BuildContext context, Product product) {
        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
          ),
        );
      },
    );
  }
}
