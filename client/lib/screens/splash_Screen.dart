import 'package:bookology/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  int aniDuration = 500;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: aniDuration), vsync: this);
    animation = Tween<double>(begin: 10.0, end: -2.0).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushReplacementNamed(context,
              Hive.box(kAppStorage).containsKey("name") ? "/main" : "/getinfo");
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(const AssetImage(splashBgImage), context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Image.asset(
              splashBgImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: splashGradient,
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  kAppName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 50,
                        letterSpacing: animation.value,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    kAppDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          height: 1,
                          color: Colors.white.withOpacity(0.7),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
