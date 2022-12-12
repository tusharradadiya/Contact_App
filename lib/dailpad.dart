import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Dialpad extends StatefulWidget {
  const Dialpad({Key? key}) : super(key: key);

  @override
  State<Dialpad> createState() => _DialpadState();
}

class _DialpadState extends State<Dialpad> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  List call = [];
  String callnumber = "";
  List namelist = [
    "tushar radadiya",
    "sandip sangani",
    "utkarsh korat",
    "naimish Sakhavala"
  ];
  int tempclear = 0;
  int i = 1;
  List Contactlist = ["7984511007", "9978159955", "9712020743", "9054348932"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const Icon(Icons.search),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Container(
                    height: 20,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            title: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  child: TextField(
                                    controller: txtname,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(),
                                      hintText: "Name",
                                    ),
                                  ),
                                ),
                                h(15),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  child: TextField(
                                    controller: txtnumber,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(),
                                        hintText: "Contact number"),
                                  ),
                                ),
                                h(15),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (txtname.text != "" &&
                                          txtnumber.text != "") {
                                        namelist.add(txtname.text);
                                        Contactlist.add(txtnumber.text);
                                      }
                                      txtnumber.text = "";
                                      txtname.text = "";
                                    });
                                  },
                                  child: Text("ADD CONATACT"),
                                ),
                                h(5),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          Text("Add Contact")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            w(5),
          ],
          backgroundColor: Colors.black87,
          title: const Text("Phone"),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                    children: Contactlist.asMap()
                        .entries
                        .map((e) => detail(
                            "${namelist[e.key][0]}",
                            "${namelist[e.key]}",
                            "${Contactlist[e.key]}",
                            e.key))
                        .toList()),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: 70,
              child: SelectionArea(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: call
                        .map((e) => Text(
                              "$e",
                              style: TextStyle(color: Colors.white, fontSize: 33),
                            ))
                        .toList()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      key("1", 1),
                      key("2", 2),
                      key("3", 3),
                    ],
                  ),
                  Row(
                    children: [
                      key("4", 4),
                      key("5", 5),
                      key("6", 6),
                    ],
                  ),
                  Row(
                    children: [
                      key("7", 7),
                      key("8", 8),
                      key("9", 9),
                    ],
                  ),
                  Row(
                    children: [
                      key("*", 0),
                      key("0", 0),
                      key("#", 0),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 85,
                            child: Icon(
                              Icons.video_call,
                              color: Colors.green,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () async {
                            tempclear = 1;
                            for (int j = 0; j < call.length; j++) {
                              callnumber = "$callnumber${call[j]}";
                            }
                            await launchUrl(Uri.parse("tel:$callnumber"));
                            call.clear();
                            callnumber = "";
                          },
                          child: Icon(Icons.call),
                          backgroundColor: Colors.green.shade500,
                        ),
                      ),
                      Expanded(
                        child: InkWell(onLongPress: (){
                          setState(() {
                            call.clear();
                          });
                        },
                          onTap: () {
                            setState(() {
                              if (call.length != 0) {
                                call.removeAt(call.length - 1);
                              }
                            });
                          },
                          child: Container(
                            height: 85,
                            child: Icon(
                              Icons.backspace_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      i = 1;
                      Navigator.pushReplacementNamed(context, 'dial');
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "keypad",
                      style: (i == 1)
                          ? TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)
                          : TextStyle(
                              color: Colors.grey.shade300, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      i = 2;
                      Navigator.pushReplacementNamed(context, '/');
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Recent",
                      style: (i == 2)
                          ? TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)
                          : TextStyle(
                              color: Colors.grey.shade300, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      i = 3;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Contact",
                      style: (i == 3)
                          ? TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)
                          : TextStyle(
                              color: Colors.grey.shade300, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget key(String value, int no) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            call.add(no);
          });
        },
        child: Container(
          height: 85,
          alignment: Alignment.center,
          child: Text(
            value,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 35),
          ),
        ),
      ),
    );
  }

  Widget detail(String logo, name, contact, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 7),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          w(5),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'detail', arguments: [
                Contactlist[index],
                namelist[index],
                namelist[index][0]
              ]);
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                logo.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          w(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$name",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SelectableText(
                  "$contact",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              await launchUrl(Uri.parse("tel:$contact"));
            },
            child: const Icon(
              Icons.call,
              size: 25,
              color: Colors.white,
            ),
          ),
          w(15),
        ],
      ),
    );
  }
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
