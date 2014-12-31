/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.test;

void testNgModelDirectives() {

  describe('aria-invalid', () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    beforeEach(() {
      module((Module _) => _
        ..install(new AngularAriaDirectivesModule())
      );
    });

    it('should attach aria-invalid to input', compileComponent('<input ng-model="txtInput" ng-minlength="10">', {
        'txtInput': 'LTten'
    }, (Scope scope, dom.HtmlElement element) {
      expect(element).toHaveAttribute('aria-invalid', 'true');

      scope.apply('txtInput = "morethantencharacters"');
      expect(element).toHaveAttribute('aria-invalid', 'false');
    }));

    it('should not attach itself if aria-invalid is already present', compileComponent('<input ng-model="txtInput" ng-minlength="10" aria-invalid="userSetValue">', {
        'txtInput': 'LTten'
    }, (Scope scope, dom.HtmlElement element) {
      expect(element).toHaveAttribute('aria-invalid', 'userSetValue');
    }));
  });
}