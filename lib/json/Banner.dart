

class BannerInfo {

  final String id;
  final String name;
  final String current_play;
  final String recommend_language;
  final String Introduction;
  final String current_play_time;
  final String img_url;
  final String album_img;
  final String broadcaster;
  final String length;
  final int type;
  final String playbill_url;
  final String praise;
  final String enjoy_url;
  final String more_enjoy_url;
  final String download_url;
  final List<String> play_url;
  final List<String> albums_play;
  final String albums_url;
  final String album_list_url;
  final String album_Introduction_url;
  final String is_collect;

  BannerInfo({this.id,this.name
    ,this.current_play,
    this.recommend_language,
    this.Introduction,
    this.current_play_time,
    this.img_url,
    this.album_img,
    this.broadcaster,
    this.length,
    this.type,
    this.playbill_url,
    this.praise,
    this.enjoy_url,
    this.more_enjoy_url,
    this.download_url,
    this.play_url,
    this.albums_play,
    this.albums_url,
    this.album_list_url,
    this.album_Introduction_url,
    this.is_collect
  });

  factory BannerInfo.fromJson(Map<String,dynamic> json){
    if(json == null){
      throw FormatException("Null JSON provided to BannerInfo");
    }
    return BannerInfo(
      id: json['id'],
      name: json['name'],
      current_play: json['current_play'],
      recommend_language: json['recommend_language'],
      Introduction: json['Introduction'],
      current_play_time: json['current_play_time'],
      img_url: json['img_url'],
      album_img: json['album_img'],
      broadcaster: json['broadcaster'],
      length: json['length'],
      type: json['type'],
      praise: json['praise'],
      enjoy_url: json['enjoy_url'],
      more_enjoy_url: json['more_enjoy_url'],
      download_url: json['download_url'],
//      play_url: json['play_url'] != null
//          ? List<String>.from(json['play_url'])
//          : null,
//      albums_play: json['albums_play'] != null
//          ? List<String>.from(json['albums_play'])
//          : null,
      album_list_url: json['album_list_url'],
      album_Introduction_url: json['album_Introduction_url'],
      is_collect: json['is_collect']



    );
  }
}



