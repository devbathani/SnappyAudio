// To parse this JSON data, do
//
//     final youTubeSearchEntity = youTubeSearchEntityFromJson(jsonString);

import 'dart:convert';

YouTubeSearchEntity? youTubeSearchEntityFromJson(String str) =>
    YouTubeSearchEntity.fromJson(json.decode(str));

String youTubeSearchEntityToJson(YouTubeSearchEntity? data) =>
    json.encode(data!.toJson());

class YouTubeSearchEntity {
  YouTubeSearchEntity({
    this.searchMetadata,
    this.searchParameters,
    this.searchInformation,
    this.adsResults,
    this.movieResults,
    this.channelResults,
    this.latestFromStarWars,
    this.videoResults,
    this.peopleAlsoWatched,
    this.playlistResults,
    this.channelsNewToYou,
    this.pagination,
    this.serpapiPagination,
  });

  SearchMetadata? searchMetadata;
  SearchParameters? searchParameters;
  SearchInformation? searchInformation;
  List<AdsResult?>? adsResults;
  List<MovieResult?>? movieResults;
  List<ChannelResult?>? channelResults;
  List<ChannelsNewToYou?>? latestFromStarWars;
  List<VideoResult?>? videoResults;
  List<ChannelsNewToYou?>? peopleAlsoWatched;
  List<PlaylistResult?>? playlistResults;
  List<ChannelsNewToYou?>? channelsNewToYou;
  Pagination? pagination;
  Pagination? serpapiPagination;

  factory YouTubeSearchEntity.fromJson(Map<String, dynamic> json) =>
      YouTubeSearchEntity(
        searchMetadata: SearchMetadata.fromJson(json["search_metadata"]),
        searchParameters: SearchParameters.fromJson(json["search_parameters"]),
        searchInformation:
            SearchInformation.fromJson(json["search_information"]),
        adsResults: json["ads_results"] == null
            ? []
            : List<AdsResult?>.from(
                json["ads_results"]!.map((x) => AdsResult.fromJson(x))),
        movieResults: json["movie_results"] == null
            ? []
            : List<MovieResult?>.from(
                json["movie_results"]!.map((x) => MovieResult.fromJson(x))),
        channelResults: json["channel_results"] == null
            ? []
            : List<ChannelResult?>.from(
                json["channel_results"]!.map((x) => ChannelResult.fromJson(x))),
        latestFromStarWars: json["latest_from_star_wars"] == null
            ? []
            : List<ChannelsNewToYou?>.from(json["latest_from_star_wars"]!
                .map((x) => ChannelsNewToYou.fromJson(x))),
        videoResults: json["video_results"] == null
            ? []
            : List<VideoResult?>.from(
                json["video_results"]!.map((x) => VideoResult.fromJson(x))),
        peopleAlsoWatched: json["people_also_watched"] == null
            ? []
            : List<ChannelsNewToYou?>.from(json["people_also_watched"]!
                .map((x) => ChannelsNewToYou.fromJson(x))),
        playlistResults: json["playlist_results"] == null
            ? []
            : List<PlaylistResult?>.from(json["playlist_results"]!
                .map((x) => PlaylistResult.fromJson(x))),
        channelsNewToYou: json["channels_new_to_you"] == null
            ? []
            : List<ChannelsNewToYou?>.from(json["channels_new_to_you"]!
                .map((x) => ChannelsNewToYou.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
        serpapiPagination: Pagination.fromJson(json["serpapi_pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "search_metadata": searchMetadata!.toJson(),
        "search_parameters": searchParameters!.toJson(),
        "search_information": searchInformation!.toJson(),
        "ads_results": adsResults == null
            ? []
            : List<dynamic>.from(adsResults!.map((x) => x!.toJson())),
        "movie_results": movieResults == null
            ? []
            : List<dynamic>.from(movieResults!.map((x) => x!.toJson())),
        "channel_results": channelResults == null
            ? []
            : List<dynamic>.from(channelResults!.map((x) => x!.toJson())),
        "latest_from_star_wars": latestFromStarWars == null
            ? []
            : List<dynamic>.from(latestFromStarWars!.map((x) => x!.toJson())),
        "video_results": videoResults == null
            ? []
            : List<dynamic>.from(videoResults!.map((x) => x!.toJson())),
        "people_also_watched": peopleAlsoWatched == null
            ? []
            : List<dynamic>.from(peopleAlsoWatched!.map((x) => x!.toJson())),
        "playlist_results": playlistResults == null
            ? []
            : List<dynamic>.from(playlistResults!.map((x) => x!.toJson())),
        "channels_new_to_you": channelsNewToYou == null
            ? []
            : List<dynamic>.from(channelsNewToYou!.map((x) => x!.toJson())),
        "pagination": pagination!.toJson(),
        "serpapi_pagination": serpapiPagination!.toJson(),
      };
}

class AdsResult {
  AdsResult({
    this.positionOnPage,
    this.title,
    this.link,
    this.website,
    this.channel,
    this.description,
    this.length,
    this.thumbnail,
  });

  int? positionOnPage;
  String? title;
  String? link;
  String? website;
  AdsResultChannel? channel;
  String? description;
  String? length;
  Thumbnail? thumbnail;

  factory AdsResult.fromJson(Map<String, dynamic> json) => AdsResult(
        positionOnPage: json["position_on_page"],
        title: json["title"],
        link: json["link"],
        website: json["website"],
        channel: AdsResultChannel.fromJson(json["channel"]),
        description: json["description"],
        length: json["length"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "position_on_page": positionOnPage,
        "title": title,
        "link": link,
        "website": website,
        "channel": channel!.toJson(),
        "description": description,
        "length": length,
        "thumbnail": thumbnail!.toJson(),
      };
}

class AdsResultChannel {
  AdsResultChannel({
    this.name,
    this.link,
  });

  String? name;
  String? link;

  factory AdsResultChannel.fromJson(Map<String, dynamic> json) =>
      AdsResultChannel(
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
      };
}

class Thumbnail {
  Thumbnail({
    this.thumbnailStatic,
    this.rich,
  });

  String? thumbnailStatic;
  String? rich;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        thumbnailStatic: json["static"],
        rich: json["rich"],
      );

  Map<String, dynamic> toJson() => {
        "static": thumbnailStatic,
        "rich": rich,
      };
}

class ChannelResult {
  ChannelResult({
    this.positionOnPage,
    this.title,
    this.link,
    this.verified,
    this.subscribers,
    this.description,
    this.thumbnail,
  });

  int? positionOnPage;
  String? title;
  String? link;
  bool? verified;
  dynamic subscribers;
  String? description;
  String? thumbnail;

  factory ChannelResult.fromJson(Map<String, dynamic> json) => ChannelResult(
        positionOnPage: json["position_on_page"],
        title: json["title"],
        link: json["link"],
        verified: json["verified"],
        subscribers: json["subscribers"],
        description: json["description"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "position_on_page": positionOnPage,
        "title": title,
        "link": link,
        "verified": verified,
        "subscribers": subscribers,
        "description": description,
        "thumbnail": thumbnail,
      };
}

class ChannelsNewToYou {
  ChannelsNewToYou({
    this.positionOnPage,
    this.title,
    this.link,
    this.channel,
    this.publishedDate,
    this.views,
    this.length,
    this.description,
    this.extensions,
    this.thumbnail,
  });

  dynamic positionOnPage;
  String? title;
  String? link;
  ChannelsNewToYouChannel? channel;
  String? publishedDate;
  int? views;
  String? length;
  String? description;
  List<Extension?>? extensions;
  Thumbnail? thumbnail;

  factory ChannelsNewToYou.fromJson(Map<String, dynamic> json) =>
      ChannelsNewToYou(
        positionOnPage: json["position_on_page"],
        title: json["title"],
        link: json["link"],
        channel: ChannelsNewToYouChannel.fromJson(json["channel"]),
        publishedDate: json["published_date"],
        views: json["views"],
        length: json["length"],
        description: json["description"],
        extensions: json["extensions"] == null
            ? []
            : json["extensions"] == null
                ? []
                : List<Extension?>.from(
                    json["extensions"]!.map((x) => extensionValues.map[x])),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "position_on_page": positionOnPage,
        "title": title,
        "link": link,
        "channel": channel!.toJson(),
        "published_date": publishedDate,
        "views": views,
        "length": length,
        "description": description,
        "extensions": extensions == null
            ? []
            : extensions == null
                ? []
                : List<dynamic>.from(
                    extensions!.map((x) => extensionValues.reverse![x])),
        "thumbnail": thumbnail!.toJson(),
      };
}

class ChannelsNewToYouChannel {
  ChannelsNewToYouChannel({
    this.name,
    this.link,
    this.verified,
    this.thumbnail,
  });

  String? name;
  String? link;
  bool? verified;
  String? thumbnail;

  factory ChannelsNewToYouChannel.fromJson(Map<String, dynamic> json) =>
      ChannelsNewToYouChannel(
        name: json["name"],
        link: json["link"],
        verified: json["verified"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "verified": verified,
        "thumbnail": thumbnail,
      };
}

enum Extension { NEW, CC, THE_4_K }

final extensionValues = EnumValues(
    {"CC": Extension.CC, "New": Extension.NEW, "4K": Extension.THE_4_K});

enum PositionOnPageEnum { HIDDEN }

final positionOnPageEnumValues =
    EnumValues({"hidden": PositionOnPageEnum.HIDDEN});

class MovieResult {
  MovieResult({
    this.positionOnPage,
    this.title,
    this.link,
    this.channel,
    this.length,
    this.description,
    this.info,
    this.extensions,
    this.thumbnail,
  });

  int? positionOnPage;
  String? title;
  String? link;
  ChannelsNewToYouChannel? channel;
  String? length;
  String? description;
  List<String?>? info;
  List<String?>? extensions;
  String? thumbnail;

  factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
        positionOnPage: json["position_on_page"],
        title: json["title"],
        link: json["link"],
        channel: ChannelsNewToYouChannel.fromJson(json["channel"]),
        length: json["length"],
        description: json["description"],
        info: json["info"] == null
            ? []
            : List<String?>.from(json["info"]!.map((x) => x)),
        extensions: json["extensions"] == null
            ? []
            : List<String?>.from(json["extensions"]!.map((x) => x)),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "position_on_page": positionOnPage,
        "title": title,
        "link": link,
        "channel": channel!.toJson(),
        "length": length,
        "description": description,
        "info": info == null ? [] : List<dynamic>.from(info!.map((x) => x)),
        "extensions": extensions == null
            ? []
            : List<dynamic>.from(extensions!.map((x) => x)),
        "thumbnail": thumbnail,
      };
}

class Pagination {
  Pagination({
    this.current,
    this.next,
    this.nextPageToken,
  });

  String? current;
  String? next;
  String? nextPageToken;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        current: json["current"],
        next: json["next"],
        nextPageToken: json["next_page_token"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "next": next,
        "next_page_token": nextPageToken,
      };
}

class PlaylistResult {
  PlaylistResult({
    this.positionOnPage,
    this.title,
    this.link,
    this.videoCount,
    this.videos,
    this.thumbnail,
  });

  int? positionOnPage;
  String? title;
  String? link;
  dynamic videoCount;
  List<Video?>? videos;
  String? thumbnail;

  factory PlaylistResult.fromJson(Map<String, dynamic> json) => PlaylistResult(
        positionOnPage: json["position_on_page"],
        title: json["title"],
        link: json["link"],
        videoCount: json["video_count"],
        videos: json["videos"] == null
            ? []
            : List<Video?>.from(json["videos"]!.map((x) => Video.fromJson(x))),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "position_on_page": positionOnPage,
        "title": title,
        "link": link,
        "video_count": videoCount,
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x!.toJson())),
        "thumbnail": thumbnail,
      };
}

class Video {
  Video({
    this.title,
    this.link,
    this.length,
  });

  String? title;
  String? link;
  String? length;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        title: json["title"],
        link: json["link"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "length": length,
      };
}

class SearchInformation {
  SearchInformation({
    this.totalResults,
    this.videoResultsState,
  });

  int? totalResults;
  String? videoResultsState;

  factory SearchInformation.fromJson(Map<String, dynamic> json) =>
      SearchInformation(
        totalResults: json["total_results"],
        videoResultsState: json["video_results_state"],
      );

  Map<String, dynamic> toJson() => {
        "total_results": totalResults,
        "video_results_state": videoResultsState,
      };
}

class SearchMetadata {
  SearchMetadata({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.youtubeUrl,
    this.rawHtmlFile,
    this.totalTimeTaken,
  });

  String? id;
  String? status;
  String? jsonEndpoint;
  String? createdAt;
  String? processedAt;
  String? youtubeUrl;
  String? rawHtmlFile;
  double? totalTimeTaken;

  factory SearchMetadata.fromJson(Map<String, dynamic> json) => SearchMetadata(
        id: json["id"],
        status: json["status"],
        jsonEndpoint: json["json_endpoint"],
        createdAt: json["created_at"],
        processedAt: json["processed_at"],
        youtubeUrl: json["youtube_url"],
        rawHtmlFile: json["raw_html_file"],
        totalTimeTaken: json["total_time_taken"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "json_endpoint": jsonEndpoint,
        "created_at": createdAt,
        "processed_at": processedAt,
        "youtube_url": youtubeUrl,
        "raw_html_file": rawHtmlFile,
        "total_time_taken": totalTimeTaken,
      };
}

class SearchParameters {
  SearchParameters({
    this.engine,
    this.searchQuery,
  });

  String? engine;
  String? searchQuery;

  factory SearchParameters.fromJson(Map<String, dynamic> json) =>
      SearchParameters(
        engine: json["engine"],
        searchQuery: json["search_query"],
      );

  Map<String, dynamic> toJson() => {
        "engine": engine,
        "search_query": searchQuery,
      };
}

class VideoResult {
  VideoResult({
    this.positionOnPage,
    this.title,
    this.link,
    this.channel,
    this.publishedDate,
    this.views,
    this.length,
    this.description,
    this.extensions,
    this.thumbnail,
  });

  int? positionOnPage;
  String? title;
  String? link;
  ChannelsNewToYouChannel? channel;
  String? publishedDate;
  int? views;
  String? length;
  String? description;
  List<Extension?>? extensions;
  Thumbnail? thumbnail;

  factory VideoResult.fromJson(Map<String, dynamic> json) => VideoResult(
        positionOnPage: json["position_on_page"],
        title: json["title"],
        link: json["link"],
        channel: ChannelsNewToYouChannel.fromJson(json["channel"]),
        publishedDate: json["published_date"],
        views: json["views"],
        length: json["length"],
        description: json["description"],
        extensions: json["extensions"] == null
            ? []
            : json["extensions"] == null
                ? []
                : List<Extension?>.from(
                    json["extensions"]!.map((x) => extensionValues.map[x])),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "position_on_page": positionOnPage,
        "title": title,
        "link": link,
        "channel": channel!.toJson(),
        "published_date": publishedDate,
        "views": views,
        "length": length,
        "description": description,
        "extensions": extensions == null
            ? []
            : extensions == null
                ? []
                : List<dynamic>.from(
                    extensions!.map((x) => extensionValues.reverse![x])),
        "thumbnail": thumbnail!.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
