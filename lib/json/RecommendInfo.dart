

class RecommendInfo{
  final String title;
  final int index_type;
  final String more_contents_url;
  final List<ContentsInfo> contents;

  RecommendInfo({
   this.title,
   this.index_type,
   this.more_contents_url,
   this.contents
});

  factory RecommendInfo.fromJson(Map<String,dynamic> json){

    var list = json['contents'] as List;

    List<ContentsInfo> imagesList = list.map((i) => ContentsInfo.fromJson(i)).toList();
    return RecommendInfo(
      title: json['title'],
      index_type: json['index_type'],
      more_contents_url: json['more_contents_url'],
      contents:imagesList,

    );
  }
}

class ContentsInfo{

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
  final String type;
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
  final bool is_collect;

  ContentsInfo({this.id,this.name
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

  factory ContentsInfo.fromJson(Map<String,dynamic> json){
    if(json == null){
      throw FormatException("Null JSON provided to BannerInfo");
    }
    return ContentsInfo(
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