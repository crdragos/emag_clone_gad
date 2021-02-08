import 'package:cached_network_image/cached_network_image.dart';
import 'package:emag_clone_gad/src/containers/index.dart';
import 'package:emag_clone_gad/src/models/products/index.dart';
import 'package:emag_clone_gad/src/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key key}) : super(key: key);

  String _getState(ProductState productState) {
    switch (productState) {
      case ProductState.inStock:
        return 'In stock';
      case ProductState.lastItem:
        return 'Last item';
      case ProductState.outOfStock:
        return 'Out of stock';
      default:
        throw FallThroughError();
    }
  }

  Color _getColor(ProductState productState) {
    switch (productState) {
      case ProductState.inStock:
        return Colors.green;
      case ProductState.lastItem:
        return Colors.orange;
      case ProductState.outOfStock:
        return Colors.red;
      default:
        throw FallThroughError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectedProductContainer(
      builder: (BuildContext context, Product product) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product details'),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .4,
                child: PhotoViewGallery.builder(
                  itemCount: product.images.length,
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: CachedNetworkImageProvider(product.images[index]),
                    );
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Row(
                        children: const <Widget>[
                          Icon(FontAwesomeIcons.heart),
                          SizedBox(width: 8.0),
                          Text(
                            'Favorite',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Row(
                        children: const <Widget>[
                          Icon(FontAwesomeIcons.balanceScale),
                          SizedBox(width: 8.0),
                          Text(
                            'Compare',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Row(
                        children: const <Widget>[
                          Icon(FontAwesomeIcons.shareSquare),
                          SizedBox(width: 8.0),
                          Text(
                            'Share',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      '${product.title}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${product.description}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${product.price.toStringAsFixed(2)} \$',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Availability',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          _getState(product.productState),
                          style: TextStyle(color: _getColor(product.productState)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.productReview);
                        },
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: List<Widget>.generate(
                                5,
                                (int index) {
                                  final bool isColored = index < product.review.round();
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      isColored ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                                      color: isColored ? Colors.amber : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              '${product.review.toStringAsFixed(1)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
