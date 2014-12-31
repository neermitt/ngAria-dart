/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */
part of angular.aria.directives;

@Decorator(selector: '[ng-hide]', map: const {
    'ng-hide': '=>value'
})
class NgHide extends NgAriaDirective {

  NgHide(dom.Element element, Scope scope): super(element, scope, 'aria-hidden');
}

@Decorator(selector: '[ng-show]', map: const {
    'ng-show': '=>value'
})
class NgShow extends NgAriaDirective {

  NgShow(dom.Element element, Scope scope): super(element, scope, 'aria-hidden');

  String resolveValue(value) {
    return (!value).toString();
  }
}