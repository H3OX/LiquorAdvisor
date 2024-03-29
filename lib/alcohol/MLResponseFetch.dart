import 'HomePage.dart';

double processResponse(String MLResponse) {
  if (HomePageState.effect == 1) {
    return (double.parse(MLResponse) / 4);
  } else if (HomePageState.effect == 2) {
    return (double.parse(MLResponse) / 2);
  } else if (HomePageState.effect == 3) {
    return (double.parse(MLResponse) * 0.75);
  } else {
    if (MLResponse.contains('\n')) {
      return double.parse(MLResponse.replaceAll('\n', ''));
    } else {
      return double.parse(MLResponse);
    }
  }
}
