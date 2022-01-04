import 'dart:async';
import 'package:flutter/material.dart';

//1
class FooderlichTab{
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier{
  //2
  bool _initialized = false;
  //3
  bool _loggedIn = false;
  //4
  bool _onBoardingComplete = false;
  //5
  int _selectedTab = FooderlichTab.explore;

  //6
  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get inOnboardingComplete => _onBoardingComplete;
  int get getSelectedTab => _selectedTab;

  // TODO: Add initializeApp
  void initialized(){
    //7
    Timer(const Duration(milliseconds: 2000), (){
      //8
      _initialized = true;
      //9
      notifyListeners();
    }
    );
  }
  // TODO: Add login
  void login(String username, String password){
    //10
    _loggedIn = true;
    //11
    notifyListeners();
  }

  // TODO: Add completeOnboarding
  void completeOnboarding(){
    _onBoardingComplete = true;
    notifyListeners();
  }

  // TODO: Add goToTab
  void goToTab(index){
    _selectedTab = index;
    notifyListeners();
  }

  // TODO: Add goToRecipes
  void goToRecipes(){
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }

  // TODO: Add logout
  void logout(){
    //12
    _loggedIn = false;
    _onBoardingComplete = false;
    _initialized = false;
    _selectedTab = 0;

    //13
    initialized();
    //14
    notifyListeners();
  }
}