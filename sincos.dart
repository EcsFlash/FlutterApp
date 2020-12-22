import 'package:flutter/material.dart';
import 'package:flutter_app/other/widgets.dart';
import 'package:get/get.dart';

import 'other/config.dart';
class count extends GetxController{
  var degree = ''.obs;
 
}

class Tabs extends StatelessWidget{
  TextEditingController somecontroller = new TextEditingController();
  Widget build(BuildContext context){
    final count countsincostg = Get.put(count());
    final _kTabPages =<Widget>[
      Column(
          children:
          [
            Text('Вычисление по градусу'),
            Row(
              children:[
                Expanded(
                    child:
                      TextField(

                        controller: somecontroller,
                        cursorColor: Colors.white,
                        maxLength: 3,maxLines: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration:
                          InputDecoration(
                            hintText: "градус",
                            border:
                              OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                  BorderSide(
                                    color: Colors.amber,
                                    style: BorderStyle.solid,
                                  ),
                              ),
                          ),
                        onSubmitted: (value){
                          print(value);
                          print('${countsincostg.degree}');
                        },
                    )
                ),
              ],
            ),
            FlatButton(
                onPressed: (){
                  countsincostg.degree = "${somecontroller.text}".obs;
                  print('${countsincostg.degree}');
                },
                child: Text('Вычислить')),
            Obx(()=>Text("cos(${countsincostg.degree()}) = ")),
            //Obx(()=>Text('tg(${}) = ${}')),
            //Obx(()=>Text('ctg(${}) = ${}')),
          ]
      ),
      Column(
          children:
          [
            Text('Вычисление по значению'),
          ]),
    ];

    final _kTabs = <Widget>[
      Tab(text: 'по град',),
      Tab(text: 'по знач',)
    ];
    return 
      DefaultTabController(
        length: _kTabs.length, 
        child: 
          Scaffold(
            appBar: AppBar(title: Text('Вычисление sin, cos, tg, ctg'), backgroundColor: appbar, bottom: TabBar(indicatorColor: Colors.white,
                tabs: _kTabs),),
            body: TabBarView(children: _kTabPages,),
            
      )
      );
}
}