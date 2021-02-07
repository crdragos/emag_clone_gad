part of products_models;

abstract class ProductReview implements Built<ProductReview, ProductReviewBuilder> {
  factory ProductReview([void Function(ProductReviewBuilder b) updates]) = _$ProductReview;
  factory ProductReview.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  ProductReview._();

  String get id;

  String get productId;

  String get uid;

  @nullable
  String get text;

  int get mark;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>;

  static Serializer<ProductReview> get serializer => _$productReviewSerializer;
}
