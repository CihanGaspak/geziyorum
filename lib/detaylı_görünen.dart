import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animations/animations.dart';


const String loremIpsumParagraph =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae.\n'
    '\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae';

class DetayliGorunen extends StatefulWidget {
  const DetayliGorunen({Key? key});

  @override
  State<DetayliGorunen> createState() => _DetayliGorunenState();
}

class _DetayliGorunenState extends State<DetayliGorunen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Gezme Tozma',
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
              image: 'assets/logo.png',
              text: 'Sümele Manastırı',
            ),
          ],
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
  late ContainerTransitionType _transitionType;
  bool isStarred = false;
  @override
  void initState() {
    super.initState();
    _transitionType = ContainerTransitionType.fade; // Varsayılan geçiş türü
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Scaffold(
              body: Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: ScrollConfiguration(
                    behavior: ScrollBehavior().copyWith(overscroll: false),
                    child: ListView(
                      children: [
                        Text(
                          'Modal Bottom Sheet',
                        ),
                        Image.asset(
                          widget.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          widget.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          widget.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          widget.image,
                          width: 200,
                          height: 200,
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
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              widget.image,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          // Buton veya herhangi bir etkileşim için kullanılabilir
          Column(
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
                icon: Transform.rotate(
                  angle: -90 * 3.141592653589793 / 180,
                  child: Icon(Icons.arrow_back_ios),
                ),
                onPressed: () {
                  _showBottomSheet(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
