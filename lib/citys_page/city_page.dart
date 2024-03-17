import 'package:flutter/material.dart';
import 'package:geziyorum/city_select.dart';
import 'package:geziyorum/detayl%C4%B1_g%C3%B6r%C3%BCnen.dart';
import 'package:page_transition/page_transition.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Trabzon',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(
                overscroll: false
            ),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/logo.png',
                        width: 450,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Trabzon\'da ne yapmak istersin?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildCardWithArrow('assets/logo.png', 'Yeme-içme'),
                buildCardWithArrow('assets/logo.png', 'Gezme-tozma'),
                buildCardWithArrow('assets/logo.png', 'Konaklama'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardWithArrow(String image, String text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: DetayliGorunen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
