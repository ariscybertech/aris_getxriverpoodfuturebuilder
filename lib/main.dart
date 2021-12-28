import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:getx_example/modules/data/pages/data_page_future_builder.dart';
import 'package:getx_example/modules/data/pages/data_page_getx.dart';
import 'package:getx_example/modules/data/pages/data_page_riverpod.dart';

import 'modules/data/controllers/data_controller.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  void initState() {
    super.initState();

    Get.put(DataController());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) {
            setState(() => index = i);
            print(i);
          },
          items: [
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: 'Getx',
            ),
            BottomNavigationBarItem(
              label: 'Riverpod',
              icon: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              label: 'FutureBuilder',
              icon: SizedBox.shrink(),
            ),
          ],
        ),
        body: IndexedStack(
          index: index,
          children: [
            DataPage(),
            // Purely to defer Future loading until the bottom navigation bar item is clicked.
            if (index == 1) DataPageRiverpod() else SizedBox.shrink(),
            if (index == 2) DataPageFutureBuilder() else SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
