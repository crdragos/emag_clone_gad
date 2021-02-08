import 'package:emag_clone_gad/src/actions/index.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:flutter/cupertino.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add review'),
        centerTitle: true,
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
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Give a mark',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List<Widget>.generate(
                          5,
                          (int index) {
                            final bool isColored = index < _mark;
                            return IconButton(
                              icon: Icon(
                                isColored ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                                color: isColored ? Colors.amber : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() => _mark = index + 1);
                              },
                            );
                          },
                        ),
                      ),
                    ],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Review',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    const Divider(),
                    TextField(
                      controller: _controller,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Describe your experience',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.blue,
              child: const Text(
                'Publish',
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(CreateReview(_controller.text, _mark));
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
