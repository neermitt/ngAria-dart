/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: 'input[type=range][ng-model]')
@Decorator(selector: '[role=progressbar][ng-model]')
@Decorator(selector: '[role=slider][ng-model]')
class NgAriaValue {
  Scope _scope;
  dom.Element _element;
  bool _userOverridenValue;

  NgAriaValue(dom.Element this._element, Scope this._scope) {
    if (!_element.attributes.containsKey('aria-valuemin')) {
      _scope.domWrite(() => _element.setAttribute('aria-valuemin', _element.getAttribute('min')));
    }
    if (!_element.attributes.containsKey('aria-valuemax')) {
      _scope.domWrite(() => _element.setAttribute('aria-valuemax', _element.getAttribute('max')));
    }
    _userOverridenValue = _element.attributes.containsKey('aria-valuenow');
  }

  @NgOneWay('ng-model')
  set modelValue(value) {
    if (!_userOverridenValue) {
      _scope.domWrite(() => _element.setAttribute('aria-valuenow', value == null ? null : value.toString()));
    }
  }

}