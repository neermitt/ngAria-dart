/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;


abstract class NgAriaDirective {
  final Scope _scope;
  final dom.Element _element;
  final String _attrName;
  bool _userProvidedAttribute;

  NgAriaDirective(dom.Element this._element, Scope this._scope, String this._attrName) {
    _userProvidedAttribute = _element.attributes.containsKey(_attrName);
  }

  set value(value) {
    _setAttributeValue(value);
  }

  String resolveValue(value) {
    return value == null ? null : value.toString();
  }

  _setAttributeValue(value) {
    if (!_userProvidedAttribute) {
      _scope.domWrite(() => _element.setAttribute(_attrName, resolveValue(value)));
    }
  }
}

abstract class NgAriaWatchDirective extends NgAriaDirective implements AttachAware, DetachAware {
  final NgModel _model;
  Watch _watch;

  NgAriaWatchDirective(dom.Element element, Scope scope, NgModel this._model, String attrName) : super(element, scope, attrName) {
  }

  void attach() {
    _watch = _scope.watch('ngAriaWatch()', (value, _) => _setAttributeValue(value), context: {
        'ngAriaWatch' : () => expression
    }, canChangeModel: false);
  }

  void detach() {
    _watch.remove();
  }

  dynamic get expression;
}