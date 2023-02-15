import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxcalculator/function.dart';
import 'package:digit_to_word/digit_to_word.dart';

String appName = "Salary Tax Calculator Nepal";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double amount = 0;
  String result = "";
  double tax_amount = 0;
  final TextEditingController _controller = new TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.grey),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text(appName),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Tax Calulator",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Pacifico',
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  "Enter amount (excluding tax)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  child: TextField(
                    decoration:
                        InputDecoration(labelText: "Your yearly income:"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => {amount = double.parse(value)},
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kathmandu,Nepal",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        
                        //Text("Edit"),
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  //color: Color.fromARGB(225, 5, 153, 85),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(225, 5, 153, 85),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Amount In Hand",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "${amount - tax_amount}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        child: VerticalDivider(
                          color: Color.fromARGB(255, 255, 255, 255),
                          thickness: 2,
                          width: 5,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Total Tax Amount ",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "$tax_amount",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(225, 5, 153, 85)),
                  ),
                  onPressed: () {
                    setState(() {
                      tax_amount = CalculateTax(amount);
                      result =
                          "Rs. ${DigitToWord.translate(tax_amount.toInt())}";
                    });
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                      fontSize: 26,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Your Total Tax is: $result",
                  style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 22,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
