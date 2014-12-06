/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(
    selector: '[ng-model][required]')
@Decorator(
    selector: '[ng-model][ng-required]')
class NgRequiredAria {


  NgRequiredAria(dom.Element element, Scope scope, NgModel ngModel) {

    if (!element.attributes.containsKey('aria-required')) {
      Scope child = scope.createProtoChild();
      child.context['ngAriaRequiredWatch'] = () => ngModel.hasErrorState('ng-required');

      child.watch('ngAriaRequiredWatch()', (value, _) {
        scope.domWrite(() => element.setAttribute('aria-required', toBool(value).toString()));
      }, canChangeModel:false);
    }
  }

}