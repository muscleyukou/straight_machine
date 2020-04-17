import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  String _text01 ="おめでとうございます";
//  String _text02 ="合格です";
//  String _text03 ="よく出来ました";
//  String _text04 ="残念です";
//  String _text05 ="不合格です";
//  String _text06 ="頑張りましょう";
  List<String> _texts = [
    "おめでとうございます",
    "合格です",
    "よく出来ました",
    "残念です",
    "不合格です",
    "頑張りましょう"
  ];

  List<int> _soundIds = [0, 0, 0, 0, 0, 0];
  Soundpool _soundpool;
  int number =3;

  @override
  void initState(){
    super.initState();
     _initSounds();
    print("initState終わったで＝ビルトメソッド回った");
  }

 Future<void>  _initSounds() async {
    _soundpool = Soundpool();
    _soundIds[0]=await loadSound("ssets/sounds/sound1.mp3");
    _soundIds[1]=await loadSound("ssets/sounds/sound2.mp3");
    _soundIds[2]=await loadSound("ssets/sounds/sound3.mp3");
    _soundIds[3]=await loadSound("ssets/sounds/sound4.mp3");
    _soundIds[4]=await loadSound("ssets/sounds/sound5.mp3");
    _soundIds[5]=await loadSound("ssets/sounds/sound6.mp3");
    print("initState終わったで＝効果音ロード出来たで");
    setState(() {

    });
  }
  Future<int>loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value)=> _soundpool.load(value));
  }
  @override
  void dispose() {
    _soundpool.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ツッコミマシーン"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 1, child: _soundButton(_texts[0], _soundIds[0])),
                  //todo ボタン
                  Expanded(
                      flex: 1, child: _soundButton(_texts[1], _soundIds[1])),
                  //TODO ボタン
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 1, child: _soundButton(_texts[2], _soundIds[2])),
                  //todo ボタン
                  Expanded(
                      flex: 1, child: _soundButton(_texts[3], _soundIds[3])),
                  //TODO ボタン
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 1, child: _soundButton(_texts[4], _soundIds[4])),
                  //todo ボタン
                  Expanded(
                      flex: 1, child: _soundButton(_texts[5], _soundIds[5])),
                  //TODO ボタン
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundButton(String displayText, int soundId) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: ()=> _playSound(soundId),
        child: Text(displayText),
      ),
    );
  }
void _playSound(int soundId){
     _soundpool.play(soundId);
}

}
