abstract class AddAdsStates{}

class InitialAddAdsStates extends AddAdsStates{}

class SuccessSelectedImage extends AddAdsStates{}
class ErrorSelectedImage extends AddAdsStates{
  final String error;

  ErrorSelectedImage(this.error);

}
class GetCategoriesSuccessState extends AddAdsStates{}
class GetCategoriesLoadingState extends AddAdsStates{}