import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkPictureCall extends StatefulWidget {
  @override
  PictureRequest createState() => PictureRequest();
}

class PictureRequest extends State<NetworkPictureCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pictures"),
      ),
      body: FutureBuilder<AllItemResponse>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          if (snapshot.hasData) {
            List<ImageModel> models = List();
            List<DataModel> d=snapshot.data.data;
            d.forEach((k) =>models.add(k.images[0]) );
            return PhotosList(photos: models);
          } else {
            return Center(child: CircularProgressIndicator());
          }
          },
      ),
    );
  }
}

class AllItemResponse {
  final String status;
  final int status_code;
  final List<DataModel> data;

  AllItemResponse({
    this.status,
    this.status_code,
    this.data,
  });

  factory AllItemResponse.fromJson(Map<String, dynamic> json) {
    var itemData = json['data'] as List;
    List<DataModel> imagesList =
        itemData.map((i) => DataModel.fromJson(i)).toList();
    return AllItemResponse(
      status: json['status'] as String,
      data: imagesList,
    );
  }
/*
  Future<List<DataModel>> fetchPhotos(http.Client client) async {
    final response =
    await client.get('https://jsonplaceholder.typicode.com/photos');

    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(parsePhotos, response.body);
  }
*/

// A function that converts a response body into a List<Photo>.

}

class ImageModel {
  final int id;
  final String image_path;

  ImageModel({this.id, this.image_path});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      image_path: json['image_path'] as String,
    );
  }
}

class DataModel {
  final List<ImageModel> images;

  DataModel({this.images});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    var itemData = json['images'] as List;
    List<ImageModel> imagesList =
        itemData.map((i) => ImageModel.fromJson(i)).toList();
    return DataModel(
      images: imagesList,
    );
  }
}

Future<AllItemResponse> fetchPhotos(http.Client client) async {
  final response = await client.get(
    'http://ecommerce.3callistos.com/api/v1/items',
    headers: {
      "X-APP-TOKEN":
          "ede7353f371663de51accb482e11670b930da7d90b3c4703261f66255149347a5a97e",
      "provider": "appusers"
    },
  );

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return AllItemResponse.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class PhotosList extends StatelessWidget {
  final List<ImageModel> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(
            "http://ecommerce.3callistos.com/" + photos[index].image_path);
      },
    );
  }
}
