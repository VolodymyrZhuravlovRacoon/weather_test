import 'dart:ui';

import 'package:test_weather/application/app.dart';
import 'package:test_weather/application/bootstrap.dart';

void main() async {
  DartPluginRegistrant.ensureInitialized();
  bootstrap(() => const App());
}
