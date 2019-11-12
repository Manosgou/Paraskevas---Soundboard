import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'colours.dart';
import 'audiofiles.dart';

class All extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AllState();
  }
}

class AllState extends State<All> {
  
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  var _currentAssetPosition = -1;

  void _open(int assetIndex) {
    _currentAssetPosition = assetIndex % assets.length;
    _assetsAudioPlayer.open(
      AssetsAudio(
        asset: assets[_currentAssetPosition],
        folder: "assets/audio/",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text("Επισόδειο 1ο...."),
      ),backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          _btn(txt: 'Play', onPressed: () => _open(0)),
          _btn(
            txt: 'Play2',
            onPressed: () => _open(1),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _assetsAudioPlayer.stop();
        },
        label: Text('Stop'),
        icon: Icon(Icons.stop),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class _btn extends StatelessWidget {
  final String txt;
  final VoidCallback onPressed;

  const _btn({Key key, this.txt, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 48.0,
      child: RaisedButton(child: Text(txt), onPressed: onPressed),
    );
  }
}
