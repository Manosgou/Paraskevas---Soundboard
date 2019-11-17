import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:paraskevas/main.dart';
import 'audiofiles.dart';
import 'colours.dart';

class SecondRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SecondRouteState();
  }
}

class SecondRouteState extends State<SecondRoute> {
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

  Future<bool> _onWillPop() {
    if (_assetsAudioPlayer.isPlaying.value) {
      _assetsAudioPlayer.stop();
    }

    Navigator.of(context).pop(main());
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: Text("Επισόδειο 1ο...."),
        ),
        backgroundColor: BackgroundColor,
        body: ListView(
          children: <Widget>[
            _btn(
              txt: 'Play',
              onPressed: () => _open(0),
            ),
            _btn(
              txt: 'Play2',
              onPressed: () => _open(1),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_assetsAudioPlayer.isPlaying.value) {
              _assetsAudioPlayer.stop();
            }
          },
          label: Text('Stop'),
          icon: Icon(Icons.stop),
          backgroundColor: Colors.red,
        ),
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
      child: RaisedButton(
        child: Text(txt),
        onPressed: onPressed,
        textColor: Colors.white,
        color: PrimaryColor,
      ),
    );
  }
}
