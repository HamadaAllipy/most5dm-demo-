abstract class AddAdsStates{}

class InitialAddAdsStates extends AddAdsStates{}

class SuccessSelectedImage extends AddAdsStates{}
class ErrorSelectedImage extends AddAdsStates{
  final String error;

  ErrorSelectedImage(this.error);

}