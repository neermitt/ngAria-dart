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
    if (!userSpecified) {
      scope.rootScope.domWrite(() => element.setAttribute('aria-checked', (value == ngValue.value).toString()));
    }
  }
}

@Decorator(selector: '[role=radio][ng-model]', module: NgRoleValue.module)
@Decorator(selector: '[role=menuitemradio][ng-model]', module: NgRoleValue.module)
class RoleRadio extends InputRadio {
  RoleRadio(dom.Element element, Scope scope, NgRoleValue ngValue): super(element, scope, ngValue);
}

@Decorator(selector: '[role=radio][ng-model][ng-value]', visibility: Visibility.LOCAL)
@Decorator(selector: '[role=menuitemradio][ng-model][ng-value]', visibility: Visibility.LOCAL)
class NgRoleValue extends NgValue {
  static module(DirectiveBinder binder) => binder.bind(NgRoleValue, visibility: Visibility.LOCAL);

  var _value;

  NgRoleValue(dom.Element element): super(element);

  void set value(val) {
    _value = val;
  }

  dynamic get value => _value == null ? element.getAttribute('value') : _value;
}