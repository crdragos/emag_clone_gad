import 'package:cached_network_image/cached_network_image.dart';
import 'package:emag_clone_gad/src/containers/index.dart';
import 'package:emag_clone_gad/src/models/products/index.dart';
import 'package:emag_clone_gad/src/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectedProductContainer(
      builder: (BuildContext context, Product product) {
        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
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
              Row(
                children: <Widget>[
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
                                    FontAwesomeIcons.solidStar,
                                    color: isColored ? Colors.amber : null,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            '${product.review.toStringAsFixed(1)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '${product.price.toStringAsFixed(2)} lei',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
