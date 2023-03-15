import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_holy_quran/Compouents/widgets.dart';
import 'package:the_holy_quran/Model/Calculate_AM_PM.dart';
import '../Model/Functions.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Future extends StatefulWidget {
  final AM_PM,Pray,color,screen_width,screen_height,index;
  const Future(this.AM_PM,this.Pray,this.color,this.screen_width,this.screen_height,this.index, {super.key});

  @override
  _FutureState createState() => _FutureState(AM_PM,Pray,color,screen_width,screen_height,index);
}

class _FutureState extends State<Future>  {
  final AM_PM,Pray,color,screen_width,screen_height,index;
  _FutureState(this.AM_PM,this.Pray,this.color,this.screen_width,this.screen_height,this.index);
  @override
  Widget build(BuildContext context) {
    String time = "00:00";
    int t = 0;
    double remainPercentage;
    if (Pray == "الفجر") {
      time = list!.data.timings.fajr;
      timer_Pray[0] = time;
    } else if (Pray == "الشروق") {
      time = list!.data.timings.sunrise;
      timer_Pray[1] = time;
    } else if (Pray == "الظهر") {
      time = list!.data.timings.dhuhr;
      timer_Pray[2] = time;
    } else if (Pray == "العصر") {
      time = list!.data.timings.asr;
      timer_Pray[3] = time;
    } else if (Pray == "المغرب") {
      time = list!.data.timings.maghrib;
      timer_Pray[4] = time;
    } else if (Pray == "العشاء") {
      time = list!.data.timings.isha;
      timer_Pray[5] = time;
    }
    var v = time.split(':');
    t = num.parse(v[0]).toInt();
    if (t > 12) {
      t = t - 12;
      time = "$t:${v[1]}";
    }
    List<int> diff = difference(DateFormat('HH:mm:ss').format(DateTime.now()));
    List<int> prayerPeriod = Calculate_prayer_period();
    int nowTime = diff[1] * 60 + diff[2];
    int firstTime = prayerPeriod[index];
    int remainIndex = diff[0];
    remainPercentage = (nowTime / firstTime) * 100;
    return container_Pray("$time $AM_PM", "$Pray", color, screen_width,
        screen_height, index, remainIndex, remainPercentage);
  }
}
Widget container_Pray(String text,String text2,Color color,double screenWidth,double screenHeight,int index,int remainIndex,double percentage){
  percentage=1-(percentage/100);
  Color perc=percentage>=0.50?Colors.green:percentage>=0.30?Colors.green:Colors.green;
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(screenWidth*0.02, screenHeight*0.0004, screenWidth*0.02, 0),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight*0.009,horizontal: screenWidth*0.009),
      child: SizedBox(
        height: screenHeight*0.07,
        child: LiquidLinearProgressIndicator(
          value: index==remainIndex?percentage:100,
          valueColor: const AlwaysStoppedAnimation(Colors.white),
          backgroundColor: perc,
          borderRadius: screenWidth*0.1,
          borderWidth: 2.0,
          borderColor: Colors.green,
          direction: Axis.vertical,
          center: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: screenWidth*0.075,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: screenWidth*0.14,),
              Text(
                text2,
                style: TextStyle(
                  fontSize: screenWidth*0.075,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
}

Widget container(String text, Color color,double screen_width,double screen_height) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(screen_width*0.04,Is_AM_PM? screen_height*0.02:screen_height*0.03, screen_width*0.04,screen_height*0.03),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                backgroundBlendMode: BlendMode.hardLight,
                color: Colors.white10,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green[100]!,
                    spreadRadius: 7,
                    blurRadius: 9,
                  )
                ]
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(left: 3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                backgroundBlendMode: BlendMode.hardLight,
                color: Colors.white54,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green[100]!,
                    spreadRadius: 5,
                    blurRadius: 9,
                  )
                ]
            ),

          ),
        ),
      ],
    ),
  );
}

Widget container_time(String text, Color color,double screen_width,double screen_height) {
  return Container(
    decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white24,
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            spreadRadius: 8,
            blurRadius: 12,
          )
        ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: screen_width*0.11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}