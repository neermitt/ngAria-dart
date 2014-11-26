/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular_aria_test;

void testShowHideDirectives() {
  describe('aria-hidden', () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    beforeEach(() {
      module((Module _) => _
        ..install(new AngularAriaDirectivesModule())
      );
    });

    it('should attach aria-hidden to ng-show', compileComponent('<div ng-show="val"></div>', {
        'val': false
    }, (Scope scope, dom.HtmlElement element) {
      expect(element.getAttribute('aria-hidden')).toEqual('true');

      scope.apply('val = true');
      expect(element.getAttribute('aria-hidden')).toEqual('false');
    }));

    it('should attach aria-hidden to ng-hide', compileComponent('<div ng-hide="val"></div>', {
        'val': false
    }, (Scope scope, dom.HtmlElement element) {
      expect(element.getAttribute('aria-hidden')).toEqual('false');

      scope.apply('val = true');
      expect(element.getAttribute('aria-hidden')).toEqual('true');
    }));


    it('should not change aria-hidden if it is already present on ng-show', compileComponent('<div ng-show="val" aria-hidden="userSetValue"></div>', {
    }, (Scope scope, dom.HtmlElement element) {
      expect(element.getAttribute('aria-hidden')).toEqual('userSetValue');

      scope.apply('val = true');
      expect(element.getAttribute('aria-hidden')).toEqual('userSetValue');
    }));
  });
}

