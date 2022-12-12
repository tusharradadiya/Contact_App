import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({Key? key}) : super(key: key);

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    dynamic list = ModalRoute.of(context)!.settings.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black, actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: InkWell(
                        onTap:(){
                          setState(() {
                            list[0] = "";
                            Navigator.pushReplacementNamed(context, "/");
                          });
                        },
                        child: Row(
                          children: [
                            Icon(Icons.delete,color: Colors.black,),
                            Text("  delate"),
                          ],
                        ),
                      ),
                    ),
                  ],
              color: Colors.grey)
        ]),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade900),
                child: Center(
                  child: Column(
                    children: [
                      h(58),
                      Text(
                        "${list[1]}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w500),
                      ),
                      h(10),
                      SelectableText(
                        "${list[0]}",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 20,
                        ),
                      ),
                      h(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse("tel:${list[0]}"));
                            },
                            child: Icon(Icons.call),
                            backgroundColor: Colors.green.shade700,
                          ),
                          w(50),
                          FloatingActionButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse("sms:${list[0]}"));
                            },
                            child: Icon(Icons.messenger),
                            backgroundColor: Colors.blue,
                          ),
                          w(50),
                          FloatingActionButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  "whatsapp://send?phone=+91" +
                                      list[0] +
                                      "&text="));
                            },
                            child: Icon(
                              Icons.whatsapp,
                              size: 35,
                            ),
                            backgroundColor: Colors.green.shade600,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 40),
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey, shape: BoxShape.circle),
                    child: Text(
                      "${list[2]}".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget w(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget h(double hight) {
    return SizedBox(
      height: hight,
    );
  }
}
