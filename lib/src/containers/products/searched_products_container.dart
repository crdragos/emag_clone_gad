part of products_containers;

class SearchedProductsContainer extends StatelessWidget {
  const SearchedProductsContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Product>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Product>>(
      builder: builder,
      converter: (Store<AppState> store) => store.state.products.searchedProducts.asList(),
    );
  }
}
