import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IstanbulKonaklama extends StatefulWidget {
  const IstanbulKonaklama({Key? key});

  @override
  State<IstanbulKonaklama> createState() => _IstanbulKonaklamaState();
}

class _IstanbulKonaklamaState extends State<IstanbulKonaklama> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Yeme İçme',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(
            overscroll: false,
          ),
          child: ListView(
            children: [
              MyCustomWidget(
                image: 'assets/istanbul_otel1.jpg',
                text: 'Ortahisar Lokantası',
              ),
              MyCustomWidget(
                image: 'assets/istanbul_otel2.jpg',
                text: 'Ortahisar Lokantası',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomWidget extends StatefulWidget {
  final String image;
  final String text;
  final TextStyle? textTheme;

  const MyCustomWidget({
    required this.image,
    required this.text,
    this.textTheme,
  });

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  bool isStarred = false;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Klavye açıldığında ekranı tamamen kaplamak için bottom padding ayarlayın
            left: 15,
            right: 15,
            top: MediaQuery.of(context).size.height * 0.05, // Yukarıya ulaşmak için yüzde bazında bir değer ayarlayın (örneğin, %10)
          ),
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Modal Bottom Sheet',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width - 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width - 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width - 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width - 30,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.image,
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(

                    children: [
                      Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              isStarred ? Icons.star : Icons.star_border,
                              color: isStarred ? Colors.yellow[700] : null,
                            ),
                            onPressed: () {
                              setState(() {
                                isStarred = !isStarred;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_downward),
                            onPressed: () {
                              _showBottomSheet(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
