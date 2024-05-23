import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/routes/routes.dart';
import 'utils/setup_app.dart';

void main() async {
  await setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spizee',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(useMaterial3: true),
      initialRoute: currentRoute,
      routes: Routes.routes,
    );
  }
}
