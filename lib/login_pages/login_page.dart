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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final email = 'email'; // Doğru e-posta
  final sifre = '123'; // Doğru şifre
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Geziyorum',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          children: [
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
                    'assets/logo.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit
                        .cover, // Resmi uygun şekilde doldurmak için fit'i belirler
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'GeziYorum',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 350,
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
                          controller: emailController,
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
                          controller: passwordController,
                          obscureText: _isObscure, // _isObscure değerine göre şifre gizlenecek veya gösterilecek
                          decoration: InputDecoration(
                            labelText: 'Şifre',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(!_isObscure ? Icons.visibility : Icons.visibility_off), // Göz simgesini değiştirir
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure; // _isObscure değerini tersine çevirir
                                });
                              },
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
                            // E-posta ve şifre kontrol ediliyor
                            if (emailController.text == email &&
                                passwordController.text == sifre) {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: CitySelectPage(),
                                  type: PageTransitionType.rightToLeft,
                                ),
                              );
                            } else {
                              // Yanlışsa, hata mesajı gösteriliyor
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Hatalı Giriş'),
                                  content: Text(
                                      'E-posta veya şifre yanlış. Lütfen tekrar deneyin.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Tamam'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Giriş Yap',
                            style: TextStyle(
                              color: Colors.black, // Metin rengini yeşil yapar
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hesabınız yok mu? ',
                              style: TextStyle(
                                color: Colors.black,
                                // Metin rengini yeşil yapar
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
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
                                  color: Colors.blue,
                                  // Metin rengini yeşil yapar
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
      ),
    );
  }
}
