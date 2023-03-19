import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Compouents/widgets.dart';
import 'Home/main_screen.dart';
import 'network/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await CacheHelper.init();
  sizeFont= CacheHelper.getData(key:'fontSize')??20;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      theme: ThemeData(fontFamily:"Almarai"),
      title: "دليل حياة المسلم",
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar") ,
      home:const MainScreen(),
    );
  }
}

