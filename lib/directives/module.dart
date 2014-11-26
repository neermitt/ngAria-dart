/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */
library angular.aria.directive;

import 'dart:html' as dom;
import 'package:angular/angular.dart';
import 'package:angular/utils.dart';

part 'ng_show_hide.dart';

/*
 * AngularAria Directives module
 */
class AngularAriaDirectivesModule extends Module{

  AngularAriaDirectivesModule(){
    bind(NgHide, toValue: null);
    bind(NgShow, toValue: null);
  }
}