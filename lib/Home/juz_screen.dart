import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:the_holy_quran/Compouents/widgets.dart';

class JuzScreen extends StatefulWidget {
  const JuzScreen({Key? key}) : super(key: key);

  @override
  State<JuzScreen> createState() => _JuzScreenState();
}

class _JuzScreenState extends State<JuzScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,title: Text("${numberjuz[indexJuz]}"),),
      body:Column(
        children: [
      ExpandablePageView.builder(physics: const NeverScrollableScrollPhysics(),
      controller:pageController ,
      animateFirstPage: true,
      itemCount: (lastPage-startPage)+1,
      itemBuilder: (context, index) {
        return
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PhotoView(backgroundDecoration: const BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(20)),
                color: Colors.white
            ),
              imageProvider: AssetImage("assets/images/${startPage+index}.png"),
              loadingBuilder: (context, event) => Center(
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: CircularProgressIndicator(
                    backgroundColor:Colors.grey,
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                  ),
                ),
              ),
            ),
          );
      },
    ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  pageController.previousPage(duration: const Duration(seconds: 1,), curve:Curves.ease);
                  setState(() {
                    numProgress=numProgress-1;
                  });
                }, icon: const Icon(FontAwesomeIcons.circleArrowRight,size: 40,color: Colors.green,)),
                const Spacer(),
                Stack(alignment: Alignment.center,
                  children: [
                    CircularStepProgressIndicator(height:30,width: 30,
                      totalSteps: totalProgress,
                      currentStep: numProgress,
                      selectedColor: Colors.green,
                      unselectedColor: Colors.grey,
                    ),
                    Container(color:Colors.white,child: Text(ArabicNumbers().convert("${numProgress=numProgress==0?1:numProgress}"))),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: (){
                  pageController.nextPage(duration: const Duration(seconds: 1,), curve:Curves.ease);
                  setState(() {
                    if(numProgress!=totalProgress)
                      {
                        numProgress = numProgress + 1;
                      }
                  });
                }, icon: const Icon(FontAwesomeIcons.circleArrowLeft,size: 40,color:  Colors.green)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
