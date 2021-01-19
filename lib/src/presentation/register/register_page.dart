import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/presentation/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        decoration: const InputDecoration(hintText: 'email'),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String value) {
                          StoreProvider.of<AppState>(context).dispatch(UpdateRegisterInfo(email: value));
                        },
                        validator: (String value) {
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Please enter a valid email address';
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
                            color: Colors.greenAccent,
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              if (Form.of(context).validate()) {
                                Navigator.pushNamed(context, AppRoutes.displayName);
                              }
                            },
                          ),
                        ),
                      ),
                      const Divider(),
                      Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
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
      ),
    );
  }
}
