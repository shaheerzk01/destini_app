import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey,
            side: BorderSide(width: 2, color: Colors.black),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(10),
          ),
        ),
      ),
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: const Text(
            'Destini',
            style: TextStyle(fontFamily: 'PermanentMarker'),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/photo-1617204072941-f344713fb8ac.jpeg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              child: const Text(
                'Play',
                style: TextStyle(fontFamily: 'PermanentMarker', fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    isIos: true,
                    duration: Duration(milliseconds: 400),
                    child: StoryPage(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

Story_brain story_brain = Story_brain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/istockphoto-1349387571-640x640.jpg'),
          fit: BoxFit.cover,
        )),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    story_brain.getStory(),
                    style:
                        TextStyle(fontSize: 25.0, fontFamily: 'SpecialElite',
                        color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      //Choice 1 made by user.
                      story_brain.nextStory(1);
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.brown.shade300),
                  child: Text(
                    story_brain.getChoice1(),
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'SpecialElite'),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: story_brain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        //Choice 2 made by user.
                        story_brain.nextStory(2);
                      });
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.brown),
                    child: Text(
                      story_brain.getChoice2(),
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'SpecialElite'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
