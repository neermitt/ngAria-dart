/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */
part of angular.aria.directives;

@Decorator(selector: '[ng-hide]')
class NgHide {
  final dom.Element element;
  final Scope scope;
  bool userSpecified;

  NgHide(dom.Element this.element, Scope this.scope) {
    userSpecified = element.attributes.containsKey('aria-hidden');
  }

  @NgOneWay('ng-hide')
  set hide(value) {
    if (!userSpecified) {
      scope.rootScope.domWrite(() =>element.setAttribute('aria-hidden', toBool(value).toString()));
    }
  }
}

@Decorator(selector: '[ng-show]')
class NgShow {
  final dom.Element element;
  final Scope scope;
  bool userSpecified;

  NgShow(dom.Element this.element, Scope this.scope) {
    userSpecified = element.attributes.containsKey('aria-hidden');
  }

  @NgOneWay('ng-show')
  set show(value) {
    if (!userSpecified) {
      scope.rootScope.domWrite(() =>element.setAttribute('aria-hidden', (!toBool(value)).toString()));
    }
  }
}