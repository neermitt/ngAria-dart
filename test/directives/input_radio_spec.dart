/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.test;

void testInputRadioDirectives() {
  describe('aria-checked', () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    beforeEach(() {
      module((Module _) => _
        ..install(new AngularAriaDirectivesModule())
             );
    });


    void verifyAttached(Scope scope, dom.ElementList elements) {
      expect(elements.elementAt(0)).toHaveAttribute('aria-checked', 'true');
      expect(elements.elementAt(1)).toHaveAttribute('aria-checked', 'false');

      scope.apply('val = "two"');
      expect(elements.elementAt(0)).toHaveAttribute('aria-checked', 'false');
      expect(elements.elementAt(1)).toHaveAttribute('aria-checked', 'true');
    }

    void verifyNotAttached(Scope scope, dom.ElementList elements) {
      expect(elements.elementAt(0)).toHaveAttribute('aria-checked', 'userSetValue');
      expect(elements.elementAt(1)).toHaveAttribute('aria-checked', 'userSetValue');
      scope.apply('val = "one"');
      expect(elements.elementAt(0)).toHaveAttribute('aria-checked', 'userSetValue');
      expect(elements.elementAt(1)).toHaveAttribute('aria-checked', 'userSetValue');

      scope.apply('val = "two"');
      expect(elements.elementAt(0)).toHaveAttribute('aria-checked', 'userSetValue');
      expect(elements.elementAt(1)).toHaveAttribute('aria-checked', 'userSetValue');
    }

    describe('radio', () {
      it('should attach itself to input type="radio"', compileComponent(
          '<div><input type="radio" ng-model="val" value="one"> <input type="radio" ng-model="val" value="two"></div>',
          {
              'val': 'one'
          }, (Scope scope, dom.HtmlElement element) {
            verifyAttached(scope, element.querySelectorAll('input'));
          }));

      it('should not attach itself if an aria-checked value is already present', compileComponent(
          '<div><input type="radio" ng-model="val" value="one" aria-checked="userSetValue">' +
          '<input type="radio" ng-model="val" value="two" aria-checked="userSetValue"></div>', {
          }, (Scope scope, dom.HtmlElement element) {
            verifyNotAttached(scope, element.querySelectorAll('input'));
          }));
    });

    describe('role-radio', () {
      it('should attach itself to role="radio"',
         compileComponent('<div><div role="radio" ng-model="val" value="one"></div>' +
                          '<div role="radio" ng-model="val" value="two"></div></div>', {
             'val': 'one'
         }, (Scope scope, dom.HtmlElement element) {
           verifyAttached(scope, element.querySelectorAll('div'));
         }));

      it('should not attach itself if an aria-checked value is already present',
         compileComponent('<div><div role="radio" ng-model="val" value="one" aria-checked="userSetValue"></div>' +
                          '<div role="radio" ng-model="val" value="two" aria-checked="userSetValue"></div></div>', {
         }, (Scope scope, dom.HtmlElement element) {
           verifyNotAttached(scope, element.querySelectorAll('div'));
         }));
    });

    describe('role-menuitemradio', () {
      it('should attach itself to role="menuitemradio"',
         compileComponent('<div><div role="menuitemradio" ng-model="val" value="one"></div>' +
                          '<div role="menuitemradio" ng-model="val" value="two"></div></div>', {
             'val': 'one'
         }, (Scope scope, dom.HtmlElement element) {
           verifyAttached(scope, element.querySelectorAll('div'));
         }));

      it('should not attach itself if an aria-checked value is already present',
         compileComponent('<div><div role="menuitemradio" ng-model="val" value="one" aria-checked="userSetValue"></div>' +
                          '<div role="menuitemradio" ng-model="val" value="two" aria-checked="userSetValue"></div></div>',
                          {
                          }, (Scope scope, dom.HtmlElement element) {
           verifyNotAttached(scope, element.querySelectorAll('div'));
         }));
    });
  });
}
