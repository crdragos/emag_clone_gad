part of products_actions;

@freezed
abstract class SetSelectedCategory with _$SetSelectedCategory implements AppAction {
  const factory SetSelectedCategory(String category) = SetSelectedCategory$;
}

@freezed
abstract class SetSelectedProductId with _$SetSelectedProductId implements AppAction {
  const factory SetSelectedProductId(String productId) = SetSelectedProductId$;
}
