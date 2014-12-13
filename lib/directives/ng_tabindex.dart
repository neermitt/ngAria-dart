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
class NgTabindex {

  NgTabindex(dom.Element element, Scope scope) {
    if (!element.attributes.containsKey('tabindex')) {
      scope.domWrite(() => element.setAttribute('tabindex', '0'));
    }
  }
}