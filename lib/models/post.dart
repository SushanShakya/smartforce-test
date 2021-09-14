import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:smartforce/models/user.dart';
import 'package:smartforce/utils.dart';

class Post {
  String title;
  List<String> images;
  bool liked;
  String location;
  DateTime created;
  DateTime edited;
  User user;
  int matchRate;
  int price;

  Post({
    this.title,
    this.images,
    this.liked,
    this.location,
    this.created,
    this.edited,
    this.user,
    this.matchRate,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'images': images,
      'liked': liked,
      'location': location,
      'created': created.millisecondsSinceEpoch,
      'edited': edited.millisecondsSinceEpoch,
      'user': user.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'],
      images: List<String>.from(map['images']),
      liked: map['liked'],
      location: map['location'],
      created: map['created'].toDate(),
      edited: map['edited'].toDate(),
      price: map['price'],
      user: User.fromMap(map),
      matchRate: MatchGenerator.generateMatch(),
    );
  }

  String cost() {
    return price.toString();
  }

  String date() {
    return DateConverter.formatDate(created);
  }

  String time() {
    return DateConverter.convertTimeToString(TimeOfDay.fromDateTime(created));
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(title: $title, images: $images, liked: $liked, location: $location, created: $created, edited: $edited, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.title == title &&
        listEquals(other.images, images) &&
        other.liked == liked &&
        other.location == location &&
        other.created == created &&
        other.edited == edited &&
        other.user == user;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        images.hashCode ^
        liked.hashCode ^
        location.hashCode ^
        created.hashCode ^
        edited.hashCode ^
        user.hashCode;
  }
}
