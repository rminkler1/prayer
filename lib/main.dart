import 'dart:io';

import 'package:flutter/material.dart';
import 'prayer_focus.dart';
import 'dart:math';
import 'ui_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PrayerAppHome(),
    );
  }
}

class PrayerAppHome extends StatefulWidget {
  const PrayerAppHome({super.key});

  @override
  State<PrayerAppHome> createState() => _PrayerAppHomeState();
}

class _PrayerAppHomeState extends State<PrayerAppHome> {
  Color darkPrimaryColor = const Color(0xff0097A7);
  Color lightPrimaryColor = const Color(0xffB2EBF2);
  Color primaryColor = const Color(0xff00BCD4);
  Color textIconsColor = Colors.white;
  Color accentColor = const Color(0xffFF9800);
  Color primaryTextColor = const Color(0xff212121);
  Color secondaryTextColor = const Color(0xff757575);
  Color dividerColor = const Color(0xffBDBDBD);

  int focusSelector = Random().nextInt(focusList.length);

  int appStateIndex = 0;

  bool timerOn = true;

  String _selectedValue = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
// gradient background
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.2, .5, 1],
          colors: [darkPrimaryColor, primaryColor, lightPrimaryColor],
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
// App Bar
        appBar: AppBar(
          title: const Text(
// App Bar Title
            'Prayer Time',
            style: TextStyle(color: Colors.white),
          ),
// Transparent app bar
          backgroundColor: const Color(0x11000000),
          elevation: 0,
          actions: [
            PopupMenuButton<String>(
              iconColor: textIconsColor,
              elevation: 5,
              onSelected: (String value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: '1',
                  child: Text('Add Prayer Request'),
                ),
                const PopupMenuItem(
                  value: '2',
                  child: Text('Settings'),
                ),
              ],
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Text(
// focus text
                    focusList[focusSelector],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: textIconsColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0x30000000),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            // prayer topic text
                            prayerTopic[appStateIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: dividerColor,
                            ),
                          ),
                          Divider(
                            indent: 100,
                            endIndent: 100,
                            color: accentColor,
                          ),
                          Text(
                            // prayer topic Detail text
                            prayerTopicDetail[appStateIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: textIconsColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: lightPrimaryColor,
                child: Row(
// Bottom row
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (appStateIndex < 5) {
                          setState(() {
                            appStateIndex++;
                          });
                        } else {
                          exit(0);
                        }
                      },
                      child: Text(
                        buttonText[appStateIndex],
                        style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      '00:00',
                      style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
// bottom spacer for Android
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
