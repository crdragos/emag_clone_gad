part of products_containers;

class ProductsContainer extends StatelessWidget {
  const ProductsContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<Map<String, List<Product>>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, List<Product>>>(
      builder: builder,
      converter: (Store<AppState> store) {
        final List<Product> products = store.state.products.products.asList();

        return products.fold(
          <String, List<Product>>{},
          (Map<String, List<Product>> map, Product product) {
            map[product.category] ??= <Product>[];
            map[product.category].add(product);
            return map;
          },
        );
      },
    );
  }
}
