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

    it('should attach aria-required to input', compileComponent('<input ng-model="val" required>', {
    }, (Scope scope, dom.Element element) {
      expect(element.getAttribute('aria-required')).toEqual('true');

      scope.apply("val='input is valid now'");
      expect(element.getAttribute('aria-required')).toEqual('false');
    }));

    it('should attach aria-required to textarea', compileComponent('<textarea ng-model="val" required></textarea>', {
    }, (Scope scope, dom.Element element) {
      expect(element.getAttribute('aria-required')).toEqual('true');

      scope.apply("val='input is valid now'");
      expect(element.getAttribute('aria-required')).toEqual('false');
    }));

    it('should attach aria-required to select', compileComponent('<select ng-model="val" required></select>', {
    }, (Scope scope, dom.Element element) {
      expect(element.getAttribute('aria-required')).toEqual('true');

      scope.apply("val='input is valid now'");
      expect(element.getAttribute('aria-required')).toEqual('false');
    }));

    it('should attach aria-required to ngRequired', compileComponent('<input ng-model="val" ng-required="true">', {
    }, (Scope scope, dom.Element element) {
      expect(element.getAttribute('aria-required')).toEqual('true');

      scope.apply("val='input is valid now'");
      expect(element.getAttribute('aria-required')).toEqual('false');
    }));

    it('should not attach itself to input if aria-required is already present', compileComponent('<input ng-model="val" required aria-required="userSetValue">', {
    }, (Scope scope, dom.Element element) {
      expect(element.getAttribute('aria-required')).toEqual('userSetValue');

      scope.apply("val='input is valid now'");
      expect(element.getAttribute('aria-required')).toEqual('userSetValue');
    }));

    it('should not attach itself to textarea if aria-required is already present', compileComponent('<textarea ng-model="val" required aria-required="userSetValue"></textarea>', {
    }, (Scope scope, dom.Element element) {
      expect(element.getAttribute('aria-required')).toEqual('userSetValue');

      scope.apply("val='input is valid now'");
      expect(element.getAttribute('aria-required')).toEqual('userSetValue');
    }));

    it('should not attach itself to select if aria-required is already present', compileComponent('<select ng-model="val" required aria-required="userSetValue"></select>', {
    }, (Scope scope, dom.Element element) {
      expect(element.getAttribute('aria-required')).toEqual('userSetValue');

      scope.apply("val='input is valid now'");
      expect(element.getAttribute('aria-required')).toEqual('userSetValue');
    }));

    it('should not attach itself to ngRequired if aria-required is already present', compileComponent('<input ng-model="val" ng-required="true" aria-required="userSetValue">', {
    }, (Scope scope, dom.Element element) {
      expect(element.getAttribute('aria-required')).toEqual('userSetValue');

      scope.apply("val='input is valid now'");
      expect(element.getAttribute('aria-required')).toEqual('userSetValue');
    }));

  });
}