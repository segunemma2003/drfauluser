import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/welcome_tab_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class OnboardingNavigationHub extends NyStatefulWidget
    with BottomNavPageControls {
  static RouteView path = ("/onboarding", (_) => OnboardingNavigationHub());

  OnboardingNavigationHub()
      : super(
            child: () => _OnboardingNavigationHubState(),
            stateName: path.stateName());

  /// State actions
  static NavigationHubStateActions stateActions =
      NavigationHubStateActions(path.stateName());
}

class _OnboardingNavigationHubState
    extends NavigationHub<OnboardingNavigationHub> {
  /// Layouts:
  /// - [NavigationHubLayout.bottomNav] Bottom navigation
  /// - [NavigationHubLayout.topNav] Top navigation
  /// - [NavigationHubLayout.journey] Journey navigation
  NavigationHubLayout? layout = NavigationHubLayout.journey(
      // backgroundColor: Colors.white,
      );

  /// Should the state be maintained
  @override
  bool get maintainState => true;

  /// Navigation pages
  _OnboardingNavigationHubState()
      : super(() async {
          /// * Creating Navigation Tabs
          /// [Navigation Tabs] 'dart run nylo_framework:main make:stateful_widget home_tab,settings_tab'
          /// [Journey States] 'dart run nylo_framework:main make:journey_widget welcome_tab,users_dob,users_info --parent=Onboarding'
          return {
            0: NavigationTab.journey(page: WelcomeTab()),
          };
        });

  /// Handle the tap event
  @override
  onTap(int index) {
    super.onTap(index);
  }
}
