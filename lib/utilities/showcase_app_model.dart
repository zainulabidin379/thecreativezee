// A model that represents portfolio apps on landing page.
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowcaseAppModel {
  final String name;
  final String? appStoreURL;
  final String? playStoreURL;
  final String? githubURL;
  final List image;
  final String topic;

  const ShowcaseAppModel({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    required this.image,
    required this.topic,
  }) : _isNetworkImage = true;

  const ShowcaseAppModel.withNetworkAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    required this.image,
    required this.topic,
  }) : _isNetworkImage = true;

  const ShowcaseAppModel.withLocalAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    required this.image,
    required this.topic,
  }) : _isNetworkImage = true;

  final bool _isNetworkImage;
  bool get isNetworkImage => _isNetworkImage;

  factory ShowcaseAppModel.fromMap(DocumentSnapshot doc) {
    return ShowcaseAppModel(
      name: doc['name'],
      image: doc['image'],
      topic: doc['topic'],
      appStoreURL: doc['appStoreURL'],
      playStoreURL: doc['playStoreURL'],
      githubURL: doc["githubURL"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "topic": topic,
      "image": image,
      "appStoreURL": appStoreURL,
      'playStoreURL': playStoreURL,
      'githubURL': githubURL,
    };
  }
}