import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyPage(),
  ));
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            color: Colors.redAccent,
            alignment: Alignment.bottomCenter,
            child: Text(
              "TAP-GAME!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            )),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GamePage()));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Colors.blueAccent,
            elevation: 5.0,
            child: Text('Start',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ]),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double redHeight = 0, blueHeight = 0, winning = 0;
  bool init = false;
  int scoreA = 0, scoreB = 0;

  @override
  Widget build(BuildContext context) {
    if (!init) {
      blueHeight = MediaQuery.of(context).size.height / 2;
      redHeight = MediaQuery.of(context).size.height / 2;
      winning = MediaQuery.of(context).size.height - 90;
      init = true;
    }

    return Scaffold(
        body: Column(children: [
      MaterialButton(
          onPressed: () {
            setState(() {
              redHeight += 30;
              blueHeight -= 30;
              scoreA++;
              scoreB > 0 ? scoreB-- : scoreB = 0;
              if (redHeight > winning) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage('A', scoreA)));
              }
            });
          },
          padding: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.all(40),
            height: redHeight,
            width: double.infinity,
            color: Colors.redAccent,
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Player A",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  scoreA.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )),
      MaterialButton(
          onPressed: () {
            setState(() {
              redHeight -= 30;
              blueHeight += 30;
              scoreB++;
              scoreA > 0 ? scoreA-- : scoreA = 0;
              if (blueHeight > winning) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage('B', scoreB)));
              }
            });
          },
          padding: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.all(40),
            height: blueHeight,
            width: double.infinity,
            color: Colors.blueAccent,
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Player B",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  scoreB.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )),
    ]));
  }
}

class ResultPage extends StatelessWidget {
  int score = 0;
  String winner = '';

  ResultPage(this.winner, this.score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: winner == 'A' ? Colors.redAccent : Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Player $winner won!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
              Text("Score: $score",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                color: Colors.white,
                padding: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Icon(Icons.refresh_rounded),
              ),
            ],
          ),
        ));
  }
}
