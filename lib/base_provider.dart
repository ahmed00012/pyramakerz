import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soundpool/soundpool.dart';

class BaseProvider with ChangeNotifier {
  static BaseProvider get(context) =>
      Provider.of<BaseProvider>(context, listen: false);
  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isCreateLoading = false;

  bool get getIsCreateLoading => _isCreateLoading;

  set isCreateLoading(bool value) {
    _isCreateLoading = value;
    notifyListeners();
  }

  playSound({bool finish = false,String? sound}) async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle
        .load( sound ?? (finish ? "assets/sounds/cheers.mp3" : "assets/sounds/correct.mp3"))
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
}
