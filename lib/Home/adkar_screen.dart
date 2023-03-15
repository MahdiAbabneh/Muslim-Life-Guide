import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:the_holy_quran/Compouents/widgets.dart';

import 'azdkar_implemnt_screen.dart';
class AdkaarScreen extends StatelessWidget {
  const AdkaarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var columnCount = 2;

    return
      ProgressHUD(indicatorColor: Colors.green,
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(backgroundColor: Colors.green,
            title: const Text("ألأذكار"),),
            body: SafeArea(
              child: AnimationLimiter(
                child: GridView.count(mainAxisSpacing: 20,crossAxisSpacing: 20,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(8.0),
                  crossAxisCount: columnCount,
                  children: List.generate(
                    adakar.length,
                        (int index) {
                      return AnimationConfiguration.staggeredGrid(
                        columnCount: columnCount,
                        position: index,
                        duration: const Duration(seconds:1),
                        child:  ScaleAnimation(
                          scale: 0.5,
                          child: FadeInAnimation(
                            child:CircularStepProgressIndicator(
                              totalSteps: 1,
                              currentStep: 1,
                              selectedColor: Colors.green,
                              unselectedColor: Colors.grey,
                              padding: 0,
                              width: 100,
                              child: GestureDetector(onTap: (){
                                adkarSelect=adakar[index];
                                navigateTo(context, const adkarImplemntScreen());
                                // final progress = ProgressHUD.of(context);
                                // progress?.show();
                                // Future.delayed(const Duration(seconds: 1), () {
                                //   indexJuz=index;
                                //   PageInfo pageInfo = getPageInfo(index);
                                //   totalProgress=pageInfo.totalProgress;
                                //   startPage=pageInfo.startPage;
                                //   lastPage=pageInfo.lastPage;
                                //   numProgress=0;
                                //   navigateTo(context, const JuzScreen());
                                //   progress?.dismiss();
                                // });
                                  },child: emptyCardAdkar(adakar[index])) ),
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




