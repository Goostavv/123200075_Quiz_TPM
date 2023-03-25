import 'package:quiztpm_ifh/quiz_123200075/game_store.dart';
class Favorite {
  final GameStore? gameStore;
  final bool? isFavorite;

  Favorite({this.gameStore, this.isFavorite});

  var favoriteList = <Favorite>[];
}