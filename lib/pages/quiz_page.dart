import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Space"),
        actions: [
          TextButton(onPressed: () {}, child: Text("Logout")),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: Get.width * 0.1,
                  width: Get.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text("100"),
                ),
                Container(
                  height: Get.width * 0.1,
                  width: Get.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text("100"),
                ),
                Container(
                  height: Get.width * 0.1,
                  width: Get.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text("100"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
