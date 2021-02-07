import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductReviewPage extends StatefulWidget {
  const ProductReviewPage({Key key}) : super(key: key);

  @override
  _ProductReviewPageState createState() => _ProductReviewPageState();
}

class _ProductReviewPageState extends State<ProductReviewPage> {
  final TextEditingController _controller = TextEditingController();

  int _mark = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add review'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List<Widget>.generate(
                      5,
                      (int index) {
                        final bool isColored = index < _mark;
                        return IconButton(
                          icon: Icon(
                            isColored ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                            color: isColored ? Colors.amber : null,
                          ),
                          onPressed: () {
                            setState(() => _mark = index + 1);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Review',
                  ),
                ),
              ),
            ),
          ),
          RaisedButton(
            child: const Text('Publish'),
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(CreateReview(_controller.text, _mark));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
