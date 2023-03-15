import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_holy_quran/Compouents/widgets.dart';
import 'Variable_declarations.dart';
import 'data.dart';
Data ?list;
Future getPTData() async {
  var res = await http.get(Uri.parse(Uri.encodeFull("http://api.aladhan.com/v1/timingsByAddress?address=${cityUser!}")));
  var data = jsonDecode(res.body);
  list = Data.fromJson(data);
  print(list!.data.meta.timezone);
  return list;
}

List<int> difference(String timeNow) {
  var diff = [
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0]
  ];
  var substrNow = timeNow.split(":"), substr;
  int hournow = num.parse(substrNow[0]).toInt(),
      minuteNow = num.parse(substrNow[1]).toInt(),
      hour = 0,
      Minute = 0;
  int hourDiff = 0,
      minuteDiff = 0,
      index = 0;

  for (int i = 0; i < 6; i++) {
    substr=timer_Pray[i].split(":")?? '';
    hour = num.parse(substr[0]).toInt();
    Minute = num.parse(substr[1]).toInt()-1;

    hourDiff = hour - hournow;
    if (hourDiff < 0) hourDiff = hour + (24 - hournow);

    minuteDiff = Minute - minuteNow;
    if (minuteDiff < 0) {
      minuteDiff = Minute + (60 - minuteNow);
      if (hourDiff == 0) {
        hourDiff = 23;
      } else {
        hourDiff--;
      }
    }

    diff[i][0] = hourDiff;
    diff[i][1] = minuteDiff;
  }
  hourDiff = diff[0][0];
  minuteDiff = diff[0][1];
  for (int i = 0; i < 5; i++) {
    if (hourDiff > diff[i + 1][0]) {
      hourDiff = diff[i + 1][0];
      minuteDiff = diff[i + 1][1];
      index = i + 1;
    } else if (hourDiff == diff[i + 1][0] && minuteDiff > diff[i + 1][1]) {
      hourDiff = diff[i + 1][0];
      minuteDiff = diff[i + 1][1];
      index = i + 1;
    }
  }
  return [index, hourDiff, minuteDiff];
}


List<int>Calculate_prayer_period(){
  List<int>period=[0,0,0,0,0,0];
  String time=timer_Pray[5]+":00";
  List<int>diff=difference(time);
  for(int i=0;i<6;i++){
    if(i!=0){
      time=timer_Pray[i-1]+":00";
      diff=difference(time);
    }
    int hour=diff[1];
    int minute=diff[2];
    period[i]=hour*60+minute;
  }
  return period;
}

class Getlocation extends StatefulWidget {
  const Getlocation({super.key});


  @override
  _GetlocationState createState() => _GetlocationState();
}

class _GetlocationState extends State<Getlocation> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Text(
      list!.data.meta.timezone,
      style: TextStyle(
          shadows: const [
            Shadow(
                blurRadius: 19,
                color: Colors.grey
            )
          ],
          fontWeight: FontWeight.bold,
          color:  Colors.white,
          fontSize: screenWidth * 0.05+screenHeight*0.003),
      textAlign: TextAlign.center,
    );
  }
}
Calculate_time(int diff, int hour, int minute) {
  String sec = "", hou = "", m = "";
  if (diff < 10)
    sec = "0$diff";
  else
    sec = "$diff";
  if (hour < 10)
    hou = "0${hour}";
  else
    hou = "${hour}";
  if (minute < 10)
    m = "0${minute}";
  else
    m = "${minute}";

  return "$hou:$m:$sec";
}
void AM(int num) {
  background_color = Colors.black.withOpacity(0.4);
  remain_color = Colors.lightGreen[900]!;
  for (int i = 0; i < colors.length; i++) {
    if (i == num)
      colors[i] = color_selected;
    else
      colors[i] = Colors.white60;
  }
}

void PM(int num) {
  remain_color = Colors.teal[200]!;

  for (int i = 0; i < colors.length; i++) {
    if (i == num) {
      colors[i] = color_selected;
      color_selected_int=i;
    } else
      colors[i] = Colors.white70;
  }
}