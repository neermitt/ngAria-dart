/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */
part of angular.aria.directive;

@Decorator(
    selector: '[ng-hide]',
    map: const {'ng-hide': '=>hide'})
class NgHide {
  final dom.Element element;
  final Animate animate;

  NgHide(this.element, this.animate);

  set hide(value) {
    if (toBool(value)) {
      element.setAttribute('aria-hidden', 'true');
    } else {
      element.setAttribute('aria-hidden', 'false');
    }
  }
}

@Decorator(
    selector: '[ng-show]',
    map: const {'ng-show': '=>show'})
class NgShow {
  final dom.Element element;
  final Animate animate;

  NgShow(this.element, this.animate);

  set show(value) {
    if (toBool(value)) {
      element.setAttribute('aria-hidden', 'false');
    } else {
      element.setAttribute('aria-hidden', 'true');
    }
  }
}