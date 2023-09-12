class AirResult {
  AirResult({
    this.status,
    this.data,
  });

  AirResult.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.city,
    this.state,
    this.country,
    this.location,
    this.current,
  });

  Data.fromJson(dynamic json) {
    city = json['city'];
    state = json['state'];
    country = json['country'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }
  String? city;
  String? state;
  String? country;
  Location? location;
  Current? current;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    return map;
  }
}

class Current {
  Current({
    this.pollution,
    this.weather,
  });

  Current.fromJson(dynamic json) {
    pollution = json['pollution'] != null
        ? Pollution.fromJson(json['pollution'])
        : null;
    weather =
        json['weather'] != null ? Weather.fromJson(json['weather']) : null;
  }
  Pollution? pollution;
  Weather? weather;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pollution != null) {
      map['pollution'] = pollution?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.toJson();
    }
    return map;
  }
}

class Weather {
  Weather({
    this.ts,
    this.tp,
    this.pr,
    this.hu,
    this.ws,
    this.wd,
    this.ic,
  });

  Weather.fromJson(dynamic json) {
    ts = json['ts'];
    tp = json['tp'];
    pr = json['pr'];
    hu = json['hu'];
    ws = json['ws'];
    wd = json['wd'];
    ic = json['ic'];
  }
  String? ts;
  num? tp;
  num? pr;
  num? hu;
  num? ws;
  num? wd;
  String? ic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ts'] = ts;
    map['tp'] = tp;
    map['pr'] = pr;
    map['hu'] = hu;
    map['ws'] = ws;
    map['wd'] = wd;
    map['ic'] = ic;
    return map;
  }
}

class Pollution {
  Pollution({
    this.ts,
    this.aqius,
    this.mainus,
    this.aqicn,
    this.maincn,
  });

  Pollution.fromJson(dynamic json) {
    ts = json['ts'];
    aqius = json['aqius'];
    mainus = json['mainus'];
    aqicn = json['aqicn'];
    maincn = json['maincn'];
  }
  String? ts;
  num? aqius;
  String? mainus;
  num? aqicn;
  String? maincn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ts'] = ts;
    map['aqius'] = aqius;
    map['mainus'] = mainus;
    map['aqicn'] = aqicn;
    map['maincn'] = maincn;
    return map;
  }
}

class Location {
  Location({
    this.type,
    this.coordinates,
  });

  Location.fromJson(dynamic json) {
    type = json['type'];
    coordinates =
        json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? type;
  List<num>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }
}
