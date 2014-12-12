/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

library angular.aria.test;


import 'package:guinness/guinness_html.dart';
import 'dart:html' as dom;

import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import 'package:angular/mock/test_injection.dart';

import 'package:angular_aria/directives/module.dart';

part 'directives/ng_show_hide_spec.dart';
part 'directives/input_checkbox_spec.dart';
part 'directives/input_radio_spec.dart';
part 'directives/ng_disabled_spec.dart';
part 'directives/ng_model_spec.dart';
part 'directives/ng_required_spec.dart';
part 'directives/ng_aria_multiline_spec.dart';

main() {
  guinnessEnableHtmlMatchers();

  testShowHideDirectives();
  testInputCheckboxDirectives();
  testInputRadioDirectives();
  testNgDiabledDirectives();
  testNgModelDirectives();
  testNgRequiredDirectives();
  testAriaMultilineDirectives();

  guinness.initSpecs();
}

compileComponent(String html, Map scope, callback) {
  return async(() {
    inject((TestBed tb) {
      final s = tb.rootScope.createChild(scope);
      final el = tb.compile(html, scope: s);

      microLeap();
      digest();

      callback(s, el);
    });
  });
}

digest() {
  inject((TestBed tb) {
    tb.rootScope.apply();
  });
}