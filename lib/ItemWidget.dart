
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'catalog.dart';
bool verify=true;
int id=1;
class ItemWidget extends StatelessWidget {
  final Item1 item;


  const ItemWidget({Key? key, required this.item})
      : assert(item!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0,right:0.0,top:8.0,bottom:8.0),
          child: Container(
            height: 130,
            color: Color(0xFFFFEBEE).withOpacity(0.5),
             child: Card(
               elevation: 0.0,
              child: Container(
                width:100,

               decoration:item.id==id?BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: Colors.white,
                   image:DecorationImage(
                     fit: BoxFit.cover, image: AssetImage(item.image),
                     colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.4),BlendMode.hardLight),

                   ) ): BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black,
                    image:DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(item.image),
                       ) ),
                child: item.id==id?
                ListTile(
                  tileColor: Color(0xFFFFEBEE).withOpacity(1),
                  shape:  RoundedRectangleBorder(),
                  title: Padding(
                    padding: const EdgeInsets.only(top:25.0),
                    child: Column(
                      children: [
                        Image.asset('images/heart.png',scale: 2,),
                        SizedBox(height: 3,),
                        Text("20",style: TextStyle(color: Colors.white,fontSize: 24),)
                      ],
                    ),
                  ),
                  ):
                ListTile(
                  tileColor: Color(0xFFFFEBEE).withOpacity(1),
                  shape:  RoundedRectangleBorder(),

                ),
              ),
              ),
          ),
        ),
        Positioned(
                  top:123,
            left:22,
            child: Container(
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color:Colors.white),
              height:20.0,
              width:80.0,
              child:item.verify? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(item.name ),
               Container(
                 height:13,
                   width:13,
                   child: Image.asset("images/correct.png")),
                ],
               ):
                Center(child: Text(item.name)),
            ))
      ],
    );
  }
}

