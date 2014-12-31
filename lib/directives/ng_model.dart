/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector:'[ng-model]')
class NgModelAria extends NgAriaWatchDirective {

  NgModelAria(dom.Element element, Scope scope, NgModel model): super(element, scope, model, 'aria-invalid') {
  }

  dynamic get expression {
    return _model.invalid;
  }
}
