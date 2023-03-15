import 'dart:async';

import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_holy_quran/Compouents/widgets.dart';
import 'package:the_holy_quran/Model/Calculate_AM_PM.dart';
import 'package:the_holy_quran/Model/CustomBannerAd.dart';

import '../Model/Functions.dart';
import '../Model/Variable_declarations.dart';
import '../Compouents/Container.dart';

class AdanScreen extends StatefulWidget {
  const AdanScreen({Key? key}) : super(key: key);

  @override
  State<AdanScreen> createState() => _AdanScreenState();
}

class _AdanScreenState extends State<AdanScreen> {
  TimeOfDay timeOfDay = TimeOfDay.now();
  Timer ?timer;

  @override
  initState()  {
    int lastIndex=0,count=0; bool enter=false;
    super.initState();
    timer=Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second != DateTime.now().second) {
        setState(() {
          if(enter)count++;
          time_now = DateFormat('HH:mm:ss').format(DateTime.now());
          lastIndex=min[0];
          min=difference(time_now);
          if(lastIndex!=min[0])colors[lastIndex]=Colors.white70;
          diff=59-DateTime.now().second;
          time_now=Calculate_time(diff, min[1], min[2]);
          if(min[0]==0) {
            Pray="صلاه الفجر";
            Is_AM_PM=true;
          }
          else if(min[0]==1) {
            Pray="الشروق";
            Is_AM_PM=false;
          }
          else if(min[0]==2) {
            Pray="صلاه الظهر";
            Is_AM_PM=false;
          }
          else if(min[0]==3) {
            Pray="صلاه العصر";
            Is_AM_PM=false;
          }
          else if(min[0]==4) {
            Pray="صلاه المغرب";
            Is_AM_PM=true;
          }
          else if(min[0]==5) {
            Pray="صلاه العشاء";
            Is_AM_PM=true;
          }
          if(time_now=='00:00:00'  && !enter){
            if(min[0]==1||min[0]==2||min[0]==3) {
              AM(min[0]);
            } else {
              PM(min[0]);
            }
          }
          if(sound_duration==count){
            default_layout=0;
            enter=false;
            count=0;
          }
        }
        );
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var duhur=timer_Pray[2].split(":"); int duhurHour=num.parse(duhur[0]).toInt();
    String dhuhrPeriod = duhurHour < 12 ? "AM" : "PM";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.green,
        title: Row(
          children: [
            Row(
              children: [
                Flag.fromString(
                  countries[indexCountries],
                  height: 20,
                  width:  30,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    countryNames[countries[indexCountries]]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),),
        body:Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: height*0.040,),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: height*0.007,horizontal: width*0.009),
                                        child: Column(
                                          children: [
                                            Future("AM","الفجر",colors[0],width,height,0),
                                            Future("AM","الشروق",colors[1],width,height,1),
                                            Future(dhuhrPeriod,"الظهر",colors[2],width,height,2),
                                            Future("PM","العصر",colors[3],width,height,3),
                                            Future("PM","المغرب",colors[4],width,height,4),
                                            Future("PM","العشاء",colors[5],width,height,5)
                                          ],
                                        ),
                                      ),
                                      container("باقي علي $Pray", remain_color, width,height),
                                      container_time(time_now, Colors.black87,width,height),
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const CustomBannerAd(),
          ],
        )
      ),
    );
  }
}
