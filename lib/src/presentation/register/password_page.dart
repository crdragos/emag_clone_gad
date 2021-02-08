import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/presentation/mixins/dialog_mixin.dart';
import 'package:emag_clone_gad/src/presentation/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PasswordPage extends StatelessWidget with DialogMixin {
  const PasswordPage({Key key}) : super(key: key);

  void _onResponse(BuildContext context, AppAction action) {
    if (action is RegisterSuccessful) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false);
    } else if (action is RegisterError) {
      showError(context, 'Register failed', action.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Builder(
              builder: (BuildContext context) {
                return Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'password'),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (String value) {
                        StoreProvider.of<AppState>(context).dispatch(UpdateRegisterInfo(password: value));
                      },
                      validator: (String value) {
                        if (value.length < 6) {
                          return 'Please enter a better password';
                        }
                        return null;
                      },
                    ),
                    const Spacer(),
                    Container(
                      width: 250.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.blue,
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            if (Form.of(context).validate()) {
                              StoreProvider.of<AppState>(context).dispatch(Register((AppAction action) {
                                _onResponse(context, action);
                              }));
                            }
                          },
                        ),
                      ),
                    ),
                    const Divider(),
                    Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(fontSize: 16.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Login',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.popUntil(context, ModalRoute.withName(AppRoutes.home));
                                }),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
