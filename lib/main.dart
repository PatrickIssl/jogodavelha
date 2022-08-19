import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;

  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(147, 147, 147, 1.0),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Player',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          oScore.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Computador',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text(
                          xScore.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          displayElement[index],
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.indigo[50],
                  textColor: Colors.black,
                  onPressed: _clearScoreBoard,
                  child: Text("Clear Score Board"),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (displayElement[index] == '') {
        displayElement[index] = 'O';
        filledBoxes++;
        if (filledBoxes != 9) {
          int filledAntigo = filledBoxes;
          _computerMovimentWin();
          if(filledAntigo == filledBoxes){
          _computerMoviment();}
          filledBoxes++;
        }
      }
      _checkWinner();
    });
  }

  void _computerMovimentWin() {
    if ((displayElement[1] == displayElement[2] &&
                displayElement[1] != '' &&
                displayElement[0] == '') &&
            displayElement[1] == "X" ||
        (displayElement[6] == displayElement[3] &&
                displayElement[6] != '' &&
                displayElement[0] == '') &&
            displayElement[6] == "X" ||
        displayElement[8] == "X" &&
            (displayElement[8] == displayElement[4] &&
                displayElement[8] != '' &&
                displayElement[0] == '')) {
      displayElement[0] = 'X';
    } else if ((displayElement[0] == displayElement[2] &&
                displayElement[0] != '' &&
                displayElement[1] == '') &&
            displayElement[0] == "X" ||
        (displayElement[7] == displayElement[4] &&
                displayElement[7] != '' &&
                displayElement[1] == '') &&
            displayElement[7] == "X") {
      displayElement[1] = 'X';
      filledBoxes++;
    } else if ((displayElement[0] == displayElement[1] &&
                displayElement[0] != '' &&
                displayElement[2] == '') &&
            displayElement[0] == "X" ||
        (displayElement[8] == displayElement[5] &&
                displayElement[8] != '' &&
                displayElement[2] == '') &&
            displayElement[8] == "X" ||
        (displayElement[6] == displayElement[4] &&
                displayElement[6] != '' &&
                displayElement[2] == '') &&
            displayElement[6] == "X") {
      displayElement[2] = 'X';
      filledBoxes++;
    } else if ((displayElement[4] == displayElement[5] &&
                displayElement[4] != '' &&
                displayElement[3] == '') &&
            displayElement[4] == "X" ||
        (displayElement[0] == displayElement[6] &&
                displayElement[0] != '' &&
                displayElement[3] == '') &&
            displayElement[0] == "X") {
      displayElement[3] = 'X';
      filledBoxes++;
    } else if ((displayElement[1] == displayElement[7] &&
                displayElement[1] != '' &&
                displayElement[4] == '') &&
            displayElement[1] == "X" ||
        (displayElement[0] == displayElement[8] &&
                displayElement[0] != '' &&
                displayElement[4] == '') &&
            displayElement[0] == "X" ||
        (displayElement[2] == displayElement[6] &&
                displayElement[2] != '' &&
                displayElement[4] == '') &&
            displayElement[2] == "X" ||
        (displayElement[3] == displayElement[5] &&
                displayElement[3] != '' &&
                displayElement[4] == '') &&
            displayElement[3] == "X") {
      displayElement[4] = 'X';
      filledBoxes++;
    } else if ((displayElement[3] == displayElement[4] &&
            displayElement[3] != '' &&
            displayElement[5] == '') && displayElement[3] == "X" ||
        (displayElement[2] == displayElement[8] &&
            displayElement[2] != '' &&
            displayElement[5] == '')
            && displayElement[2] == "X"
    ) {
      displayElement[5] = 'X';
      filledBoxes++;
    } else if ((displayElement[2] == displayElement[4] &&
            displayElement[2] != '' &&
            displayElement[6] == '') && displayElement[2] == "X" ||
        (displayElement[8] == displayElement[7] &&
            displayElement[8] != '' &&
            displayElement[6] == '')  && displayElement[8] == "X"||
        (displayElement[0] == displayElement[3] &&
            displayElement[0] != '' &&
            displayElement[6] == '') && displayElement[0] == "X") {
      displayElement[6] = 'X';
      filledBoxes++;
    } else if ((displayElement[8] == displayElement[6] &&
            displayElement[8] != '' &&
            displayElement[7] == '') && displayElement[8] == "X" ||
        (displayElement[1] == displayElement[4] &&
            displayElement[1] != '' &&
            displayElement[7] == '') && displayElement[1] == "X") {
      displayElement[7] = 'X';
      filledBoxes++;
    } else if ((displayElement[0] == displayElement[4] &&
            displayElement[0] != '' &&
            displayElement[8] == '') && displayElement[0] == "X" ||
        (displayElement[2] == displayElement[5] &&
            displayElement[2] != '' &&
            displayElement[8] == '') && displayElement[2] == "X" ||
        (displayElement[6] == displayElement[7] &&
            displayElement[6] != '' &&
            displayElement[8] == '') && displayElement[6] == "X" ) {
      displayElement[8] = 'X';
      filledBoxes++;
    }
  }

  void _computerMoviment() {
    if ((displayElement[1] == displayElement[2] &&
            displayElement[1] != '' &&
            displayElement[0] == '') ||
        (displayElement[6] == displayElement[3] &&
            displayElement[6] != '' &&
            displayElement[0] == '') ||
        (displayElement[8] == displayElement[4] &&
            displayElement[8] != '' &&
            displayElement[0] == '')) {
      displayElement[0] = 'X';
    } else if ((displayElement[0] == displayElement[2] &&
            displayElement[0] != '' &&
            displayElement[1] == '') ||
        (displayElement[7] == displayElement[4] &&
            displayElement[7] != '' &&
            displayElement[1] == '')) {
      displayElement[1] = 'X';
    } else if ((displayElement[0] == displayElement[1] &&
            displayElement[0] != '' &&
            displayElement[2] == '') ||
        (displayElement[8] == displayElement[5] &&
            displayElement[8] != '' &&
            displayElement[2] == '') ||
        (displayElement[6] == displayElement[4] &&
            displayElement[6] != '' &&
            displayElement[2] == '')) {
      displayElement[2] = 'X';
    } else if ((displayElement[4] == displayElement[5] &&
            displayElement[4] != '' &&
            displayElement[3] == '') ||
        (displayElement[0] == displayElement[6] &&
            displayElement[0] != '' &&
            displayElement[3] == '')) {
      displayElement[3] = 'X';
    } else if ((displayElement[1] == displayElement[7] &&
            displayElement[1] != '' &&
            displayElement[4] == '') ||
        (displayElement[0] == displayElement[8] &&
            displayElement[0] != '' &&
            displayElement[4] == '') ||
        (displayElement[2] == displayElement[6] &&
            displayElement[2] != '' &&
            displayElement[4] == '') ||
        (displayElement[3] == displayElement[5] &&
            displayElement[3] != '' &&
            displayElement[4] == '')) {
      displayElement[4] = 'X';
    } else if ((displayElement[3] == displayElement[4] &&
            displayElement[3] != '' &&
            displayElement[5] == '') ||
        (displayElement[2] == displayElement[8] &&
            displayElement[2] != '' &&
            displayElement[5] == '')) {
      displayElement[5] = 'X';
    } else if ((displayElement[2] == displayElement[4] &&
            displayElement[2] != '' &&
            displayElement[6] == '') ||
        (displayElement[8] == displayElement[7] &&
            displayElement[8] != '' &&
            displayElement[6] == '') ||
        (displayElement[0] == displayElement[3] &&
            displayElement[0] != '' &&
            displayElement[6] == '')) {
      displayElement[6] = 'X';
    } else if ((displayElement[8] == displayElement[6] &&
            displayElement[8] != '' &&
            displayElement[7] == '') ||
        (displayElement[1] == displayElement[4] &&
            displayElement[1] != '' &&
            displayElement[7] == '')) {
      displayElement[7] = 'X';
    } else if ((displayElement[0] == displayElement[4] &&
            displayElement[0] != '' &&
            displayElement[8] == '') ||
        (displayElement[2] == displayElement[5] &&
            displayElement[2] != '' &&
            displayElement[8] == '') ||
        (displayElement[6] == displayElement[7] &&
            displayElement[6] != '' &&
            displayElement[8] == '')) {
      displayElement[8] = 'X';
    } else {
      _computerMovimentAleatory();
    }
  }

  void _computerMovimentAleatory() {
    int i = Random().nextInt(8);
    if (displayElement[3] == '' && filledBoxes == 3) {
      displayElement[3] = 'X';
    } else if (displayElement[4] == 'O' && filledBoxes == 1) {
      displayElement[2] = 'X';
    } else if (displayElement[4] == '') {
      displayElement[4] = 'X';
    } else if (i % 2 > 0 && filledBoxes == 3 && displayElement[i] == '') {
      displayElement[i] = 'X';
    } else {
      if (displayElement[i] == '') {
        displayElement[i] = 'X';
      } else {
        _computerMovimentAleatory();
      }
    }
  }

  void _checkWinner() {
    // Checking rows
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    }

    // Checking Column
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    }

    // Checking Diagonal
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(winner == 'O'
                ? "O jogador é o vencedor!!!"
                : "O computador é o vencedor!!!"),
            actions: [
              FlatButton(
                child: Text("Play Again"),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Empate"),
            actions: [
              FlatButton(
                child: Text("Play Again"),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    filledBoxes = 0;
  }

  void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
