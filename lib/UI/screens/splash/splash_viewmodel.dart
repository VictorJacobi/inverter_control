import 'package:project_iot/app/app.locator.dart';
import 'package:project_iot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel{
  // SplashViewModel(
  //     this._navigationService
  //     );
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> changeScreen() async {
    await Future.delayed(const Duration(seconds: 4, milliseconds: 400))
        .then((value) async {
          _navigationService.replaceWithLoginView();
    });
  }
}