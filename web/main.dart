/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

library angular.aria.demo;

import 'dart:html' as dom;
import 'dart:convert';
import 'dart:collection';

import 'package:angular/angular.dart';
import 'package:angular/change_detection/change_detection.dart';
import 'package:angular/application_factory.dart';
import 'package:angular_aria/ngaria.dart';

part 'directives/show_attrs.dart';
part 'directives/custom_checkbox.dart';

void main() {
  applicationFactory()
  .addModule(new DemoModule())
  .run();
}

class DemoModule extends Module {

  DemoModule() {
    install(new AngularAriaModule());

    bind(ShowAttributeDirective, toValue:false);
    bind(CustomCheckbox, toValue:false);
  }
}