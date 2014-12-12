/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: '[role=textbox][ng-model]')
@Decorator(selector: 'textarea[ng-model]')
class NgAriaMultiline {

  NgAriaMultiline(dom.Element element, Scope scope) {
    if (!element.attributes.containsKey('aria-multiline')) {
      scope.domWrite(() => element.setAttribute('aria-multiline', 'true'));
    }
  }

}