/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector:'[ng-model]')
class NgModelAria {

  NgModelAria(dom.Element element, Scope scope, NgModel model) {

    if(!element.attributes.containsKey('aria-invalid')) {

      Scope childScope = scope.createProtoChild();

      childScope.context['isInvalid'] = () => model.invalid;

      childScope.watch('isInvalid()', (value, _) {
        scope.domWrite(() => element.setAttribute('aria-invalid', toBool(value).toString()));
      }, canChangeModel: false);
    }
  }
}
