/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.test;

void testAriaMultilineDirectives() {

  describe('aria-multiline', () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    beforeEach(() {
      module((Module _) => _
        ..install(new AngularAriaDirectivesModule())
      );
    });

    it('should attach itself to textarea', compileComponent('<textarea ng-model="val"></textarea>', {
    }, (Scope scope, dom.HtmlElement element) {
      expect(element.getAttribute('aria-multiline')).toEqual('true');
    }));

    it('should attach itself role="textbox"', compileComponent('<div role="textbox" ng-model="val"></div>', {
    }, (Scope scope, dom.HtmlElement element) {
      expect(element.getAttribute('aria-multiline')).toEqual('true');
    }));

    it('should not attach itself to textarea if aria-multiline is already present', compileComponent('<textarea ng-model="val" aria-multiline="userSetValue"></textarea>', {
    }, (Scope scope, dom.HtmlElement element) {
      expect(element.getAttribute('aria-multiline')).toEqual('userSetValue');
    }));
  });
}