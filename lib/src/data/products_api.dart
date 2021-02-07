import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emag_clone_gad/src/models/index.dart';
import 'package:flutter/cupertino.dart';

class ProductsApi {
  const ProductsApi({@required FirebaseFirestore firestore})
      : assert(firestore != null),
        _firestore = firestore;

  final FirebaseFirestore _firestore;

  Future<List<Product>> getProducts() async {
    final QuerySnapshot snapshot = await _firestore.collection('products').get();
    return snapshot.docs //
        .map((QueryDocumentSnapshot item) => Product.fromJson(item.data()))
        .toList();
  }

  Future<List<Product>> searchProducts(String query) async {
    final QuerySnapshot snapshot = await _firestore
        .collection('products') //
        .where('searchIndex', arrayContains: query)
        .get();

    return snapshot.docs //
        .map((QueryDocumentSnapshot item) => Product.fromJson(item.data()))
        .toList();
  }

  Future<void> createReview(String productId, String uid, String text, int mark) async {
    final DocumentReference ref = _firestore.collection('/reviews').doc();

    final ProductReview review = ProductReview((ProductReviewBuilder b) {
      b
        ..id = ref.id
        ..productId = productId
        ..uid = uid
        ..text = text
        ..mark = mark;
    });

    await ref.set(review.json);
  }
}
