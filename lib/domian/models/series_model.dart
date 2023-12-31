import 'dart:convert';

Series seriesFromJson(String str) => Series.fromJson(json.decode(str));

String seriesToJson(Series data) => json.encode(data.toJson());

class Series {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  String etag;
  Data data;

  Series({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    required this.data,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
    code: json["code"],
    status: json["status"],
    copyright: json["copyright"],
    attributionText: json["attributionText"],
    attributionHtml: json["attributionHTML"],
    etag: json["etag"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "copyright": copyright,
    "attributionText": attributionText,
    "attributionHTML": attributionHtml,
    "etag": etag,
    "data": data.toJson(),
  };
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Result> results;

  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
    count: json["count"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "limit": limit,
    "total": total,
    "count": count,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  int id;
  String title;
  String? description;
  String resourceUri;
  List<Url> urls;
  int startYear;
  int endYear;
  Rating rating;
  String type;
  String modified;
  Thumbnail thumbnail;
  Creators creators;
  Characters characters;
  Stories stories;
  Characters comics;
  Characters events;
  Next? next;
  dynamic previous;

  Result({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.urls,
    required this.startYear,
    required this.endYear,
    required this.rating,
    required this.type,
    required this.modified,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.comics,
    required this.events,
    required this.next,
    required this.previous,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    resourceUri: json["resourceURI"],
    urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
    startYear: json["startYear"],
    endYear: json["endYear"],
    rating: ratingValues.map[json["rating"]]!,
    type: json["type"],
    modified: json["modified"],
    thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    creators: Creators.fromJson(json["creators"]),
    characters: Characters.fromJson(json["characters"]),
    stories: Stories.fromJson(json["stories"]),
    comics: Characters.fromJson(json["comics"]),
    events: Characters.fromJson(json["events"]),
    next: json["next"] == null ? null : Next.fromJson(json["next"]),
    previous: json["previous"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "resourceURI": resourceUri,
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
    "startYear": startYear,
    "endYear": endYear,
    "rating": ratingValues.reverse[rating],
    "type": type,
    "modified": modified,
    "thumbnail": thumbnail.toJson(),
    "creators": creators.toJson(),
    "characters": characters.toJson(),
    "stories": stories.toJson(),
    "comics": comics.toJson(),
    "events": events.toJson(),
    "next": next?.toJson(),
    "previous": previous,
  };
}

class Characters {
  int available;
  String collectionUri;
  List<Next> items;
  int returned;

  Characters({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<Next>.from(json["items"].map((x) => Next.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class Next {
  String resourceUri;
  String name;

  Next({
    required this.resourceUri,
    required this.name,
  });

  factory Next.fromJson(Map<String, dynamic> json) => Next(
    resourceUri: json["resourceURI"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
  };
}

class Creators {
  int available;
  String collectionUri;
  List<CreatorsItem> items;
  int returned;

  Creators({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<CreatorsItem>.from(json["items"].map((x) => CreatorsItem.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class CreatorsItem {
  String resourceUri;
  String name;
  String role;

  CreatorsItem({
    required this.resourceUri,
    required this.name,
    required this.role,
  });

  factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "role": role,
  };
}

enum Rating {
  EMPTY,
  MARVEL_PSR,
  RATED_T,
  RATING_RATED_T
}

final ratingValues = EnumValues({
  "": Rating.EMPTY,
  "Marvel Psr": Rating.MARVEL_PSR,
  "Rated T": Rating.RATED_T,
  "Rated T+": Rating.RATING_RATED_T
});

class Stories {
  int available;
  String collectionUri;
  List<StoriesItem> items;
  int returned;

  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class StoriesItem {
  String resourceUri;
  String name;
  ItemType type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    type: itemTypeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "type": itemTypeValues.reverse[type],
  };
}

enum ItemType {
  COVER,
  INTERIOR_STORY
}

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "interiorStory": ItemType.INTERIOR_STORY
});

class Thumbnail {
  String path;
  Extension extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    path: json["path"],
    extension: extensionValues.map[json["extension"]]!,
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "extension": extensionValues.reverse[extension],
  };
}

enum Extension {
  JPG
}

final extensionValues = EnumValues({
  "jpg": Extension.JPG
});

class Url {
  UrlType type;
  String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    type: urlTypeValues.map[json["type"]]!,
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": urlTypeValues.reverse[type],
    "url": url,
  };
}

enum UrlType {
  DETAIL
}

final urlTypeValues = EnumValues({
  "detail": UrlType.DETAIL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
