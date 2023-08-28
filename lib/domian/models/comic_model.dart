import 'dart:convert';

class Comics {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  String etag;
  Data data;

  Comics({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    required this.data,
  });

  factory Comics.fromRawJson(String str) => Comics.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
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

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String? description;
  String modified;
  Isbn isbn;
  String upc;
  DiamondCode diamondCode;
  String ean;
  String issn;
  Format format;
  int pageCount;
  List<TextObject> textObjects;
  String resourceUri;
  List<Url> urls;
  Series series;
  List<Series> variants;
  List<dynamic> collections;
  List<Series> collectedIssues;
  List<Date> dates;
  List<Price> prices;
  Thumbnail thumbnail;
  List<Thumbnail> images;
  Creators creators;
  Characters characters;
  Stories stories;
  Characters events;

  Result({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceUri,
    required this.urls,
    required this.series,
    required this.variants,
    required this.collections,
    required this.collectedIssues,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    digitalId: json["digitalId"],
    title: json["title"],
    issueNumber: json["issueNumber"],
    variantDescription: json["variantDescription"],
    description: json["description"],
    modified: json["modified"],
    isbn: isbnValues.map[json["isbn"]]!,
    upc: json["upc"],
    diamondCode: diamondCodeValues.map[json["diamondCode"]]!,
    ean: json["ean"],
    issn: json["issn"],
    format: formatValues.map[json["format"]]!,
    pageCount: json["pageCount"],
    textObjects: List<TextObject>.from(json["textObjects"].map((x) => TextObject.fromJson(x))),
    resourceUri: json["resourceURI"],
    urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
    series: Series.fromJson(json["series"]),
    variants: List<Series>.from(json["variants"].map((x) => Series.fromJson(x))),
    collections: List<dynamic>.from(json["collections"].map((x) => x)),
    collectedIssues: List<Series>.from(json["collectedIssues"].map((x) => Series.fromJson(x))),
    dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
    prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    images: List<Thumbnail>.from(json["images"].map((x) => Thumbnail.fromJson(x))),
    creators: Creators.fromJson(json["creators"]),
    characters: Characters.fromJson(json["characters"]),
    stories: Stories.fromJson(json["stories"]),
    events: Characters.fromJson(json["events"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "digitalId": digitalId,
    "title": title,
    "issueNumber": issueNumber,
    "variantDescription": variantDescription,
    "description": description,
    "modified": modified,
    "isbn": isbnValues.reverse[isbn],
    "upc": upc,
    "diamondCode": diamondCodeValues.reverse[diamondCode],
    "ean": ean,
    "issn": issn,
    "format": formatValues.reverse[format],
    "pageCount": pageCount,
    "textObjects": List<dynamic>.from(textObjects.map((x) => x.toJson())),
    "resourceURI": resourceUri,
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
    "series": series.toJson(),
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
    "collections": List<dynamic>.from(collections.map((x) => x)),
    "collectedIssues": List<dynamic>.from(collectedIssues.map((x) => x.toJson())),
    "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
    "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
    "thumbnail": thumbnail.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "creators": creators.toJson(),
    "characters": characters.toJson(),
    "stories": stories.toJson(),
    "events": events.toJson(),
  };
}

class Characters {
  int available;
  String collectionUri;
  List<Series> items;
  int returned;

  Characters({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Characters.fromRawJson(String str) => Characters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<Series>.from(json["items"].map((x) => Series.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class Series {
  String resourceUri;
  String name;

  Series({
    required this.resourceUri,
    required this.name,
  });

  factory Series.fromRawJson(String str) => Series.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Series.fromJson(Map<String, dynamic> json) => Series(
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

  factory Creators.fromRawJson(String str) => Creators.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  Role role;

  CreatorsItem({
    required this.resourceUri,
    required this.name,
    required this.role,
  });

  factory CreatorsItem.fromRawJson(String str) => CreatorsItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    role: roleValues.map[json["role"]]!,
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "role": roleValues.reverse[role],
  };
}

enum Role {
  COLORIST,
  EDITOR,
  INKER,
  LETTERER,
  PENCILER,
  PENCILLER,
  PENCILLER_COVER,
  WRITER
}

final roleValues = EnumValues({
  "colorist": Role.COLORIST,
  "editor": Role.EDITOR,
  "inker": Role.INKER,
  "letterer": Role.LETTERER,
  "penciler": Role.PENCILER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

class Date {
  DateType type;
  String date;

  Date({
    required this.type,
    required this.date,
  });

  factory Date.fromRawJson(String str) => Date.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    type: dateTypeValues.map[json["type"]]!,
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "type": dateTypeValues.reverse[type],
    "date": date,
  };
}

enum DateType {
  DIGITAL_PURCHASE_DATE,
  FOC_DATE,
  ONSALE_DATE,
  UNLIMITED_DATE
}

final dateTypeValues = EnumValues({
  "digitalPurchaseDate": DateType.DIGITAL_PURCHASE_DATE,
  "focDate": DateType.FOC_DATE,
  "onsaleDate": DateType.ONSALE_DATE,
  "unlimitedDate": DateType.UNLIMITED_DATE
});

enum DiamondCode {
  EMPTY,
  JUL190068
}

final diamondCodeValues = EnumValues({
  "": DiamondCode.EMPTY,
  "JUL190068": DiamondCode.JUL190068
});

enum Format {
  COMIC,
  DIGEST,
  EMPTY,
  TRADE_PAPERBACK
}

final formatValues = EnumValues({
  "Comic": Format.COMIC,
  "Digest": Format.DIGEST,
  "": Format.EMPTY,
  "Trade Paperback": Format.TRADE_PAPERBACK
});

class Thumbnail {
  String path;
  Extension extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromRawJson(String str) => Thumbnail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

enum Isbn {
  EMPTY,
  THE_0785111298,
  THE_0785114513,
  THE_0785115609
}

final isbnValues = EnumValues({
  "": Isbn.EMPTY,
  "0-7851-1129-8": Isbn.THE_0785111298,
  "0-7851-1451-3": Isbn.THE_0785114513,
  "0-7851-1560-9": Isbn.THE_0785115609
});

class Price {
  PriceType type;
  double price;

  Price({
    required this.type,
    required this.price,
  });

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    type: priceTypeValues.map[json["type"]]!,
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "type": priceTypeValues.reverse[type],
    "price": price,
  };
}

enum PriceType {
  DIGITAL_PURCHASE_PRICE,
  PRINT_PRICE
}

final priceTypeValues = EnumValues({
  "digitalPurchasePrice": PriceType.DIGITAL_PURCHASE_PRICE,
  "printPrice": PriceType.PRINT_PRICE
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

  factory Stories.fromRawJson(String str) => Stories.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory StoriesItem.fromRawJson(String str) => StoriesItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  INTERIOR_STORY,
  PROMO
}

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "interiorStory": ItemType.INTERIOR_STORY,
  "promo": ItemType.PROMO
});

class TextObject {
  TextObjectType type;
  Language language;
  String text;

  TextObject({
    required this.type,
    required this.language,
    required this.text,
  });

  factory TextObject.fromRawJson(String str) => TextObject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
    type: textObjectTypeValues.map[json["type"]]!,
    language: languageValues.map[json["language"]]!,
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "type": textObjectTypeValues.reverse[type],
    "language": languageValues.reverse[language],
    "text": text,
  };
}

enum Language {
  EN_US
}

final languageValues = EnumValues({
  "en-us": Language.EN_US
});

enum TextObjectType {
  ISSUE_SOLICIT_TEXT
}

final textObjectTypeValues = EnumValues({
  "issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT
});

class Url {
  UrlType type;
  String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromRawJson(String str) => Url.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  DETAIL,
  IN_APP_LINK,
  PURCHASE,
  READER
}

final urlTypeValues = EnumValues({
  "detail": UrlType.DETAIL,
  "inAppLink": UrlType.IN_APP_LINK,
  "purchase": UrlType.PURCHASE,
  "reader": UrlType.READER
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
