/*[
{
"albumId": 1,
"id": 1,
"title": "accusamus beatae ad facilis cum similique qui sunt",
"url": "http://placehold.it/600/92c952",
"thumbnailUrl": "http://placehold.it/150/92c952"
},
{
"albumId": 1,
"id": 2,
"title": "reprehenderit est deserunt velit ipsam",
"url": "http://placehold.it/600/771796",
"thumbnailUrl": "http://placehold.it/150/771796"
},
{
"albumId": 1,
"id": 3,
"title": "officia porro iure quia iusto qui ipsa ut modi",
"url": "http://placehold.it/600/24f355",
"thumbnailUrl": "http://placehold.it/150/24f355"
}
]*/

class PhotosList {
  final List<Photo> photos;

  PhotosList({
    this.photos,
  });

  factory PhotosList.fromJson(List<dynamic> parsedJson) {

    List<Photo> photos = new List<Photo>();
    photos = parsedJson.map((i)=>Photo.fromJson(i)).toList();

    return new PhotosList(
        photos: photos
    );
  }
}

class Photo{
  final String id;
  final String title;
  final String url;

  Photo({
    this.id,
    this.url,
    this.title
  }) ;

  factory Photo.fromJson(Map<String, dynamic> json){
    return new Photo(
      id: json['id'].toString(),
      title: json['title'],
      url: json['json'],
    );
  }

}