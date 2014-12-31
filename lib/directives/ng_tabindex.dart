/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: '[role=checkbox][ng-model]')
@Decorator(selector: '[role=button][ng-model]')
@Decorator(selector: '[ng-click]')
@Decorator(selector: '[ng-dblclick]')
class NgAriaTabindex extends NgAriaDirective implements AttachAware {


  NgAriaTabindex(dom.Element element, Scope scope) : super(element, scope, 'tabindex') {
  }

  void attach() {
    _setAttributeValue('0');
  }

}

@Decorator(selector: 'input[type=radio][ng-model]', map: const {
    'ng-model': '=>value'
})
class NgAriaRadioTabindex extends NgAriaTabindex {
  final NgValue _ngValue;

  NgAriaRadioTabindex(dom.Element element, Scope scope, NgValue this._ngValue) : super(element, scope) {
  }

  void attach() {

  }

  String resolveValue(value) {
    return (value == _ngValue.value) ? '0' : '-1';
  }
}

@Decorator(selector: '[role=radio][ng-model]', map: const {
    'ng-model': '=>value'
})
@Decorator(selector: '[role=menuitemradio][ng-model]', map: const {
    'ng-model': '=>value'
})
class NgAriaRadioRoleTabindex extends NgAriaRadioTabindex {

  NgAriaRadioRoleTabindex(dom.Element element, Scope scope, NgRoleValue ngRoleValue) : super(element, scope, ngRoleValue) {
  }
}