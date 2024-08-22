// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicDetail _$ComicDetailFromJson(Map<String, dynamic> json) => ComicDetail(
      error: json['error'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      numberOfPageResults: (json['number_of_page_results'] as num?)?.toInt(),
      numberOfTotalResults: (json['number_of_total_results'] as num?)?.toInt(),
      statusCode: (json['status_code'] as num?)?.toInt(),
      results: json['results'] == null
          ? null
          : Results.fromJson(json['results'] as Map<String, dynamic>),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ComicDetailToJson(ComicDetail instance) =>
    <String, dynamic>{
      'error': instance.error,
      'limit': instance.limit,
      'offset': instance.offset,
      'number_of_page_results': instance.numberOfPageResults,
      'number_of_total_results': instance.numberOfTotalResults,
      'status_code': instance.statusCode,
      'results': instance.results,
      'version': instance.version,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      aliases: json['aliases'],
      apiDetailUrl: json['api_detail_url'] as String?,
      associatedImages: (json['associated_images'] as List<dynamic>?)
          ?.map((e) => AssociatedImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      characterCredits: (json['character_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      characterDiedIn: json['character_died_in'] as List<dynamic>?,
      conceptCredits: (json['concept_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverDate: json['cover_date'] == null
          ? null
          : DateTime.parse(json['cover_date'] as String),
      dateAdded: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      dateLastUpdated: json['date_last_updated'] == null
          ? null
          : DateTime.parse(json['date_last_updated'] as String),
      deck: json['deck'],
      description: json['description'] as String?,
      firstAppearanceCharacters: json['first_appearance_characters'],
      firstAppearanceConcepts: json['first_appearance_concepts'],
      firstAppearanceLocations: json['first_appearance_locations'],
      firstAppearanceObjects: json['first_appearance_objects'],
      firstAppearanceStoryarcs: json['first_appearance_storyarcs'],
      firstAppearanceTeams: json['first_appearance_teams'],
      hasStaffReview: json['has_staff_review'] as bool?,
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      issueNumber: json['issue_number'] as String?,
      locationCredits: (json['location_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      objectCredits: (json['object_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      personCredits: (json['person_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      siteDetailUrl: json['site_detail_url'] as String?,
      storeDate: json['store_date'] == null
          ? null
          : DateTime.parse(json['store_date'] as String),
      storyArcCredits: (json['story_arc_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamCredits: (json['team_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamDisbandedIn: json['team_disbanded_in'] as List<dynamic>?,
      volume: json['volume'] == null
          ? null
          : Volume.fromJson(json['volume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'aliases': instance.aliases,
      'api_detail_url': instance.apiDetailUrl,
      'associated_images': instance.associatedImages,
      'character_credits': instance.characterCredits,
      'character_died_in': instance.characterDiedIn,
      'concept_credits': instance.conceptCredits,
      'cover_date': instance.coverDate?.toIso8601String(),
      'date_added': instance.dateAdded?.toIso8601String(),
      'date_last_updated': instance.dateLastUpdated?.toIso8601String(),
      'deck': instance.deck,
      'description': instance.description,
      'first_appearance_characters': instance.firstAppearanceCharacters,
      'first_appearance_concepts': instance.firstAppearanceConcepts,
      'first_appearance_locations': instance.firstAppearanceLocations,
      'first_appearance_objects': instance.firstAppearanceObjects,
      'first_appearance_storyarcs': instance.firstAppearanceStoryarcs,
      'first_appearance_teams': instance.firstAppearanceTeams,
      'has_staff_review': instance.hasStaffReview,
      'id': instance.id,
      'image': instance.image,
      'issue_number': instance.issueNumber,
      'location_credits': instance.locationCredits,
      'name': instance.name,
      'object_credits': instance.objectCredits,
      'person_credits': instance.personCredits,
      'site_detail_url': instance.siteDetailUrl,
      'store_date': instance.storeDate?.toIso8601String(),
      'story_arc_credits': instance.storyArcCredits,
      'team_credits': instance.teamCredits,
      'team_disbanded_in': instance.teamDisbandedIn,
      'volume': instance.volume,
    };

CharacterCredit _$CharacterCreditFromJson(Map<String, dynamic> json) =>
    CharacterCredit(
      apiDetailUrl: json['apiDetailUrl'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      siteDetailUrl: json['siteDetailUrl'] as String?,
    );

Map<String, dynamic> _$CharacterCreditToJson(CharacterCredit instance) =>
    <String, dynamic>{
      'apiDetailUrl': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
      'siteDetailUrl': instance.siteDetailUrl,
    };
