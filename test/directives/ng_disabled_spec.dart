/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.test;

void testNgDiabledDirectives() {

  describe('aria-disabled', () {
    beforeEach(setUpInjector);
    afterEach(tearDownInjector);

    beforeEach(() {
      module((Module _) => _
        ..install(new AngularAriaDirectivesModule())
             );
    });

    void verifyAttached(Scope scope, dom.HtmlElement element) {
      expect(element).toHaveAttribute('aria-disabled', 'false');

      scope.apply('val = true');
      expect(element).toHaveAttribute('aria-disabled', 'true');
    }

    void verifyNotAttached(Scope scope, dom.HtmlElement element) {
      expect(element).toHaveAttribute('aria-disabled', 'userSetValue');

      scope.apply('val = true');
      expect(element).toHaveAttribute('aria-disabled', 'userSetValue');
    }

    getModel() => {
        'val': false
    };


    it('should attach itself to input elements',
       compileComponent('<input ng-disabled="val">', getModel(), verifyAttached));

    it('should attach itself to textarea elements',
       compileComponent('<textarea ng-disabled="val">', getModel(), verifyAttached));

    it('should attach itself to button elements',
       compileComponent('<button ng-disabled="val">', getModel(), verifyAttached));

    it('should attach itself to select elements',
       compileComponent('<select ng-disabled="val">', getModel(), verifyAttached));

    it('should not attach itself if an aria-disabled attribute is already present on input',
    compileComponent('<input ng-disabled="val" aria-disabled="userSetValue">', {
       }, verifyNotAttached));

    it('should not attach itself if an aria-disabled attribute is already present on textarea',
    compileComponent('<textarea ng-disabled="val" aria-disabled="userSetValue">', {
       }, verifyNotAttached));

    it('should not attach itself if an aria-disabled attribute is already present on button',
    compileComponent('<button ng-disabled="val" aria-disabled="userSetValue">', {
       }, verifyNotAttached));

    it('should not attach itself if an aria-disabled attribute is already present on select',
    compileComponent('<select ng-disabled="val" aria-disabled="userSetValue">', {
       }, verifyNotAttached));


  });

}