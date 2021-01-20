import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/containers/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/presentation/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SearchedProductsPage extends StatelessWidget {
  const SearchedProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String value) {
            StoreProvider.of<AppState>(context).dispatch(SearchProducts(value));
          },
        ),
      ),
      body: SearchedProductsContainer(
        builder: (BuildContext context, List<Product> products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(product: products[index]);
            },
          );
        },
      ),
    );
  }
}
