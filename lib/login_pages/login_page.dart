import 'package:flutter/material.dart';
import 'package:geziyorum/city_select.dart';
import 'package:geziyorum/login_pages/sign_up.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Geziyorum',style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body: Column(
        children: [
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Kartın köşelerini yuvarlatır
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Resmin köşelerini yuvarlatır
                child: Image.asset(
                  'assets/logo.jpeg',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover, // Resmi uygun şekilde doldurmak için fit'i belirler
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'GeziYorum',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Center(
            child: Container(
              height: 400,
              width: 300,
              child: Card(
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Giriş Yap',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'E-posta',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        obscureText: true, // Şifrenin gizli olmasını sağlar
                        decoration: InputDecoration(
                          labelText: 'Şifre',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green), // Düğme rengini mavi yapar
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(100, 50)), // Düğme boyutunu belirler
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: CitySelectPage(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        child: Text(
                          'Giriş Yap',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hesabınız yok mu? ',
                            style: TextStyle(
                              color: Colors.black, // Metin rengini yeşil yapar
                              fontSize: 14,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: SignUpPage(),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            },
                            child: Text(
                              'Hemen kaydolun!',
                              style: TextStyle(
                                color: Colors.blue, // Metin rengini yeşil yapar
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
