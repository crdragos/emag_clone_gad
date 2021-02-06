part of products_containers;

class SelectedCategoryProductsContainer extends StatelessWidget {
  const SelectedCategoryProductsContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Product>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Product>>(
      converter: (Store<AppState> store) {
        final List<Product> products = store.state.products.products.toList();
        return products //
            .where((Product product) => product.category == store.state.products.selectedCategory)
            .toList();
      },
      builder: builder,
    );
  }
}
