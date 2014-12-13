/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;


@Decorator(selector: 'input[type=radio][ng-model]')
class InputRadio {
  final Scope _scope;
  final dom.Element _element;
  final NgValue _ngValue;
  bool _disableAriaChecked;
  bool _disableTabindex;

  InputRadio(dom.Element this._element, Scope this._scope, NgValue this._ngValue) {
    _disableAriaChecked = _element.attributes.containsKey('aria-checked');
    _disableTabindex = _element.attributes.containsKey('tabindex');
  }

  @NgOneWay('ng-model')
  set modelValue(value) {
    var isSelected = value == _ngValue.value;
    if (!_disableAriaChecked) {
      _scope.domWrite(() => _element.setAttribute('aria-checked', isSelected.toString()));
    }

    if (!_disableTabindex) {
      _scope.domWrite(() => _element.setAttribute('tabindex', isSelected ? '0' : '-1'));
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