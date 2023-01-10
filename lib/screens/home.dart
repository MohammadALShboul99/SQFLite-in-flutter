import 'package:face/component/sqldb.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  SqlDb MyDB = SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(60),
            child: ElevatedButton(
              onPressed: () async {
                int response = await MyDB.insertData(
                    " INSERT INTO 'notes' ('note') VALUES ('note one') ");
                print(response);
              },
              child: Text("InsertData"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: MaterialButton(
              onPressed: () async {
                List<Map> myList =
                    await MyDB.readData("SELECT * FROM 'notes' ");
                print(myList);
              },
              child: Text("ReadData", style: TextStyle(color: Colors.white)),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
