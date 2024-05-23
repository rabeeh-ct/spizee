import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../di/di.dart';
import '../firebase_options.dart';
import '../presentation/routes/route_constants.dart';

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DependencyInjection.init();
  await GetStorage.init();
}

String get currentRoute =>_currentRoute();

String _currentRoute(){
  if(FirebaseAuth.instance.currentUser!=null){
    return RouteList.homeScreen;
  }else{
    return RouteList.initial;
  }
}

