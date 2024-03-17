import 'package:flutter/material.dart';
import 'package:geziyorum/citys_page/city_page.dart';
import 'package:page_transition/page_transition.dart';

class CitySelectPage extends StatefulWidget {
  const CitySelectPage({Key? key});

  @override
  State<CitySelectPage> createState() => _CitySelectPageState();
}

class _CitySelectPageState extends State<CitySelectPage> {
  String dropdownValue = 'Seçiniz'; // Varsayılan başlangıç değeri

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Şehir Seç',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Kartın köşelerini yuvarlatır
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    // Resmin köşelerini yuvarlatır
                    child: Image.asset(
                      'assets/logo.jpeg',
                      width: 450,
                      height: 250,
                      fit: BoxFit
                          .cover, // Resmi uygun şekilde doldurmak için fit'i belirler
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Şehrinizi Seçin:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'Seçiniz',
                  'Ankara',
                  'İstanbul',
                  'Trabzon'
                ] // Şehirlerin listesi
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: dropdownValue == 'Seçiniz'
                      ? MaterialStateProperty.all<Color>(Colors.grey)
                      : MaterialStateProperty.all<Color>(Colors.green),
                  // Yukarıda, dropdownValue 'Seçiniz' değilse yeşil olacak şekilde bir kontrol yapısı oluşturduk
                  // Eğer dropdownValue 'Seçiniz' ise gri renkte olacak ve tıklanamayacak
                ),
                onPressed: dropdownValue == 'Seçiniz'
                    ? null
                    : () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: CityPage(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                      },
                child: Text(
                  'Devam Et',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
