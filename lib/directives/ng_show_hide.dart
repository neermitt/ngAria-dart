/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */
part of angular.aria.directive;

@Decorator(
    selector: '[ng-hide]',
    map: const {
        'ng-hide': '=>hide'
    })
class NgHide {
  final dom.Element element;
  final bool ignore;

  NgHide(dom.Element element) : element = element,
  ignore = element.attributes.containsKey('aria-hidden') {
  }

  set hide(value) {
    if (!ignore) {
      element.setAttribute('aria-hidden', toBool(value).toString());
    }
  }
}

@Decorator(
    selector: '[ng-show]',
    map: const {
        'ng-show': '=>show'
    })
class NgShow {
  final dom.Element element;
  final bool ignore;

  NgShow(dom.Element element) : element = element,
  ignore = element.attributes.containsKey('aria-hidden') {
  }

  set show(value) {
    if (!ignore) {
      element.setAttribute('aria-hidden', (!toBool(value)).toString());
    }
  }
}