import 'package:json_annotation/json_annotation.dart';

import 'comics.dart';

part 'comicdetail.g.dart';

@JsonSerializable()
class ComicDetail {
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
  Results? results;
  @JsonKey(name: 'version')
  String? version;

  ComicDetail({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  factory ComicDetail.fromJson(Map<String, dynamic> json) =>
      _$ComicDetailFromJson(json);

  Map<String, dynamic> toRawJson() => _$ComicDetailToJson(this);
}

@JsonSerializable()
class Results {
  @JsonKey(name: 'aliases')
  dynamic aliases;
  @JsonKey(name: 'api_detail_url')
  String? apiDetailUrl;
  @JsonKey(name: 'associated_images')
  List<AssociatedImage>? associatedImages;
  @JsonKey(name: 'character_credits')
  List<Volume>? characterCredits;
  @JsonKey(name: 'character_died_in')
  List<dynamic>? characterDiedIn;
  @JsonKey(name: 'concept_credits')
  List<Volume>? conceptCredits;
  @JsonKey(name: 'cover_date')
  DateTime? coverDate;
  @JsonKey(name: 'date_added')
  DateTime? dateAdded;
  @JsonKey(name: 'date_last_updated')
  DateTime? dateLastUpdated;
  @JsonKey(name: 'deck')
  dynamic deck;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'first_appearance_characters')
  dynamic firstAppearanceCharacters;
  @JsonKey(name: 'first_appearance_concepts')
  dynamic firstAppearanceConcepts;
  @JsonKey(name: 'first_appearance_locations')
  dynamic firstAppearanceLocations;
  @JsonKey(name: 'first_appearance_objects')
  dynamic firstAppearanceObjects;
  @JsonKey(name: 'first_appearance_storyarcs')
  dynamic firstAppearanceStoryarcs;
  @JsonKey(name: 'first_appearance_teams')
  dynamic firstAppearanceTeams;
  @JsonKey(name: 'has_staff_review')
  bool? hasStaffReview;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  Image? image;
  @JsonKey(name: 'issue_number')
  String? issueNumber;
  @JsonKey(name: 'location_credits')
  List<Volume>? locationCredits;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'object_credits')
  List<dynamic>? objectCredits;
  @JsonKey(name: 'person_credits')
  List<Volume>? personCredits;
  @JsonKey(name: 'site_detail_url')
  String? siteDetailUrl;
  @JsonKey(name: 'store_date')
  DateTime? storeDate;
  @JsonKey(name: 'story_arc_credits')
  List<dynamic>? storyArcCredits;
  @JsonKey(name: 'team_credits')
  List<Volume>? teamCredits;
  @JsonKey(name: 'team_disbanded_in')
  List<dynamic>? teamDisbandedIn;
  @JsonKey(name: 'volume')
  Volume? volume;

  Results({
    this.aliases,
    this.apiDetailUrl,
    this.associatedImages,
    this.characterCredits,
    this.characterDiedIn,
    this.conceptCredits,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.firstAppearanceCharacters,
    this.firstAppearanceConcepts,
    this.firstAppearanceLocations,
    this.firstAppearanceObjects,
    this.firstAppearanceStoryarcs,
    this.firstAppearanceTeams,
    this.hasStaffReview,
    this.id,
    this.image,
    this.issueNumber,
    this.locationCredits,
    this.name,
    this.objectCredits,
    this.personCredits,
    this.siteDetailUrl,
    this.storeDate,
    this.storyArcCredits,
    this.teamCredits,
    this.teamDisbandedIn,
    this.volume,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toRawJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class CharacterCredit {
  String? apiDetailUrl;
  int? id;
  String? name;
  String? siteDetailUrl;

  CharacterCredit({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  factory CharacterCredit.fromJson(Map<String, dynamic> json) =>
      _$CharacterCreditFromJson(json);

  Map<String, dynamic> toRawJson() => _$CharacterCreditToJson(this);
}
// To parse this JSON data, do

//     final comicDetail = comicDetailFromJson(jsonString);

// import 'dart:convert';

// ComicDetail comicDetailFromJson(String str) => ComicDetail.fromJson(json.decode(str));

// String comicDetailToJson(ComicDetail data) => json.encode(data.toJson());

// class ComicDetail {
//     String error;
//     int limit;
//     int offset;
//     int numberOfPageResults;
//     int numberOfTotalResults;
//     int statusCode;
//     Results results;
//     String version;

//     ComicDetail({
//         required this.error,
//         required this.limit,
//         required this.offset,
//         required this.numberOfPageResults,
//         required this.numberOfTotalResults,
//         required this.statusCode,
//         required this.results,
//         required this.version,
//     });

//     factory ComicDetail.fromJson(Map<String, dynamic> json) => ComicDetail(
//         error: json["error"],
//         limit: json["limit"],
//         offset: json["offset"],
//         numberOfPageResults: json["number_of_page_results"],
//         numberOfTotalResults: json["number_of_total_results"],
//         statusCode: json["status_code"],
//         results: Results.fromJson(json["results"]),
//         version: json["version"],
//     );

//     Map<String, dynamic> toJson() => {
//         "error": error,
//         "limit": limit,
//         "offset": offset,
//         "number_of_page_results": numberOfPageResults,
//         "number_of_total_results": numberOfTotalResults,
//         "status_code": statusCode,
//         "results": results.toJson(),
//         "version": version,
//     };
// }

// class Results {
//     dynamic aliases;
//     String apiDetailUrl;
//     List<dynamic> associatedImages;
//     List<dynamic> characterCredits;
//     List<dynamic> characterDiedIn;
//     List<Volume> conceptCredits;
//     DateTime coverDate;
//     DateTime dateAdded;
//     DateTime dateLastUpdated;
//     dynamic deck;
//     String description;
//     dynamic firstAppearanceCharacters;
//     dynamic firstAppearanceConcepts;
//     dynamic firstAppearanceLocations;
//     dynamic firstAppearanceObjects;
//     dynamic firstAppearanceStoryarcs;
//     dynamic firstAppearanceTeams;
//     bool hasStaffReview;
//     int id;
//     Image image;
//     String issueNumber;
//     List<dynamic> locationCredits;
//     String name;
//     List<dynamic> objectCredits;
//     List<Volume> personCredits;
//     String siteDetailUrl;
//     DateTime storeDate;
//     List<dynamic> storyArcCredits;
//     List<dynamic> teamCredits;
//     List<dynamic> teamDisbandedIn;
//     Volume volume;

//     Results({
//         required this.aliases,
//         required this.apiDetailUrl,
//         required this.associatedImages,
//         required this.characterCredits,
//         required this.characterDiedIn,
//         required this.conceptCredits,
//         required this.coverDate,
//         required this.dateAdded,
//         required this.dateLastUpdated,
//         required this.deck,
//         required this.description,
//         required this.firstAppearanceCharacters,
//         required this.firstAppearanceConcepts,
//         required this.firstAppearanceLocations,
//         required this.firstAppearanceObjects,
//         required this.firstAppearanceStoryarcs,
//         required this.firstAppearanceTeams,
//         required this.hasStaffReview,
//         required this.id,
//         required this.image,
//         required this.issueNumber,
//         required this.locationCredits,
//         required this.name,
//         required this.objectCredits,
//         required this.personCredits,
//         required this.siteDetailUrl,
//         required this.storeDate,
//         required this.storyArcCredits,
//         required this.teamCredits,
//         required this.teamDisbandedIn,
//         required this.volume,
//     });

//     factory Results.fromJson(Map<String, dynamic> json) => Results(
//         aliases: json["aliases"],
//         apiDetailUrl: json["api_detail_url"],
//         associatedImages: List<dynamic>.from(json["associated_images"].map((x) => x)),
//         characterCredits: List<dynamic>.from(json["character_credits"].map((x) => x)),
//         characterDiedIn: List<dynamic>.from(json["character_died_in"].map((x) => x)),
//         conceptCredits: List<Volume>.from(json["concept_credits"].map((x) => Volume.fromJson(x))),
//         coverDate: DateTime.parse(json["cover_date"]),
//         dateAdded: DateTime.parse(json["date_added"]),
//         dateLastUpdated: DateTime.parse(json["date_last_updated"]),
//         deck: json["deck"],
//         description: json["description"],
//         firstAppearanceCharacters: json["first_appearance_characters"],
//         firstAppearanceConcepts: json["first_appearance_concepts"],
//         firstAppearanceLocations: json["first_appearance_locations"],
//         firstAppearanceObjects: json["first_appearance_objects"],
//         firstAppearanceStoryarcs: json["first_appearance_storyarcs"],
//         firstAppearanceTeams: json["first_appearance_teams"],
//         hasStaffReview: json["has_staff_review"],
//         id: json["id"],
//         image: Image.fromJson(json["image"]),
//         issueNumber: json["issue_number"],
//         locationCredits: List<dynamic>.from(json["location_credits"].map((x) => x)),
//         name: json["name"],
//         objectCredits: List<dynamic>.from(json["object_credits"].map((x) => x)),
//         personCredits: List<Volume>.from(json["person_credits"].map((x) => Volume.fromJson(x))),
//         siteDetailUrl: json["site_detail_url"],
//         storeDate: DateTime.parse(json["store_date"]),
//         storyArcCredits: List<dynamic>.from(json["story_arc_credits"].map((x) => x)),
//         teamCredits: List<dynamic>.from(json["team_credits"].map((x) => x)),
//         teamDisbandedIn: List<dynamic>.from(json["team_disbanded_in"].map((x) => x)),
//         volume: Volume.fromJson(json["volume"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "aliases": aliases,
//         "api_detail_url": apiDetailUrl,
//         "associated_images": List<dynamic>.from(associatedImages.map((x) => x)),
//         "character_credits": List<dynamic>.from(characterCredits.map((x) => x)),
//         "character_died_in": List<dynamic>.from(characterDiedIn.map((x) => x)),
//         "concept_credits": List<dynamic>.from(conceptCredits.map((x) => x.toJson())),
//         "cover_date": "${coverDate.year.toString().padLeft(4, '0')}-${coverDate.month.toString().padLeft(2, '0')}-${coverDate.day.toString().padLeft(2, '0')}",
//         "date_added": dateAdded.toIso8601String(),
//         "date_last_updated": dateLastUpdated.toIso8601String(),
//         "deck": deck,
//         "description": description,
//         "first_appearance_characters": firstAppearanceCharacters,
//         "first_appearance_concepts": firstAppearanceConcepts,
//         "first_appearance_locations": firstAppearanceLocations,
//         "first_appearance_objects": firstAppearanceObjects,
//         "first_appearance_storyarcs": firstAppearanceStoryarcs,
//         "first_appearance_teams": firstAppearanceTeams,
//         "has_staff_review": hasStaffReview,
//         "id": id,
//         "image": image.toJson(),
//         "issue_number": issueNumber,
//         "location_credits": List<dynamic>.from(locationCredits.map((x) => x)),
//         "name": name,
//         "object_credits": List<dynamic>.from(objectCredits.map((x) => x)),
//         "person_credits": List<dynamic>.from(personCredits.map((x) => x.toJson())),
//         "site_detail_url": siteDetailUrl,
//         "store_date": "${storeDate.year.toString().padLeft(4, '0')}-${storeDate.month.toString().padLeft(2, '0')}-${storeDate.day.toString().padLeft(2, '0')}",
//         "story_arc_credits": List<dynamic>.from(storyArcCredits.map((x) => x)),
//         "team_credits": List<dynamic>.from(teamCredits.map((x) => x)),
//         "team_disbanded_in": List<dynamic>.from(teamDisbandedIn.map((x) => x)),
//         "volume": volume.toJson(),
//     };
// }

// class Volume {
//     String apiDetailUrl;
//     int id;
//     String name;
//     String siteDetailUrl;
//     String? role;

//     Volume({
//         required this.apiDetailUrl,
//         required this.id,
//         required this.name,
//         required this.siteDetailUrl,
//         this.role,
//     });

//     factory Volume.fromJson(Map<String, dynamic> json) => Volume(
//         apiDetailUrl: json["api_detail_url"],
//         id: json["id"],
//         name: json["name"],
//         siteDetailUrl: json["site_detail_url"],
//         role: json["role"],
//     );

//     Map<String, dynamic> toJson() => {
//         "api_detail_url": apiDetailUrl,
//         "id": id,
//         "name": name,
//         "site_detail_url": siteDetailUrl,
//         "role": role,
//     };
// }

// class Image {
//     String iconUrl;
//     String mediumUrl;
//     String screenUrl;
//     String screenLargeUrl;
//     String smallUrl;
//     String superUrl;
//     String thumbUrl;
//     String tinyUrl;
//     String originalUrl;
//     String imageTags;

//     Image({
//         required this.iconUrl,
//         required this.mediumUrl,
//         required this.screenUrl,
//         required this.screenLargeUrl,
//         required this.smallUrl,
//         required this.superUrl,
//         required this.thumbUrl,
//         required this.tinyUrl,
//         required this.originalUrl,
//         required this.imageTags,
//     });

//     factory Image.fromJson(Map<String, dynamic> json) => Image(
//         iconUrl: json["icon_url"],
//         mediumUrl: json["medium_url"],
//         screenUrl: json["screen_url"],
//         screenLargeUrl: json["screen_large_url"],
//         smallUrl: json["small_url"],
//         superUrl: json["super_url"],
//         thumbUrl: json["thumb_url"],
//         tinyUrl: json["tiny_url"],
//         originalUrl: json["original_url"],
//         imageTags: json["image_tags"],
//     );

//     Map<String, dynamic> toJson() => {
//         "icon_url": iconUrl,
//         "medium_url": mediumUrl,
//         "screen_url": screenUrl,
//         "screen_large_url": screenLargeUrl,
//         "small_url": smallUrl,
//         "super_url": superUrl,
//         "thumb_url": thumbUrl,
//         "tiny_url": tinyUrl,
//         "original_url": originalUrl,
//         "image_tags": imageTags,
//     };
// }
