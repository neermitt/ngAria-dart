/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.demo;

@Decorator(selector : 'my-checkbox')
class CustomCheckbox {

  NgModel model;

  CustomCheckbox(dom.Element element, NgModel this.model) {
    element.onKeyDown.where(_isEnterOrSpace).listen(_onToggle);
    element.onClick.listen(_onToggle);
  }

  bool _isEnterOrSpace(dom.KeyboardEvent event) => event.keyCode == dom.KeyCode.ENTER || event.keyCode == dom.KeyCode.SPACE;

  void _onToggle(dom.UIEvent event) {
    model.viewValue = (model.viewValue == null ? true : !model.viewValue);
  }

}