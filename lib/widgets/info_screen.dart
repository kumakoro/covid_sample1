import 'package:covid_sample1/constant.dart';
import 'package:covid_sample1/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const MyHeader(
                image: "assets/icons/coronadr.svg",
                textTop: "Covid-19の",
                textBottom: "症状はこちらです"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "症状",
                    style: kTitleTextstyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      SymptomCard(
                        image: 'assets/images/headache.png',
                        title: '頭痛',
                        isActive: true,
                      ),
                      SymptomCard(
                        image: 'assets/images/caugh.png',
                        title: '咳',
                      ),
                      SymptomCard(
                        image: 'assets/images/fever.png',
                        title: '発熱',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("防止方法", style: kTitleTextstyle),
                  const SizedBox(height: 20),
                  const PreventCard(
                    image: 'assets/images/wear_mask.png',
                    title: 'フェイスマスクを着用する',
                    textWord:
                        'コロナウイルスの発生が始まって以来、いくつかの場所ではフェイスマスクの着用を完全に受け入れてきました',
                  ),
                  const PreventCard(
                    image: 'assets/images/wash_hands.png',
                    title: 'フェイスマスクを着用する',
                    textWord:
                        'コロナウイルスの発生が始まって以来、いくつかの場所ではフェイスマスクの着用を完全に受け入れてきました',
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String textWord;

  const PreventCard({
    Key? key,
    required this.image,
    required this.title,
    required this.textWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              width: MediaQuery.of(context).size.width - 170,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                height: 136,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      textWord,
                      style: TextStyle(fontSize: 12),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset('assets/icons/forward.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;

  const SymptomCard({
    Key? key,
    required this.image,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
