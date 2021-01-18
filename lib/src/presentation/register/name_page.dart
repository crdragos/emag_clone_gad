import 'package:emag_clone_gad/src/containers/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/presentation/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NamePage extends StatelessWidget {
  const NamePage({Key key}) : super(key: key);

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
                    RegisterInfoContainer(
                      builder: (BuildContext context, RegisterInfo info) {
                        return TextFormField(
                          decoration: const InputDecoration(hintText: 'username'),
                          keyboardType: TextInputType.name,
                          initialValue: info.email.split('@').first,
                          onChanged: (String value) {
                            StoreProvider.of<AppState>(context).dispatch(UpdateRegisterInfo(displayName: value));
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    const Spacer(),
                    FlatButton(
                      child: const Text('Continue'),
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          Navigator.pushNamed(context, AppRoutes.password);
                        }
                      },
                    ),
                    const Divider(),
                    Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Login',
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
