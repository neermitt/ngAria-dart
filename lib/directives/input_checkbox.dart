/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: 'input[type=checkbox][ng-model]')
class InputCheckbox {
  final Scope scope;
  final dom.Element element;
  final NgTrueValue trueValue;
  bool userSpecified;

  InputCheckbox(dom.Element this.element, Scope this.scope, NgTrueValue this.trueValue) {
    userSpecified = element.attributes.containsKey('aria-checked');
  }

  @NgOneWay('ng-model')
  set modelValue(value) {
    if(!userSpecified) {
      scope.rootScope.domWrite(() => element.setAttribute('aria-checked', trueValue.isValue(value).toString()));
    }
  }
}