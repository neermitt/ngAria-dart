/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

library angular.aria.directives;

import 'dart:html' as dom;
import 'package:angular/angular.dart';
import 'package:angular/utils.dart';

part 'abstract_ng_aria_directive.dart';
part 'ng_show_hide.dart';
part 'input_checkbox.dart';
part 'input_radio.dart';
part 'ng_disabled.dart';
part 'ng_model.dart';
part 'ng_required.dart';
part 'ng_aria_multiline.dart';
part 'ng_aria_value.dart';
part 'ng_tabindex.dart';

/*
 * AngularAria Directives module
 */
class AngularAriaDirectivesModule extends Module {

  AngularAriaDirectivesModule() {
    bind(NgHide);
    bind(NgShow);
    bind(InputCheckbox);
    bind(InputRadio);
    bind(RoleRadio);
    bind(NgDisabled);
    bind(NgModelAria);
    bind(NgRequiredAria);
    bind(NgAriaMultiline);
    bind(NgAriaValue);
    bind(NgAriaMinValue);
    bind(NgAriaMaxValue);
    bind(NgAriaTabindex);
    bind(NgAriaRadioTabindex);
    bind(NgAriaRadioRoleTabindex);
  }
}