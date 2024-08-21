import 'package:json_annotation/json_annotation.dart';

part 'comics.g.dart';

@JsonSerializable()
class Comics {
  @JsonKey(name: 'error')
  String? error;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'offset')
  int? offset;
  @JsonKey(name: 'number_of_page_results')
  int? numberOfPageResults;
  @JsonKey(name: 'number_of_total_results')
  int? numberOfTotalResults;
  @JsonKey(name: 'status_code')
  int? statusCode;
  @JsonKey(name: 'results')
  List<Comic>? results;
  @JsonKey(name: 'version')
  String? version;

  Comics({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  factory Comics.fromJson(Map<String, dynamic> json) => _$ComicsFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsToJson(this);
}

@JsonSerializable()
class Comic {
  @JsonKey(name: 'aliases')
  dynamic aliases;
  @JsonKey(name: 'api_detail_url')
  String? apiDetailUrl;
  @JsonKey(name: 'cover_date')
  String? coverDate;
  @JsonKey(name: 'date_added')
  String? dateAdded;
  @JsonKey(name: 'date_last_updated')
  String? dateLastUpdated;
  @JsonKey(name: 'deck')
  dynamic deck;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'has_staff_review')
  bool? hasStaffReview;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  Image? image;
  @JsonKey(name: 'associated_images')
  List<AssociatedImage>? associatedImages;
  @JsonKey(name: 'issue_number')
  String? issueNumber;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'site_detail_url')
  String? siteDetailUrl;
  @JsonKey(name: 'store_date')
  dynamic storeDate;
  @JsonKey(name: 'volume')
  Volume? volume;

  Comic({
    this.aliases,
    this.apiDetailUrl,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.hasStaffReview,
    this.id,
    this.image,
    this.associatedImages,
    this.issueNumber,
    this.name,
    this.siteDetailUrl,
    this.storeDate,
    this.volume,
  });

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);
  Map<String, dynamic> toJson() => _$ComicToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: 'icon_url')
  String? iconUrl;
  @JsonKey(name: 'medium_url')
  String? mediumUrl;
  @JsonKey(name: 'screen_url')
  String? screenUrl;
  @JsonKey(name: 'screen_large_url')
  String? screenLargeUrl;
  @JsonKey(name: 'small_url')
  String? smallUrl;
  @JsonKey(name: 'super_url')
  String? superUrl;
  @JsonKey(name: 'thumb_url')
  String? thumbUrl;
  @JsonKey(name: 'tiny_url')
  String? tinyUrl;
  @JsonKey(name: 'original_url')
  String? originalUrl;
  @JsonKey(name: 'image_tags')
  String? imageTags;

  Image({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class AssociatedImage {
  @JsonKey(name: 'original_url')
  String? originalUrl;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'caption')
  dynamic caption;
  @JsonKey(name: 'image_tags')
  String? imageTags;

  AssociatedImage({
    this.originalUrl,
    this.id,
    this.caption,
    this.imageTags,
  });

  factory AssociatedImage.fromJson(Map<String, dynamic> json) =>
      _$AssociatedImageFromJson(json);
  Map<String, dynamic> toJson() => _$AssociatedImageToJson(this);
}

@JsonSerializable()
class Volume {
  @JsonKey(name: 'api_detail_url')
  String? apiDetailUrl;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'site_detail_url')
  String? siteDetailUrl;
  @JsonKey(name: 'role')
  String? role;

  Volume({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}
// To parse this JSON data, do
//
//     final comics = comicsFromJson(jsonString);

// import 'dart:convert';

// import 'package:comic_vine_app/models/models.dart';

// Comics comicsFromJson(String str) => Comics.fromJson(json.decode(str));

// String comicsToJson(Comics data) => json.encode(data.toJson());

// class Comics {
//   String error;
//   int limit;
//   int offset;
//   int numberOfPageResults;
//   int numberOfTotalResults;
//   int statusCode;
//   List<Comic> results;
//   String version;

//   Comics({
//     required this.error,
//     required this.limit,
//     required this.offset,
//     required this.numberOfPageResults,
//     required this.numberOfTotalResults,
//     required this.statusCode,
//     required this.results,
//     required this.version,
//   });

//   factory Comics.fromJson(Map<String, dynamic> json) => Comics(
//         error: json["error"],
//         limit: json["limit"],
//         offset: json["offset"],
//         numberOfPageResults: json["number_of_page_results"],
//         numberOfTotalResults: json["number_of_total_results"],
//         statusCode: json["status_code"],
//         results:
//             List<Comic>.from(json["results"].map((x) => Comic.fromJson(x))),
//         version: json["version"],
//       );

//   Map<String, dynamic> toJson() => {
//         "error": error,
//         "limit": limit,
//         "offset": offset,
//         "number_of_page_results": numberOfPageResults,
//         "number_of_total_results": numberOfTotalResults,
//         "status_code": statusCode,
//         "comic": List<dynamic>.from(results.map((x) => x.toJson())),
//         "version": version,
//       };
// }

// class Comic {
//   dynamic aliases;
//   String apiDetailUrl;
//   DateTime? coverDate;
//   DateTime dateAdded;
//   DateTime dateLastUpdated;
//   Deck? deck;
//   String? description;
//   bool hasStaffReview;
//   int id;
//   Image image;
//   List<dynamic> associatedImages;
//   String issueNumber;
//   String? name;
//   String siteDetailUrl;
//   DateTime? storeDate;
//   Volume volume;

//   Comic({
//     required this.aliases,
//     required this.apiDetailUrl,
//     required this.coverDate,
//     required this.dateAdded,
//     required this.dateLastUpdated,
//     required this.deck,
//     required this.description,
//     required this.hasStaffReview,
//     required this.id,
//     required this.image,
//     required this.associatedImages,
//     required this.issueNumber,
//     required this.name,
//     required this.siteDetailUrl,
//     required this.storeDate,
//     required this.volume,
//   });

//   factory Comic.fromJson(Map<String, dynamic> json) => Comic(
//         aliases: json["aliases"],
//         apiDetailUrl: json["api_detail_url"],
//         coverDate: json["cover_date"] == null
//             ? null
//             : DateTime.parse(json["cover_date"]),
//         dateAdded: DateTime.parse(json["date_added"]),
//         dateLastUpdated: DateTime.parse(json["date_last_updated"]),
//         deck: deckValues.map[json["deck"]]!,
//         description: json["description"],
//         hasStaffReview: json["has_staff_review"],
//         id: json["id"],
//         image: Image.fromJson(json["image"]),
//         associatedImages:
//             List<dynamic>.from(json["associated_images"].map((x) => x)),
//         issueNumber: json["issue_number"],
//         name: json["name"],
//         siteDetailUrl: json["site_detail_url"],
//         storeDate: json["store_date"] == null
//             ? null
//             : DateTime.parse(json["store_date"]),
//         volume: Volume.fromJson(json["volume"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "aliases": aliases,
//         "api_detail_url": apiDetailUrl,
//         "cover_date":
//             "${coverDate!.year.toString().padLeft(4, '0')}-${coverDate!.month.toString().padLeft(2, '0')}-${coverDate!.day.toString().padLeft(2, '0')}",
//         "date_added": dateAdded.toIso8601String(),
//         "date_last_updated": dateLastUpdated.toIso8601String(),
//         "deck": deckValues.reverse[deck],
//         "description": description,
//         "has_staff_review": hasStaffReview,
//         "id": id,
//         "image": image.toJson(),
//         "associated_images": List<dynamic>.from(associatedImages.map((x) => x)),
//         "issue_number": issueNumber,
//         "name": name,
//         "site_detail_url": siteDetailUrl,
//         "store_date":
//             "${storeDate!.year.toString().padLeft(4, '0')}-${storeDate!.month.toString().padLeft(2, '0')}-${storeDate!.day.toString().padLeft(2, '0')}",
//         "volume": volume.toJson(),
//       };
// }

// enum Deck { deck, empty, purple }

// final deckValues =
//     EnumValues({"    ": Deck.deck, "     ": Deck.empty, "      ": Deck.purple});

// enum ImageTags { allImages }

// final imageTagsValues = EnumValues({"All Images": ImageTags.allImages});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
