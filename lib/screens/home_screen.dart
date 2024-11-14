import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      print('버튼클릭');
                    },
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 50,
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이용후',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'SCM1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Image.asset(
                    'assets/images/hanwha-Logo.png',
                    width: 160,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      Text(
                        '안녕하세요, 이용후님',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/waving_hand.png',
                    width: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 50,
                          horizontal: 40,
                        ),
                        child: Text(
                          '구매요청',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("123");
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 50,
                          horizontal: 35,
                        ),
                        child: Text(
                          'RFQ진행',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("123");
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
