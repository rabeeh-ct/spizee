import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../di/di.dart';

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  DependencyInjection.init();
  // setSystemOverlay();
  await GetStorage.init();
}
