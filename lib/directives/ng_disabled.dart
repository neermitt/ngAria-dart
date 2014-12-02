/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: '[ng-disabled]')
class NgDisabled {
  final dom.Element element;
  final Scope scope;
  bool userSpecified;

  NgDisabled(dom.Element this.element, Scope this.scope) {
    userSpecified = element.attributes.containsKey('aria-disabled');
  }

  @NgOneWay('ng-disabled')
  set disabled(value) {
    if (!userSpecified) {
      scope.rootScope.domWrite(() => element.setAttribute('aria-disabled', toBool(value).toString()));
    }
  }
}