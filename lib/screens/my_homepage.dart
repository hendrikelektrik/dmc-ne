import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const List<String> plantList = <String>['', 'DMC 1', 'DMC 2', 'DMC 3', 'DMC 5'];
const List<String> areaList = <String>['', 'Sp 1', 'Sp 2', 'Sp 3', 'Sp 3A'];
const List<String> mcTypeList = <String>[
  '',
  'Carding',
  'Drawframe',
  'Ringframe'
];

class _MyHomePageState extends State<MyHomePage> {
  String plantValue = plantList.first;
  String areaValue = areaList.first;
  String mcTypeValue = mcTypeList.first;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("DMC Ne"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.note),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            dataDisplay(150, screenWidth, Colors.blue),
            Row(
              children: [
                dataDisplay(50, screenWidth / 2, Colors.grey),
                dataDisplay(50, screenWidth / 2, Colors.grey)
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Task !!',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      plantInput((screenWidth - 16) / 2),
                      areInput((screenWidth - 16) / 2),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      mcTypeInput((screenWidth - 16) / 2),
                      SizedBox(
                        height: 50,
                        width: (screenWidth - 16) / 2,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Machine ID !!',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.copy_all),
        onPressed: () {},
      ),
    );
  }

  Widget dataDisplay(double height, double width, Color color) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Container(
          color: color,
        ),
      ),
    );
  }

  Widget plantInput(double width) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          const Text(
            "Plant",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 10),
          DropdownButton(
            value: plantValue,
            items: plantList
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                plantValue = val!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget areInput(double width) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          const Text(
            "Area ",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 10),
          DropdownButton(
            value: areaValue,
            items: plantList
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                areaValue = val!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget mcTypeInput(double width) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          const Text(
            "Machine ",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 10),
          DropdownButton(
            value: mcTypeValue,
            items: plantList
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                mcTypeValue = val!;
              });
            },
          ),
        ],
      ),
    );
  }
}
