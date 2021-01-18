import 'package:emag_clone_gad/src/containers/auth/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UserContainer(
          builder: (BuildContext context, AppUser user) {
            return Row(
              children: <Widget>[
                if (user.photoUrl != null) CircleAvatar(backgroundImage: NetworkImage(user.photoUrl)),
                const SizedBox(width: 8.0),
                Text(user.displayName),
              ],
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(const Logout());
            },
          ),
        ],
      ),
    );
  }
}
