import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:the_holy_quran/Home/juz_screen.dart';
import 'package:the_holy_quran/Compouents/widgets.dart';
import 'package:the_holy_quran/Model/PageInfo.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var columnCount = 2;

    return
      ProgressHUD(indicatorColor: Colors.green,
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(backgroundColor: Colors.green,
            title: Text("أجزاء القرآن الكريم"),),
            body: SafeArea(
              child: AnimationLimiter(
                child: GridView.count(mainAxisSpacing: 20,crossAxisSpacing: 20,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(8.0),
                  crossAxisCount: columnCount,
                  children: List.generate(
                    namejuz.length,
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
                                final progress = ProgressHUD.of(context);
                                progress?.show();
                                Future.delayed(const Duration(seconds: 1), () {
                                  indexJuz=index;
                                  PageInfo pageInfo = getPageInfo(index);
                                  totalProgress=pageInfo.totalProgress;
                                  startPage=pageInfo.startPage;
                                  lastPage=pageInfo.lastPage;
                                  numProgress=0;
                                  navigateTo(context, const JuzScreen());
                                  progress?.dismiss();
                                });
                                  },child: emptyCard(namejuz[index],numberjuz[index])) ),
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




