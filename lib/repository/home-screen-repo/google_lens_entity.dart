// To parse this JSON data, do
//
//     final googleLensEntity = googleLensEntityFromJson(jsonString);

import 'dart:convert';

GoogleLensEntity? googleLensEntityFromJson(String str) =>
    GoogleLensEntity.fromJson(json.decode(str));

String googleLensEntityToJson(GoogleLensEntity? data) =>
    json.encode(data!.toJson());

class GoogleLensEntity {
  GoogleLensEntity({
    this.searchMetadata,
    this.searchParameters,
    this.knowledgeGraph,
    this.visualMatches,
    this.reverseImageSearch,
  });

  SearchMetadata? searchMetadata;
  SearchParameters? searchParameters;
  List<KnowledgeGraph?>? knowledgeGraph;
  List<VisualMatch?>? visualMatches;
  ReverseImageSearch? reverseImageSearch;

  factory GoogleLensEntity.fromJson(Map<String, dynamic> json) =>
      GoogleLensEntity(
        searchMetadata: SearchMetadata.fromJson(json["search_metadata"]),
        searchParameters: SearchParameters.fromJson(json["search_parameters"]),
        knowledgeGraph: json["knowledge_graph"] == null
            ? []
            : List<KnowledgeGraph?>.from(json["knowledge_graph"]!
                .map((x) => KnowledgeGraph.fromJson(x))),
        visualMatches: json["visual_matches"] == null
            ? []
            : List<VisualMatch?>.from(
                json["visual_matches"]!.map((x) => VisualMatch.fromJson(x))),
        reverseImageSearch:
            ReverseImageSearch.fromJson(json["reverse_image_search"]),
      );

  Map<String, dynamic> toJson() => {
        "search_metadata": searchMetadata!.toJson(),
        "search_parameters": searchParameters!.toJson(),
        "knowledge_graph": knowledgeGraph == null
            ? []
            : List<dynamic>.from(knowledgeGraph!.map((x) => x!.toJson())),
        "visual_matches": visualMatches == null
            ? []
            : List<dynamic>.from(visualMatches!.map((x) => x!.toJson())),
        "reverse_image_search": reverseImageSearch!.toJson(),
      };
}

class KnowledgeGraph {
  KnowledgeGraph({
    this.title,
    this.subtitle,
    this.link,
    this.moreImages,
    this.thumbnail,
    this.images,
  });

  String? title;
  String? subtitle;
  String? link;
  MoreImages? moreImages;
  String? thumbnail;
  List<Image?>? images;

  factory KnowledgeGraph.fromJson(Map<String, dynamic> json) => KnowledgeGraph(
        title: json["title"],
        subtitle: json["subtitle"],
        link: json["link"],
        moreImages: json["more_images"],
        thumbnail: json["thumbnail"],
        images: json["images"] == null
            ? []
            : List<Image?>.from(json["images"]!.map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "link": link,
        "more_images": moreImages,
        "thumbnail": thumbnail,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x!.toJson())),
      };
}

class Image {
  Image({
    this.title,
    this.source,
    this.link,
    this.size,
  });

  String? title;
  String? source;
  String? link;
  Size? size;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        title: json["title"],
        source: json["source"],
        link: json["link"],
        size: Size.fromJson(json["size"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "source": source,
        "link": link,
        "size": size!.toJson(),
      };
}

class Size {
  Size({
    this.width,
    this.height,
  });

  int? width;
  int? height;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
      };
}

class MoreImages {
  MoreImages({
    this.link,
    this.serpapiLink,
  });

  String? link;
  String? serpapiLink;

  factory MoreImages.fromJson(Map<String, dynamic> json) => MoreImages(
        link: json["link"],
        serpapiLink: json["serpapi_link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "serpapi_link": serpapiLink,
      };
}

class ReverseImageSearch {
  ReverseImageSearch({
    this.link,
  });

  String? link;

  factory ReverseImageSearch.fromJson(Map<String, dynamic> json) =>
      ReverseImageSearch(
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
      };
}

class SearchMetadata {
  SearchMetadata({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.googleLensUrl,
    this.rawHtmlFile,
    this.prettifyHtmlFile,
    this.totalTimeTaken,
  });

  String? id;
  String? status;
  String? jsonEndpoint;
  String? createdAt;
  String? processedAt;
  String? googleLensUrl;
  String? rawHtmlFile;
  String? prettifyHtmlFile;
  double? totalTimeTaken;

  factory SearchMetadata.fromJson(Map<String, dynamic> json) => SearchMetadata(
        id: json["id"],
        status: json["status"],
        jsonEndpoint: json["json_endpoint"],
        createdAt: json["created_at"],
        processedAt: json["processed_at"],
        googleLensUrl: json["google_lens_url"],
        rawHtmlFile: json["raw_html_file"],
        prettifyHtmlFile: json["prettify_html_file"],
        totalTimeTaken: json["total_time_taken"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "json_endpoint": jsonEndpoint,
        "created_at": createdAt,
        "processed_at": processedAt,
        "google_lens_url": googleLensUrl,
        "raw_html_file": rawHtmlFile,
        "prettify_html_file": prettifyHtmlFile,
        "total_time_taken": totalTimeTaken,
      };
}

class SearchParameters {
  SearchParameters({
    this.engine,
    this.url,
  });

  String? engine;
  String? url;

  factory SearchParameters.fromJson(Map<String, dynamic> json) =>
      SearchParameters(
        engine: json["engine"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "engine": engine,
        "url": url,
      };
}

class VisualMatch {
  VisualMatch({
    this.position,
    this.title,
    this.link,
    this.source,
    this.sourceIcon,
    this.thumbnail,
  });

  int? position;
  String? title;
  String? link;
  String? source;
  String? sourceIcon;
  String? thumbnail;

  factory VisualMatch.fromJson(Map<String, dynamic> json) => VisualMatch(
        position: json["position"],
        title: json["title"],
        link: json["link"],
        source: json["source"],
        sourceIcon: json["source_icon"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "title": title,
        "link": link,
        "source": source,
        "source_icon": sourceIcon,
        "thumbnail": thumbnail,
      };
}
