/*
 * Copyright (C) - 2014 Angular Material Dart authors. Please see AUTHORS.md.
 * https://github.com/neermitt/ngAria-dart
 * All rights reserved.  Please see the LICENSE.md file.
 */
library angular.aria.service;

import "package:angular/angular.dart";

/*
 * Aria Service Module.
 */
class AriaServiceModule extends Module {
  AriaServiceModule() {
    bind(AriaService);
  }
}

@Injectable()
class AriaService {

}
