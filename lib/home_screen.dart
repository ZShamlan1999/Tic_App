import 'package:flutter/material.dart';
import 'package:tic_app/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = 'X'; //معرفه من هو اللاعب اكس او او
  bool gameOver = false; // هل اللعبه انتهت ام لا , اذا انتهت يتجمد التطبيق
  int turn =
      0; // عدد المحاولات مثلا نحنا معانا 9 مربعات كل مايلعب لعبه يزيد واحد

  String result = ''; // هنا تعلن النتيجه فائز او تعادل

  Game game = Game();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child:
                 MediaQuery.of(context).orientation == Orientation.portrait
                     ?
                Column(
          children: [
              ...FirstBlock(),
            _expanded(context),
            ...LastBlock(),
          ],
        )
            : Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //         ...FirstBlock(),
                        ...LastBlock(),
                      ],
                    ),
                  ),
                  _expanded(context),
                ],
              )
            ));
  }

  // ignore: non_constant_identifier_names
  List<Widget> FirstBlock() {
    return [
      SwitchListTile.adaptive(
          title: const Text(
            'Turn on/off two player',
            style: TextStyle(color: Colors.white, fontSize: 28),
            textAlign: TextAlign.center,
          ),
          value: isSwitched,
          onChanged: ((bool newValue) {
            setState(() {
              isSwitched = newValue;
            });
          })),
      Text(
        "It's $activePlayer turn".toUpperCase(),
        style: const TextStyle(color: Colors.white, fontSize: 50),
        textAlign: TextAlign.center,
      ),
    ];
  }

  // ignore: non_constant_identifier_names
  List<Widget> LastBlock() {
    return [
      Text(
        result,
        style: const TextStyle(color: Colors.white, fontSize: 40),
        textAlign: TextAlign.center,
      ),
      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            Player.playerO = [];
            Player.playerX = [];
            activePlayer = 'X';
            gameOver = false;
            turn = 0;
            result = '';
            isSwitched = false;
          });
        },
        icon: const Icon(Icons.replay),
        label: const Text('Repeat the game'),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).splashColor)),
      ),
    ];
  }

  Expanded _expanded(BuildContext context) {
    return Expanded(
        child: GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0, // لضبط الابعاد
      childAspectRatio: 1.0,
      children: List.generate(
          9,
          (index) => InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: gameOver ? null : () => _onTap(index),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      Player.playerX.contains(index)
                          ? //معناه هل بلاير اكس يحتوي على الاندكس الموجود عند الانكويل
                          'X'
                          : Player.playerO.contains(index)
                              ? 'O'
                              : '',
                      style: TextStyle(
                          color: Player.playerX.contains(index)
                              ? Colors.blue
                              : Colors.pink,
                          fontSize: 50),
                    ),
                  ),
                ),
              )),
    ));
  }

  _onTap(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.PlayGame(index, activePlayer);
      updatestate();

      // if (!isSwitched && !gameOver && turn != 9) {
      //   await game.autoPlay(activePlayer);
      //   updatestate();
      // }
    }
  }

  void updatestate() {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
      String winnerPlayer = game.checkWinner();
      if (winnerPlayer != '') {
        gameOver = true;
        result = '$winnerPlayer is the Winner';
      } else if (!gameOver && turn == 9) {
        // ignore: unnecessary_string_escapes
        result = 'It\s Draw!';
      }
    });
  }
}
