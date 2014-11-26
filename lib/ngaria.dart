/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

library angular.aria;

import 'package:angular/angular.dart';

import 'package:angular_aria/directives/module.dart';

/*
 * Angular Aria Module
 */
class AngularAriaModule extends Module {

  AngularAriaModule() {
    install(new AngularAriaDirectivesModule());
  }
}