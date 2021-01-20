part of products_actions;

@freezed
abstract class GetProducts with _$GetProducts implements AppAction {
  const factory GetProducts() = GetProducts$;

  const factory GetProducts.successful(List<Product> products) = GetProductsSuccessful;

  @Implements(ErrorAction)
  const factory GetProducts.error(Object error) = GetProductsError;
}
