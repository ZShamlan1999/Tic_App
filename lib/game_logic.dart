// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:math';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';

  static List<int> playerX = []; //هنا تخزن الارقام الي بيحجزها كل لاعب
  static List<int> playerO = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null)
      return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  // ignore: non_constant_identifier_names
  void PlayGame(int index, String activePlayer) {
    if (activePlayer == 'X')
      Player.playerX.add(index);
    else
      Player.playerO.add(index);
  }

  String checkWinner() {
    String winner = '';

    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6))
      winner = 'X';
    else if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6))
      winner = 'O ';
    else
      winner = '';

    return winner;
  }

  Future autoPlay(activePlayer) async {
    int index = 0;
    List<int> emptuCells = [];
    for (var i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i)))
        emptuCells.add(i);
    }

    // احتمالات الهجوم للكمبيوتر
    if (Player.playerO.containsAll(0, 1) && emptuCells.contains(2))
      index = 2;
    else if (Player.playerO.containsAll(3, 4) && emptuCells.contains(5))
      index = 5;
    else if (Player.playerO.containsAll(6, 7) && emptuCells.contains(8))
      index = 8;
    else if (Player.playerO.containsAll(0, 3) && emptuCells.contains(6))
      index = 6;
    else if (Player.playerO.containsAll(1, 4) && emptuCells.contains(7))
      index = 7;
    else if (Player.playerO.containsAll(2, 5) && emptuCells.contains(8))
      index = 8;
    else if (Player.playerO.containsAll(0, 4) && emptuCells.contains(8))
      index = 8;
    else if (Player.playerO.containsAll(2, 4) && emptuCells.contains(6))
      index = 8;
    else if (Player.playerO.containsAll(0, 2) && emptuCells.contains(1))
      index = 1;
    else if (Player.playerO.containsAll(3, 5) && emptuCells.contains(4))
      index = 4;
    else if (Player.playerO.containsAll(6, 8) && emptuCells.contains(7))
      index = 7;
    else if (Player.playerO.containsAll(0, 6) && emptuCells.contains(3))
      index = 3;
    else if (Player.playerO.containsAll(1, 7) && emptuCells.contains(4))
      index = 4;
    else if (Player.playerO.containsAll(2, 8) && emptuCells.contains(5))
      index = 5;
    else if (Player.playerO.containsAll(0, 8) && emptuCells.contains(4))
      index = 4;
    else if (Player.playerO.containsAll(2, 6) && emptuCells.contains(4))
      index = 4;
    else if (Player.playerO.containsAll(1, 2) && emptuCells.contains(0))
      index = 0;
    else if (Player.playerO.containsAll(4, 5) && emptuCells.contains(3))
      index = 3;
    else if (Player.playerO.containsAll(7, 8) && emptuCells.contains(6))
      index = 6;
    else if (Player.playerO.containsAll(3, 6) && emptuCells.contains(0))
      index = 0;
    else if (Player.playerO.containsAll(4, 7) && emptuCells.contains(1))
      index = 1;
    else if (Player.playerO.containsAll(5, 8) && emptuCells.contains(2))
      index = 2;
    else if (Player.playerO.containsAll(4, 8) && emptuCells.contains(0))
      index = 0;
    else if (Player.playerO.containsAll(4, 6) && emptuCells.contains(2))
      index = 2;

    //احتمالات الدفاع للكمبيوتر
    else if (Player.playerX.containsAll(0, 1) && emptuCells.contains(2))
      index = 2;
    else if (Player.playerX.containsAll(3, 4) && emptuCells.contains(5))
      index = 5;
    else if (Player.playerX.containsAll(6, 7) && emptuCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(0, 3) && emptuCells.contains(6))
      index = 6;
    else if (Player.playerX.containsAll(1, 4) && emptuCells.contains(7))
      index = 7;
    else if (Player.playerX.containsAll(2, 5) && emptuCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(0, 4) && emptuCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(2, 4) && emptuCells.contains(6))
      index = 6;
    else if (Player.playerX.containsAll(0, 2) && emptuCells.contains(1))
      index = 1;
    else if (Player.playerX.containsAll(3, 5) && emptuCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(6, 8) && emptuCells.contains(7))
      index = 7;
    else if (Player.playerX.containsAll(0, 6) && emptuCells.contains(3))
      index = 3;
    else if (Player.playerX.containsAll(1, 7) && emptuCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(2, 8) && emptuCells.contains(5))
      index = 5;
    else if (Player.playerX.containsAll(0, 8) && emptuCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(2, 6) && emptuCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(1, 2) && emptuCells.contains(0))
      index = 0;
    else if (Player.playerX.containsAll(4, 5) && emptuCells.contains(3))
      index = 3;
    else if (Player.playerX.containsAll(7, 8) && emptuCells.contains(6))
      index = 6;
    else if (Player.playerX.containsAll(3, 6) && emptuCells.contains(0))
      index = 0;
    else if (Player.playerX.containsAll(4, 7) && emptuCells.contains(1))
      index = 1;
    else if (Player.playerX.containsAll(5, 8) && emptuCells.contains(2))
      index = 2;
    else if (Player.playerX.containsAll(4, 8) && emptuCells.contains(0))
      index = 0;
    else if (Player.playerX.containsAll(4, 6) && emptuCells.contains(2))
      index = 2;
    else {
      Random random = Random();
      int randomIndex = random.nextInt(emptuCells.length);

      index = emptuCells[randomIndex];
    }
    PlayGame(index, activePlayer);
  }
}
