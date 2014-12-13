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
        expect(element.getAttribute('tabindex')).toEqual('0');
      }));

      it('should not attach tabindex if it is already on an element', compileComponent('<div role="checkbox" ng-model="val" tabindex="userSetValue"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('tabindex')).toEqual('userSetValue');
      }));
    });

    describe('role=button', () {

      it('should attach tabindex to role="button"', compileComponent('<div role="button" ng-model="val"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('tabindex')).toEqual('0');
      }));

      it('should not attach tabindex if it is already on an element', compileComponent('<div role="button" ng-model="val" tabindex="userSetValue"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('tabindex')).toEqual('userSetValue');
      }));
    });

    describe('ng-click', () {

      it('should attach tabindex to ng-click', compileComponent('<div ng-click="someAction()"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('tabindex')).toEqual('0');
      }));

      it('should not attach tabindex if it is already on an element', compileComponent('<div ng-click="someAction()" tabindex="userSetValue"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('tabindex')).toEqual('userSetValue');
      }));
    });

    describe('ng-dblclick', () {

      it('should attach tabindex to ng-dblclick', compileComponent('<div ng-dblclick="someAction()"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('tabindex')).toEqual('0');
      }));

      it('should not attach tabindex if it is already on an element', compileComponent('<div ng-dblclick="someAction()" tabindex="userSetValue"></div>', {
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('tabindex')).toEqual('userSetValue');
      }));
    });

  });
}