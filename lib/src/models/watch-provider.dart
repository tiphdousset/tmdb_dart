import 'package:meta/meta.dart';
import 'dart:convert';

class WatchProviders {
  WatchProviders({
    @required this.link,
    @required this.flatrate,
    @required this.rent,
    @required this.buy,
  });

  final String link;
  final List<Provider> flatrate;
  final List<Provider> rent;
  final List<Provider> buy;

  factory WatchProviders.fromJson(Map<String, dynamic> json) => WatchProviders(
    link: json["link"],
    flatrate: json["flatrate"] == null ? List.empty() : List<Provider>.from(json["flatrate"].map((x) => Provider.fromJson(x))),
    rent: json["rent"] == null ? List.empty() : List<Provider>.from(json["rent"].map((x) => Provider.fromJson(x))),
    buy: json["buy"] == null ? List.empty() : List<Provider>.from(json["buy"].map((x) => Provider.fromJson(x))),
  );

  static Map<String,WatchProviders> mapFromJson(Map<String, dynamic> map) => map.map((country, watchProvidersJson) => MapEntry(country, WatchProviders.fromJson(watchProvidersJson as Map<String, dynamic>)));
}

class Provider {
  Provider({
    @required this.displayPriority,
    @required this.logoPath,
    @required this.providerId,
    @required this.providerName,
  });

  final int displayPriority;
  final String logoPath;
  final int providerId;
  final String providerName;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    displayPriority: json["display_priority"],
    logoPath: json["logo_path"],
    providerId: json["provider_id"],
    providerName: json["provider_name"],
  );
}


