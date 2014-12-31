/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: '[ng-disabled]', map: const {
    'ng-disabled': '=>value'
})
class NgDisabled extends NgAriaDirective {

  NgDisabled(dom.Element element, Scope scope) : super(element, scope, 'aria-disabled') {
  }

}