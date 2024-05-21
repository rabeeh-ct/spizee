import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../di/di.dart';
import '../presentation/theme/theme.dart';

late ThemeMode themeMode;

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DependencyInjection.init();
  // setSystemOverlay();
  await GetStorage.init();
  await Firebase.initializeApp();
}
