/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;


@Decorator(selector: 'input[type=radio][ng-model]', map: const {
    'ng-model': '=>value'
})
class InputRadio extends NgAriaDirective {
  final NgValue _ngValue;

  InputRadio(dom.Element element, Scope scope, NgValue this._ngValue) : super(element, scope, 'aria-checked') {
  }

  String resolveValue(value) {
    return (value == _ngValue.value).toString();
  }
}

@Decorator(selector: '[role=radio][ng-model]', module: NgRoleValue.module, map: const {
    'ng-model': '=>value'
})
@Decorator(selector: '[role=menuitemradio][ng-model]', module: NgRoleValue.module, map: const {
    'ng-model': '=>value'
})
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