import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/actions/products/index.dart';
import 'package:emag_clone_gad/src/data/products_api.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class ProductsEpics {
  const ProductsEpics({@required ProductsApi api})
      : assert(api != null),
        _api = api;

  final ProductsApi _api;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetProducts$>(_getProducts),
      TypedEpic<AppState, SearchProducts$>(_serachProducts),
    ]);
  }

  Stream<AppAction> _getProducts(Stream<GetProducts$> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((GetProducts$ action) => Stream<GetProducts$>.value(action)
            .asyncMap((GetProducts$ action) => _api.getProducts())
            .map((List<Product> products) => GetProducts.successful(products))
            .onErrorReturnWith((dynamic error) => GetProducts.error(error)));
  }

  Stream<AppAction> _serachProducts(Stream<SearchProducts$> actions, EpicStore<AppState> store) {
    return actions //
        .debounceTime(const Duration(milliseconds: 500))
        .switchMap((SearchProducts$ action) => Stream<SearchProducts$>.value(action)
            .asyncMap((SearchProducts$ action) => _api.searchProducts(action.query))
            .map((List<Product> products) => SearchProducts.successful(products))
            .onErrorReturnWith((dynamic error) => SearchProducts.error(error)));
  }
}
