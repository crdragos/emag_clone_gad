part of products_containers;

class ProductContainer extends StatelessWidget {
  const ProductContainer({Key key, @required this.productId, @required this.builder}) : super(key: key);

  final String productId;
  final ViewModelBuilder<Product> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Product>(
      builder: builder,
      converter: (Store<AppState> store) {
        return store.state.products.products.firstWhere((Product product) => product.id == productId);
      },
    );
  }
}
