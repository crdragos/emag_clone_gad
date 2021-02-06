import 'package:emag_clone_gad/src/data/auth_api.dart';
import 'package:emag_clone_gad/src/models/auth/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class AuthEpics {
  const AuthEpics({@required AuthApi api})
      : assert(api != null),
        _api = api;

  final AuthApi _api;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, Login$>(_login),
      TypedEpic<AppState, Register$>(_register),
      TypedEpic<AppState, LoginWithGoogle$>(_loginWithGoogle),
      TypedEpic<AppState, Logout$>(_logout),
      TypedEpic<AppState, ResetPassword$>(_resetPassword),
      TypedEpic<AppState, InitializeApp$>(_initializeApp),
      TypedEpic<AppState, UpdateCart$>(_updateCart),
    ]);
  }

  Stream<AppAction> _login(Stream<Login$> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((Login$ action) => Stream<Login$>.value(action)
            .asyncMap((Login$ action) => _api.login(email: action.email, password: action.password))
            .expand((AppUser user) => <AppAction>[
                  Login.successful(user),
                  const GetProducts(),
                ])
            .onErrorReturnWith((dynamic error) => Login.error(error))
            .doOnData(action.response));
  }

  Stream<AppAction> _register(Stream<Register$> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((Register$ action) => Stream<Register$>.value(action)
            .asyncMap((Register$ action) => _api.register(
                  email: store.state.auth.info.email,
                  password: store.state.auth.info.password,
                  displayName: store.state.auth.info.displayName ?? store.state.auth.info.email.split('@').first,
                ))
            .expand((AppUser user) => <AppAction>[
                  Register.successful(user),
                  const GetProducts(),
                ])
            .onErrorReturnWith((dynamic error) => Register.error(error))
            .doOnData(action.response));
  }

  Stream<AppAction> _loginWithGoogle(Stream<LoginWithGoogle$> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((LoginWithGoogle$ action) => Stream<LoginWithGoogle$>.value(action)
            .asyncMap((LoginWithGoogle$ action) => _api.loginWithGoogle())
            .expand((AppUser user) => <AppAction>[
                  LoginWithGoogle.successful(user),
                  const GetProducts(),
                ])
            .onErrorReturnWith((dynamic error) => LoginWithGoogle.error(error))
            .doOnData(action.response));
  }

  Stream<AppAction> _logout(Stream<Logout$> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((Logout$ action) => Stream<Logout$>.value(action)
            .asyncMap((Logout$ action) => _api.logout())
            .map((_) => const Logout.successful())
            .onErrorReturnWith((dynamic error) => Logout.error(error)));
  }

  Stream<AppAction> _resetPassword(Stream<ResetPassword$> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((ResetPassword$ action) => Stream<ResetPassword$>.value(action)
            .asyncMap((ResetPassword$ action) => _api.resetPassword(email: action.email))
            .map((_) => const ResetPassword.successful())
            .onErrorReturnWith((dynamic error) => ResetPassword.error(error)));
  }

  Stream<AppAction> _initializeApp(Stream<InitializeApp$> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((InitializeApp$ action) => Stream<InitializeApp$>.value(action)
            .asyncMap((InitializeApp$ action) => _api.initializeApp())
            .expand((AppUser user) => <AppAction>[
                  InitializeApp.successful(user),
                  const GetProducts(),
                ])
            .onErrorReturnWith((dynamic error) => InitializeApp.error(error)));
  }

  Stream<AppAction> _updateCart(Stream<UpdateCart$> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((UpdateCart$ action) => Stream<UpdateCart$>.value(action)
            .asyncMap((UpdateCart$ action) => _api.updateCart(store.state.auth.user.uid, action.cart))
            .map((_) => UpdateCart.successful(action.cart))
            .onErrorReturnWith((dynamic error) => UpdateCart.error(error)));
  }
}
