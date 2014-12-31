/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.test;

void testNgTabIndexDirectives() {
  describe('tabindex', () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    beforeEach(() {
      module((Module _) => _
        ..install(new AngularAriaDirectivesModule())
      );
    });

    describe('role=checkbox', () {

      it('should attach tabindex to role="checkbox"', compileComponent('<div role="checkbox" ng-model="val"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element).toHaveAttribute('tabindex', '0');
      }));

      it('should not attach tabindex if it is already on an element', compileComponent('<div role="checkbox" ng-model="val" tabindex="userSetValue"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element).toHaveAttribute('tabindex', 'userSetValue');
      }));
    });

    describe('role=button', () {

      it('should attach tabindex to role="button"', compileComponent('<div role="button" ng-model="val"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element).toHaveAttribute('tabindex', '0');
      }));

      it('should not attach tabindex if it is already on an element', compileComponent('<div role="button" ng-model="val" tabindex="userSetValue"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element).toHaveAttribute('tabindex', 'userSetValue');
      }));
    });

    describe('ng-click', () {

      it('should attach tabindex to ng-click', compileComponent('<div ng-click="someAction()"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element).toHaveAttribute('tabindex', '0');
      }));

      it('should not attach tabindex if it is already on an element', compileComponent('<div ng-click="someAction()" tabindex="userSetValue"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element).toHaveAttribute('tabindex', 'userSetValue');
      }));
    });

    describe('ng-dblclick', () {

      it('should attach tabindex to ng-dblclick', compileComponent('<div ng-dblclick="someAction()"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element).toHaveAttribute('tabindex', '0');
      }));

      it('should not attach tabindex if it is already on an element', compileComponent('<div ng-dblclick="someAction()" tabindex="userSetValue"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element).toHaveAttribute('tabindex', 'userSetValue');
      }));
    });

    describe('radiogroup', () {

      it('should set proper tabindex values for radiogroup', compileComponent(
          '<div role="radiogroup"><div role="radio" ng-model="val" value="one">1</div><div role="radio" ng-model="val" value="two">2</div></div>', {
              'val' : 'one'
          }, (Scope scope, dom.HtmlElement element) {
            dom.ElementList elements = element.querySelectorAll('div');
            expect(elements.elementAt(0)).toHaveAttribute('tabindex', '0');
            expect(elements.elementAt(1)).toHaveAttribute('tabindex', '-1');

            scope.apply('val="two"');
            expect(elements.elementAt(0)).toHaveAttribute('tabindex', '-1');
            expect(elements.elementAt(1)).toHaveAttribute('tabindex', '0');
          }));

      it('should not attach tabindex if it is already on an element', compileComponent('<div role="radiogroup"><div role="radio" ng-model="val" value="one" tabindex="userSetValue1">1</div><div role="radio" ng-model="val" value="two" tabindex="userSetValue2">2</div></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        dom.ElementList elements = element.querySelectorAll('div');
        expect(elements.elementAt(0)).toHaveAttribute('tabindex', 'userSetValue1');
        expect(elements.elementAt(1)).toHaveAttribute('tabindex', 'userSetValue2');
      }));
    });
  });
}