/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */
library angular_aria_test;


import 'package:guinness/guinness_html.dart';
import 'dart:async';
import 'dart:html' as dom;

import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import 'package:angular/mock/test_injection.dart';

main() {
  guinnessEnableHtmlMatchers();

  guinness.initSpecs();
}

loadTemplates(List<String> templates) {
  updateCache(template, response) => inject((TemplateCache cache) => cache.put(template, response));

  final futures = templates.map((template) =>
  dom.HttpRequest.request('packages/angular_ui/' + template, method: "GET").
  then((_) => updateCache(template, new HttpResponse(200, _.response))));

  return Future.wait(futures);
}

compileComponent(String html, Map scope, callback) {
  return async(() {
    inject((TestBed tb) {
      final s = tb.rootScope.createChild(scope);
      final el = tb.compile('<div>$html</div>', scope: s);

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