part of products_containers;

class SelectedCategoryContainer extends StatelessWidget {
  const SelectedCategoryContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<String> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (Store<AppState> store) => store.state.products.selectedCategory,
      builder: builder,
    );
  }
}
