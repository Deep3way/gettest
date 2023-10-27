import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gettest/controllers/tap_controller.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TapController controller = Get.put(TapController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("GETX"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<TapController>(
              builder: (TapController) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF89dad0)),
                    child: Center(child: Text(controller.X.toString())),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  controller.IncreaseX();
                },
                child: Container(
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF89dad0)),
                  child: const Center(child: Text("IncrementX")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  controller.DecrementX();
                },
                child: Container(
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF89dad0)),
                  child: const Center(child: Text("DecrementX")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const SecondPage());
                },
                child: Container(
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF89dad0)),
                  child: const Center(child: Text("Animation")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.find();
    return Scaffold(
      body: GetBuilder<TapController>(builder: (_) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.white70, Colors.amber],
            ),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Center(
                  child: Lottie.network(
                      'https://lottie.host/1985f8a9-9168-4c45-a6ea-22e2f5803f5c/ktnt4G6Tq8.json')),
              Center(
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: animationController.value,
                      child: Text(
                        controller.X.toString(),
                        style: const TextStyle(
                          fontSize: 150,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
