
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:the_holy_quran/Compouents/widgets.dart';
import 'package:the_holy_quran/Home/adan_screen.dart';
import 'package:the_holy_quran/Model/Functions.dart';

TextEditingController userCityController = TextEditingController();

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ProgressHUD(indicatorColor: Colors.green,
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(backgroundColor: Colors.green,
            title: const Text("مواعيد الصلاة"),
          ),
          body: SafeArea(
            child: AnimationLimiter(
              child: GridView.count(mainAxisSpacing: 20,crossAxisSpacing: 20,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 2,
                children: List.generate(
                  countries.length,
                      (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      columnCount: 2,
                      position: index,
                      duration: const Duration(seconds:1),
                      child:  ScaleAnimation(
                        scale: 0.5,
                        child: FadeInAnimation(
                            child:InkWell(
                              onTap: () async {
                                final progress = ProgressHUD.of(context);
                                progress?.show();
                                Future.delayed(const Duration(seconds: 4), ()async {
                                  cityUser = countries[index];
                                  indexCountries=index;
                                  if(cityUser=='SY')
                                  {
                                    cityUser="Syria";
                                  }
                                  timer_Pray =["00:00","00:00","00:00","00:00","00:00","00:00"];
                                  await getPTData()
                                      .whenComplete(() => const Getlocation())
                                      .whenComplete(() {
                                    navigateTo(context, const AdanScreen());
                                  });
                                  progress?.dismiss();
                                });

                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Stack(
                                          children: [
                                            Flag.fromString(
                                              countries[index],
                                              height: double.infinity,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                color: Colors.black45,
                                                padding: const EdgeInsets.all(8),
                                                child: Text(
                                                  countryNames[countries[index]]!,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}