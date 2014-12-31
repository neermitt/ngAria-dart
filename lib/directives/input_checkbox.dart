/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: 'input[type=checkbox][ng-model]', map: const {
    'ng-model': '=>value'
})
@Decorator(selector: '[role=checkbox][ng-model]', map: const {
    'ng-model': '=>value'
})
@Decorator(selector: '[role=menuitemcheckbox][ng-model]', map: const {
    'ng-model': '=>value'
})
class InputCheckbox extends NgAriaDirective {
  final NgTrueValue trueValue;

  InputCheckbox(dom.Element element, Scope scope, NgTrueValue this.trueValue): super(element, scope, 'aria-checked') {
  }

  String resolveValue(value) {
    return trueValue.isValue(value).toString();
  }
}