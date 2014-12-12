/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.test;

void testAriaValueDirectives() {

  describe('aria-value', () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    beforeEach(() {
      module((Module _) => _
        ..install(new AngularAriaDirectivesModule())
      );
    });

    describe('input[type=range]', () {
      it('should attach to input type="range"', compileComponent('<input type="range" ng-model="val" min="0" max="100">', {
          'val': 50
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('aria-valuenow')).toEqual('50');
        expect(element.getAttribute('aria-valuemin')).toEqual('0');
        expect(element.getAttribute('aria-valuemax')).toEqual('100');
      }));
      it('should not attach if aria-value* is already present', compileComponent('<input type="range" ng-model="val" min="0" max="100" aria-valuenow="userSetValue1" aria-valuemin="userSetValue2" aria-valuemax="userSetValue3">', {
          'val': 50
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('aria-valuenow')).toEqual('userSetValue1');
        expect(element.getAttribute('aria-valuemin')).toEqual('userSetValue2');
        expect(element.getAttribute('aria-valuemax')).toEqual('userSetValue3');
      }));
    });
    describe('role="progressbar"', () {
      it('should attach to input type="range"', compileComponent('<div role="progressbar" ng-model="val" min="0" max="100"></div>', {
          'val': 50
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('aria-valuenow')).toEqual('50');
        expect(element.getAttribute('aria-valuemin')).toEqual('0');
        expect(element.getAttribute('aria-valuemax')).toEqual('100');
      }));
      it('should not attach if aria-value* is already present', compileComponent('<div role="progressbar" ng-model="val" min="0" max="100" aria-valuenow="userSetValue1" aria-valuemin="userSetValue2" aria-valuemax="userSetValue3"></div>', {
          'val': 50
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('aria-valuenow')).toEqual('userSetValue1');
        expect(element.getAttribute('aria-valuemin')).toEqual('userSetValue2');
        expect(element.getAttribute('aria-valuemax')).toEqual('userSetValue3');
      }));
    });
    describe('role="slider"', () {
      it('should attach to input type="range"', compileComponent('<div role="slider" ng-model="val" min="0" max="100"></div>', {
          'val': 50
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('aria-valuenow')).toEqual('50');
        expect(element.getAttribute('aria-valuemin')).toEqual('0');
        expect(element.getAttribute('aria-valuemax')).toEqual('100');
      }));
      it('should not attach if aria-value* is already present', compileComponent('<div role="slider" ng-model="val" min="0" max="100" aria-valuenow="userSetValue1" aria-valuemin="userSetValue2" aria-valuemax="userSetValue3"></div>', {
          'val': 50
      }, (Scope scope, dom.HtmlElement element) {
        expect(element.getAttribute('aria-valuenow')).toEqual('userSetValue1');
        expect(element.getAttribute('aria-valuemin')).toEqual('userSetValue2');
        expect(element.getAttribute('aria-valuemax')).toEqual('userSetValue3');
      }));
    });
  });
}