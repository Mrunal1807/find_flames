import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ItemWidget.dart';
import 'package:findflames/catalog.dart';

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    await Future.delayed(Duration(seconds: 0));
    final catalogjson=await rootBundle.loadString("catalog/catalog.json");
    final decodedata=jsonDecode(catalogjson);
    var productdata=decodedata["product"];
    CatalogModel.item=List.from(productdata)
        .map<Item1>((item) => Item1.fromMap(item))
        .toList();
    setState(() {});


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62.0),
        child:
        AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFFFEBEE).withOpacity(0.5),
          leading:  Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                "images/img.png",
              ),
            ),
          ),

          title:
          Align(
            alignment: Alignment.center,
            child: Text(

                "Find Flames",
                style: GoogleFonts.raleway(textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color:Color(0xFFF06292),
                ))
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset('images/slider.png',color: Colors.black54,scale: 15,),
            )
          ],
        ),
      ),
      body: Stack(
            children: [
              Column(
                children: [
                     Container(
                      height: 200,
                      width:480,
                      // color: Colors.black12,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFEBEE).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:Expanded(
                        child:(CatalogModel.item!=null && CatalogModel.item.isNotEmpty)
                            ?  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(context, index) {
                            return ItemWidget(item: CatalogModel.item[index]);
                          },
                          itemCount:CatalogModel.item.length,
                        )
                            :Center(
                          child: CircularProgressIndicator(color: Colors.black54,),
                        ),),),
                  Expanded(
                    child: Container(
                      height: 500,
                      decoration:BoxDecoration(
                        color: Colors.white12,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        child: ListView(
                          // make it horizontal
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:16.0,top:18.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: AssetImage(
                                          "images/jordan.png",
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:16.0,top:18.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Jordan ",style:  GoogleFonts.raleway(textStyle: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                  color:Color(0xFF424242),
                                                )),),
                                                Image.asset("images/correct.png",scale:25),
                                              ],
                                            ),

                                            Text("Hii!",style:  GoogleFonts.raleway(textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color:Color(0xFF424242),
                                            )),)

                                          ],
                                        ),
                                      ),
                                      SizedBox(width:140),
                                      Padding(
                                        padding: const EdgeInsets.only(top:17.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "13.10",style:  GoogleFonts.raleway(textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color:Color(0xFF424242),
                                            )),
                                            ),
                                            SizedBox(height: 7,),
                                            CircleAvatar(backgroundColor: Color(0xFFF06292),radius:10,
                                                child: Text("1",style:TextStyle(fontSize: 14,color: Colors.white))
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height:3),
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:16.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: AssetImage(
                                          "images/tim.png",
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left:16.0,top:27.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Tim ",style:  GoogleFonts.raleway(textStyle: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                  color:Colors.grey,
                                                )),),
                                                Image.asset("images/correct.png",scale:25),
                                              ],
                                            ),

                                            Text("Hii!",style:  GoogleFonts.raleway(textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color:Colors.grey,
                                            )),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(width:170),
                                      Text("13.10",style:  GoogleFonts.raleway(textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:Colors.grey,
                                      )),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height:3),
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:16.0,top:18.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: AssetImage(
                                          "images/James.png",
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left:16.0,top:14.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("James ",style:  GoogleFonts.raleway(textStyle: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                              color:Color(0xFF424242),
                                            )),),
                                            Text("Typing...",style: TextStyle(
                                              fontSize: 19,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color:Color(0xFFF06292),
                                            ),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(width:165),
                                      Padding(
                                        padding: const EdgeInsets.only(top:17.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "13.10",style:  GoogleFonts.raleway(textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color:Color(0xFF424242),
                                            )),
                                            ),
                                            SizedBox(height: 7,),
                                            CircleAvatar(backgroundColor: Color(0xFFF06292),radius:10,
                                                child: Text("9+",style:TextStyle(fontSize: 14,color:Colors.white))
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
              ]
              ),
          Container(),
          Positioned(
            top: 160.0,
            left: 25.0,
            right: 30.0,
            child: AppBar(
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25)),
              backgroundColor: Colors.white,
              toolbarHeight: 50,
              leading: Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Image.asset('images/search (2).png',scale:5,color: Colors.grey,),
              ),
              primary: false,
              title: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.raleway(textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color:Colors.grey,
                      )))),

            ),

          ),
],
    ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: Image.asset('images/home.png',scale: 13,color: Color(0xFF424242),),
            label: 'work',
          ),
          new BottomNavigationBarItem(
            icon: Image.asset('images/search.png',scale: 13,color: Color(0xFF424242),),
            label: 'work',
          ),
          new BottomNavigationBarItem(
            icon:  Image.asset('images/calendar.png',scale: 13,color: Color(0xFF424242),),
            label: 'work',
          ),
          BottomNavigationBarItem(
            icon:Container(
                height:53,
                width:53,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color:Color(0xFFFFEBEE).withOpacity(0.5),
                ),
                child: Image.asset('images/dialogue.png',scale: 14,color: Color(0xFFF06292),)),
            label: 'work',
          )
        ],
      ),
    );
  }
}