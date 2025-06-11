import '/resources/pages/profile_photo_page.dart';
import '/resources/pages/address_information_page.dart';
import '/resources/pages/personal_information_page.dart';
import '/resources/pages/verify_signup_page.dart';
import '/resources/pages/signup_page.dart';
import '/resources/pages/signin_page.dart';
import '/resources/pages/not_found_page.dart';
import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* App Router
|--------------------------------------------------------------------------
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
|
| * [Tip] Add authentication 🔑
| Run the below in the terminal to add authentication to your project.
| "dart run scaffold_ui:main auth"
|
| * [Tip] Add In-app Purchases 💳
| Run the below in the terminal to add In-app Purchases to your project.
| "dart run scaffold_ui:main iap"
|
| Learn more https://nylo.dev/docs/6.x/router
|-------------------------------------------------------------------------- */

appRouter() => nyRoutes((router) {
      router.add(HomePage.path);

      // Add your routes here ...
      // router.add(NewPage.path, transitionType: TransitionType.fade());

      // Example using grouped routes
      // router.group(() => {
      //   "route_guards": [AuthRouteGuard()],
      //   "prefix": "/dashboard"
      // }, (router) {
      //
      // });
      router.add(NotFoundPage.path).unknownRoute();
      router.add(SigninPage.path);
      router.add(SignupPage.path);
      router.add(VerifySignupPage.path);
      router.add(PersonalInformationPage.path).initialRoute();
      router.add(AddressInformationPage.path);
  router.add(ProfilePhotoPage.path);
});
