import 'package:emag_clone_gad/src/data/auth_api.dart';
import 'package:emag_clone_gad/src/data/products_api.dart';
import 'package:emag_clone_gad/src/epics/auth_epics.dart';
import 'package:emag_clone_gad/src/epics/products_epics.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:meta/meta.dart';

class AppEpics {
  const AppEpics({@required AuthApi authApi, @required ProductsApi productsApi})
      : assert(authApi != null),
        assert(authApi != null),
        _authApi = authApi,
        _productsApi = productsApi;

  final AuthApi _authApi;
  final ProductsApi _productsApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      AuthEpics(api: _authApi).epics,
      ProductsEpics(api: _productsApi).epics,
    ]);
  }
}
