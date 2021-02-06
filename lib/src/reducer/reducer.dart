import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/reducer/auth_reducer.dart';
import 'package:emag_clone_gad/src/reducer/products_reducer.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  _reducer,
  TypedReducer<AppState, LogoutSuccessful>(_logoutSuccessful),
]);

AppState _reducer(AppState state, dynamic action) {
  print(action);
  return state.rebuild((AppStateBuilder b) {
    b
      ..auth = authReducer(state.auth, action).toBuilder()
      ..products = productsReducer(state.products, action).toBuilder();
  });
}

AppState _logoutSuccessful(AppState state, LogoutSuccessful action) {
  return AppState.initialState();
}
