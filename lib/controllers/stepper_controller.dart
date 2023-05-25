import 'dart:io';

import 'package:flutter/material.dart';

class MyStepperController extends ChangeNotifier {
  int currentStep = 0;
  String? name;
  int? contact;
  String? email;
  String? web;

  File? image;

  void stepIncrease() {
    if (currentStep < 4) {
      currentStep++;
    }
    print("Step: $currentStep");
    notifyListeners();
  }

  void stepDecrease() {
    if (currentStep > 0) {
      currentStep--;
    }
    print("Step: $currentStep");
    notifyListeners();
  }

  void stepTapped({required int index}) {
    currentStep = index;
    print("Step: $currentStep");
    notifyListeners();
  }

  bool isStepActive({required int index}) {
    return currentStep == index;
  }

  void setImage({required File img}) {
    image = img;
    notifyListeners();
  }

  StepState myState({required int index}) {
    return currentStep > index
        ? StepState.complete
        : currentStep == index
            ? StepState.editing
            : StepState.disabled;
  }
}
