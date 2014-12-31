/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: 'input[type=range][ng-model]', map: const {
    'ng-model': '=>value'
})
@Decorator(selector: '[role=progressbar][ng-model]', map: const {
    'ng-model': '=>value'
})
@Decorator(selector: '[role=slider][ng-model]', map: const {
    'ng-model': '=>value'
})
class NgAriaValue extends NgAriaDirective {

  NgAriaValue(dom.Element element, Scope scope) : super(element, scope, 'aria-valuenow') {
  }

}

@Decorator(selector: 'input[type=range][ng-model][min]', map: const {
    'min': '=>!value'
})
@Decorator(selector: '[role=progressbar][ng-model][min]', map: const {
    'min': '=>!value'
})
@Decorator(selector: '[role=slider][ng-model][min]', map: const {
    'min': '=>!value'
})
class NgAriaMinValue extends NgAriaDirective {
  NgAriaMinValue(dom.Element element, Scope scope) : super(element, scope, 'aria-valuemin') {
  }

}

@Decorator(selector: 'input[type=range][ng-model][max]', map: const {
    'max': '=>!value'
})
@Decorator(selector: '[role=progressbar][ng-model][max]', map: const {
    'max': '=>!value'
})
@Decorator(selector: '[role=slider][ng-model][max]', map: const {
    'max': '=>!value'
})
class NgAriaMaxValue extends NgAriaDirective {

  NgAriaMaxValue(dom.Element element, Scope scope) : super(element, scope, 'aria-valuemax') {
  }

}