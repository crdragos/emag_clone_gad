part of products_containers;

class SelectedProductContainer extends StatelessWidget {
  const SelectedProductContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<Product> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Product>(
      converter: (Store<AppState> store) {
        final List<Product> products = store.state.products.products.toList();
        return products.firstWhere(
          (Product product) => product.id == store.state.products.selectedProductId,
          orElse: () => null,
        );
      },
      builder: builder,
    );
  }
}
