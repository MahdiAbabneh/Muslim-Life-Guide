import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_holy_quran/Compouents/widgets.dart';
import 'package:the_holy_quran/Model/CustomBannerAd.dart';
import 'package:the_holy_quran/network/cache_helper.dart';

class adkarImplemntScreen extends StatefulWidget {
  const adkarImplemntScreen({Key? key}) : super(key: key);

  @override
  State<adkarImplemntScreen> createState() => _adkarImplemntScreenState();
}

class _adkarImplemntScreenState extends State<adkarImplemntScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,
        title: Text(adkarSelect),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  if(20<=sizeFont!&&sizeFont!<50) {
                    sizeFont=sizeFont!+2;
                    CacheHelper.sharedPreferences?.setInt("fontSize",sizeFont!);
                  }
                });
              }, icon: const Icon(FontAwesomeIcons.circlePlus),),
              const Icon(FontAwesomeIcons.textHeight),
              IconButton(onPressed: (){
                setState(() {
                  if(20<sizeFont!&&sizeFont!<=50) {
                    sizeFont=sizeFont!-2;
                    CacheHelper.sharedPreferences?.setInt("fontSize",sizeFont!);
                  }
                });

              }, icon: const Icon(FontAwesomeIcons.circleMinus),),

            ],
          ),
        )],
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemCount: adkarList[adkarSelect]!.length,
              itemBuilder: (BuildContext context, int index) {
                final item = adkarList[adkarSelect]![index];
                return ListTile(
                  title: Text(item['content']!,style: TextStyle(fontSize:sizeFont!.toDouble(),fontWeight: FontWeight.bold,height: 2),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Text('عدد: ${ArabicNumbers().convert(item['count'])}'),
                      Visibility(visible:item['description']!="",child: Text('وصف: ${item['description']}')),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20,),
          const CustomBannerAd(),
        ],
      ),
    );
  }
}