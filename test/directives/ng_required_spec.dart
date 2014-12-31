/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */
part of angular.aria.test;


void testNgRequiredDirectives() {

  describe('aria-required', () {

    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    beforeEach(() {
      module((Module _) => _
        ..install(new AngularAriaDirectivesModule())
      );
    });

    void verifyAttached(Scope scope, dom.HtmlElement element) {
      expect(element).toHaveAttribute('aria-required', 'true');

      scope.apply("val='input is valid now'");
      expect(element).toHaveAttribute('aria-required', 'false');
    }

    void verifyNotAttached(Scope scope, dom.HtmlElement element) {
      expect(element).toHaveAttribute('aria-required', 'userSetValue');

      scope.apply("val='input is valid now'");
      expect(element).toHaveAttribute('aria-required', 'userSetValue');
    }

    it('should attach aria-required to input', compileComponent('<input ng-model="val" required>', {
    }, verifyAttached));

    it('should attach aria-required to textarea', compileComponent('<textarea ng-model="val" required></textarea>', {
    }, verifyAttached));

    it('should attach aria-required to select', compileComponent('<select ng-model="val" required></select>', {
    }, verifyAttached));

    it('should attach aria-required to ngRequired', compileComponent('<input ng-model="val" ng-required="true">', {
    }, verifyAttached));

    it('should not attach itself to input if aria-required is already present', compileComponent('<input ng-model="val" required aria-required="userSetValue">', {
    }, verifyNotAttached));

    it('should not attach itself to textarea if aria-required is already present', compileComponent('<textarea ng-model="val" required aria-required="userSetValue"></textarea>', {
    }, verifyNotAttached));

    it('should not attach itself to select if aria-required is already present', compileComponent('<select ng-model="val" required aria-required="userSetValue"></select>', {
    }, verifyNotAttached));

    it('should not attach itself to ngRequired if aria-required is already present', compileComponent('<input ng-model="val" ng-required="true" aria-required="userSetValue">', {
    }, verifyNotAttached));

  });
}