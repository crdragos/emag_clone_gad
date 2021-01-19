import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/presentation/mixins/dialog_mixin.dart';
import 'package:emag_clone_gad/src/presentation/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with DialogMixin {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  void _response(AppAction action) {
    if (action is LoginError) {
      showError(context, 'Login failed', action.error);
    } else if (action is LoginWithGoogleError) {
      showError(context, 'Google login failed', action.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Builder(
              builder: (BuildContext context) {
                return Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(hintText: 'email'),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {},
                      validator: (String value) {
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const Divider(),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(hintText: 'password'),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (String value) {},
                      validator: (String value) {
                        if (value.length < 6) {
                          return 'Pleas try a longer password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: 250.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.greenAccent,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            if (Form.of(context).validate()) {
                              StoreProvider.of<AppState>(context).dispatch(Login(
                                email: _email.text,
                                password: _password.text,
                                response: _response,
                              ));
                            }
                          },
                        ),
                      ),
                    ),
                    FlatButton(
                      child: const Text('Reset Password'),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.resetPassword);
                      },
                    ),
                    const Divider(),
                    const Spacer(),
                    Container(
                      width: 250.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                FontAwesomeIcons.google,
                                color: Color(0xffCE107C),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Login with Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            StoreProvider.of<AppState>(context).dispatch(LoginWithGoogle(_response));
                          },
                        ),
                      ),
                    ),
                    const Divider(),
                    Text.rich(
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: const TextStyle(fontSize: 16.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Register!',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, AppRoutes.register);
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
