/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */

part of angular.aria.demo;

@Decorator(selector: '[show-attrs]')
class ShowAttributeDirective implements DetachAware {

  dom.Element element;
  Scope childScope;

  ShowAttributeDirective(dom.Element this.element, Scope scope) {
    dom.PreElement pre = new dom.PreElement();
    dom.Text text = new dom.Text('');
    pre.append(text);
    element.insertAdjacentElement('afterEnd', pre);

    childScope = scope.createProtoChild();


    childScope.context['attributes'] = () {
      Map map = new HashMap();
      for (String attr in element.attributes.keys) {
        if (attr.startsWith('aria')) {
          map[attr] = element.attributes[attr];
        }
      }

      return map;
    };

    childScope.watch('attributes()', (value, _) {
      MapChangeRecord record = value as MapChangeRecord;
      scope.domWrite(() {
        text.data = JSON.encode(record.map);
      });
    }, canChangeModel: false, collection: true);
  }

  void detach() {
    childScope.destroy();
  }
}
