/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */
part of angular_aria_test;

void testInputCheckboxDirectives() {
  describe('aria-checked', () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    beforeEach(() {
      module((Module _) => _
        ..install(new AngularAriaDirectivesModule())
      );
    });

    describe('checkbox', () {
      it('should attach itself to input type="checkbox"', compileComponent('<input type="checkbox" ng-model="val">', {
          'val': true
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('aria-checked')).toEqual('true');

        scope.apply('val = false');
        expect(element.getAttribute('aria-checked')).toEqual('false');
      }));

      it('should attach itself to input type="checkbox" with ng-true-value',
      compileComponent('<input type="checkbox" ng-model="val" ng-true-value="\'lion\'" ng-false-value="\'goat\'">', {
          'val': 'lion'
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('aria-checked')).toEqual('true');

        scope.apply('val = goat');
        expect(element.getAttribute('aria-checked')).toEqual('false');
      }));

      it('should not attach itself if an aria-checked value is already present', compileComponent('<input type="checkbox" ng-model="val" aria-checked="userSetValue">', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('aria-checked')).toEqual('userSetValue');

        scope.apply('val = true');
        expect(element.getAttribute('aria-checked')).toEqual('userSetValue');
      }));
    });


  });
}
