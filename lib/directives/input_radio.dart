/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: 'input[type=radio][ng-model]')
class InputRadio {
  final Scope scope;
  final dom.Element element;
  final NgValue ngValue;
  bool userSpecified;

  InputRadio(dom.Element this.element, Scope this.scope, NgValue this.ngValue) {
    userSpecified = element.attributes.containsKey('aria-checked');
  }

  @NgOneWay('ng-model')
  set modelValue(value) {
    if(!userSpecified) {
      scope.rootScope.domWrite(() => element.setAttribute('aria-checked', (value == ngValue.value).toString()));
    }
  }
}