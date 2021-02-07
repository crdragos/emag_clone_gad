part of products_actions;

@freezed
abstract class CreateReview with _$CreateReview implements AppAction {
  const factory CreateReview(String text, int mark) = CreateReview$;

  const factory CreateReview.successful() = CreateReviewSuccessful;

  @Implements(ErrorAction)
  const factory CreateReview.error(Object error) = CreateReviewError;
}
