class EndPoints {
  const EndPoints._();

  static const String baseUrl = 'https://db.ygoprodeck.com/api/v7/';
  static const String login = "auth/login";
  static const String user = "userdata";
  static const String cardsImage = "https://images.ygoprodeck.com/images/cards" ; 
  static const String cardsImages = "https://images.ygoprodeck.com/images" ; 
  static const String archtypecards = "https://db.ygoprodeck.com/api/v7/cardinfo.php?archetype=" ; 



  static const String cardsinfo = "$baseUrl/cardinfo.php" ; 
  static const String searchcards = "$baseUrl/cardinfo.php?" ; 
  static const String rootLottie = "assets/images/lottie" ; 


  static const Duration timeout = Duration(seconds: 30);

  static const String token = 'authToken';
}

enum LoadDataState { initialize, loading, loaded, error, timeout, unknownerror, offline , none}

class AppImageAsset {
  static const String rootImages = "assets/images";
  static const String rootLottie = "assets/images/lottie";
  static const String background = "$rootImages/background.png";
  static const String backgroundgif = "$rootImages/bg.gif";
  static const String emptycard = "$rootImages/card.jpg";
  static const String headcoin = "$rootImages/head.png";
  static const String tailcoin = "$rootImages/tail.png";


  //dice
  static const String dice1 = "$rootImages/one.png";
  static const String dice2 = "$rootImages/two.png";
  static const String dice3 = "$rootImages/three.png";
  static const String dice4 = "$rootImages/four.png";
  static const String dice5 = "$rootImages/five.png";
  static const String dice6 = "$rootImages/six.png";





   static const String lottieLoading = "$rootLottie/loading.json";
  static const String lottienodata = "$rootLottie/nodata.json";
  static const String lottieoffline = "$rootLottie/offline.json";
  static const String lottieserver = "$rootLottie/server.json";


  
}

