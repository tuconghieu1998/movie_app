import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:movie_app/core/model/movie.dart';
import 'package:movie_app/core/model/movie_detail.dart';

import '../core/constants/network_constants.dart';
import '../core/model/post.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static final Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  static Future<http.Response> get(String path, String params) async {
    String url = "${NetworkConst.url}$path?api_key=${NetworkConst.apiKey}$params";
    return await http.get(Uri.parse(url));
  } 

  static Future<String> getGuestSession() async {
    final response = await NetworkRequest.get("/authentication/guest_session/new", "");
    String guestSessionId = "";
    if(response.statusCode == 200) {
      final result = json.decode(response.body);
      guestSessionId = result["guest_session_id"];
    }
    return guestSessionId;
  }

  static Future<List<Movie>> getTrendingMovies() async {
    final response = await NetworkRequest.get("/trending/all/day", "");
    List<Movie> movies = [];
    if(response.statusCode == 200) {
      final results = json.decode(response.body)["results"] as List<dynamic>;
      movies = results.map((model) => Movie.fromJson(model)).toList();
    }

    return movies;
  }

  static Future<List<Movie>> getRelatedMovies(int movieId) async {
    final response = await NetworkRequest.get("/movie/$movieId/similar", "&language=en-US&page=1");
    List<Movie> movies = [];
    if(response.statusCode == 200) {
      final results = json.decode(response.body)["results"] as List<dynamic>;
      movies = results.map((model) => Movie.fromJson(model)).toList();
    }

    return movies;
  }

  static Future<MovieDetail> getMovieDetail(int movieId) async {
    final response = await NetworkRequest.get("/movie/$movieId", "&language=en-US");
    MovieDetail? movieDetail;
    if(response.statusCode == 200) {
      final result = json.decode(response.body);
      movieDetail = MovieDetail.fromJson(result);
    }
    return (movieDetail ?? new MovieDetail());
  }

  static List<Post> parsePost(String responseBody) {
    print(responseBody);
    var list = json.decode(responseBody) as List<dynamic>;
    List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Post>> fetchPosts({int page = 1}) async {
    final response = await http.get(uri);
    if(response.statusCode == 200) {
      return compute(parsePost, response.body);
    }
    else if(response.statusCode == 404) {
      throw Exception("Not Found");
    }
    else {
      throw Exception("Can't get posts");
    }
  }
}