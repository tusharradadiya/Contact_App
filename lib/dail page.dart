import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Dailpage extends StatefulWidget {
  const Dailpage({Key? key}) : super(key: key);

  @override
  State<Dailpage> createState() => _DailpageState();
}

class _DailpageState extends State<Dailpage> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  int i = 2;
  List namelist = [
    "tushar radadiya",
    "sandip sangani",
    "utkarsh korat",
    "naimish Sakhavala"
  ];
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
                        setState(() {
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
                        });
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
        backgroundColor: Colors.grey.shade900,
        body: ListView(
            children: Contactlist.asMap()
                .entries
                .map((e) => detail("${namelist[e.key][0]}",
                    "${namelist[e.key]}", "${Contactlist[e.key]}", e.key))
                .toList()),
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
                namelist[index][0],
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
                "$logo".toUpperCase(),
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
            child: Icon(
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
