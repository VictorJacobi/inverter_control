import 'dart:developer';

import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project_iot/count.dart';

Color onColor = Colors.yellow;
Color offColor = Colors.greenAccent;
String bulbText = 'ON';
bool value = true;

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);
  @override
  // State<_MyHomeScreenState> createState() => _MyHomeScreenState();
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final dbRef = FirebaseDatabase.instance.ref();
  int batteryValue = 0;
  Future<bool> writeData() async {
    try{
      await dbRef.child("LightState").set({"switch": !value});
      return true;
    }catch(e){
      log('Error: $e');
    }
   return false;
  }

  Future<void> readData() async {
    DataSnapshot snapshot = await dbRef.child("BatteryLevel/level").get();

    setState(() {
      batteryValue = snapshot.value as int;
    });
    log('${snapshot.children.map((e) => e.value)}\n${snapshot.value}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: dbRef.child("BatteryLevel/level").onValue,
      builder: (context, snapshot) {
        log(('snapshot: ${snapshot.data?.snapshot.value}'));
        int? level = snapshot.data?.snapshot.value as int?;

        if(snapshot.data==null){
          return const Scaffold(body: SizedBox());
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            backgroundColor: !value ? onColor : Colors.blue,
            onPressed: () async {
              await writeData().then((result) {
                if(result){
                  setState(() {
                    value = !value;
                  });
                }
              });

            },
            label: Center(
              child: Text(
                value == true ? 'OFF' : 'ON',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: const Text(
              'IOT APP',
              style: TextStyle(
                // color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await readData();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height - 80,
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: MediaQuery.sizeOf(context).height / 3,
                          child: Center(
                            child: CircleProgressBar(
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.black12,
                              value: (3.3 * (level!) / (4093 * 0.138 * 24.8)),
                              strokeWidth: 20,
                              child: Center(
                                child: AnimationCount(
                                  count:
                                      (3.3 * level / (4093 * 0.138 * 24.8)),
                                  unit: '%',
                                  unitScaleFactor: 4,
                                  duration: const Duration(milliseconds: 500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
