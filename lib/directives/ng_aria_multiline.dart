/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.directives;

@Decorator(selector: '[role=textbox][ng-model]')
@Decorator(selector: 'textarea[ng-model]')
class NgAriaMultiline extends NgAriaDirective implements AttachAware {

  NgAriaMultiline(dom.Element element, Scope scope) : super(element, scope, 'aria-multiline') {
  }

  void attach() {
    _setAttributeValue('true');
  }

}