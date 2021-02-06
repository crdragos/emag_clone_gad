import 'package:built_collection/built_collection.dart';
import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:redux/redux.dart';

Reducer<ProductsState> productsReducer = combineReducers(<Reducer<ProductsState>>[
  TypedReducer<ProductsState, GetProductsSuccessful>(_getProductsSuccessful),
  TypedReducer<ProductsState, SearchProductsSuccessful>(_searchProductsSuccessful),
  TypedReducer<ProductsState, SetSelectedCategory>(_setSelectedCategory),
]);

ProductsState _getProductsSuccessful(ProductsState state, GetProductsSuccessful action) {
  return state.rebuild((ProductsStateBuilder b) => b.products = ListBuilder<Product>(action.products));
}

ProductsState _searchProductsSuccessful(ProductsState state, SearchProductsSuccessful action) {
  return state.rebuild((ProductsStateBuilder b) => b.searchedProducts = ListBuilder<Product>(action.products));
}

ProductsState _setSelectedCategory(ProductsState state, SetSelectedCategory action) {
  return state.rebuild((ProductsStateBuilder b) => b.selectedCategory = action.category);
}
