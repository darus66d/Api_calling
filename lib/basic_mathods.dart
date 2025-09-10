

import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = "https://jsonplaceholder.typicode.com";

class basicHttpMethod{

  static Future<void> runAllExample() async{

    print('Basic HTTP methods Examples');
    print('============================\n');

    await getExample();
    await postExample();

  }
  //Get request - read data

    static Future<void> getExample() async{
    print("Get Request Example");
    print('=====================');

    try {
      print('Fetching post with id 1.....');

      final response = await http.get(
          Uri.parse('$baseUrl/posts/1'),
        headers:{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      },
      );
    print("Status code: ${response.statusCode}");
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      print('Title: ${data['title']}');
      print('Body: ${data['body']}');
      print('User ID: ${data['userId']}');
    }else{
      print('Error: ${response.statusCode}');
    }
      } catch(e){
      print('Exception: $e');
    }
    print('');
  }

  //Post Request - create Data

    static Future<void> postExample()async{
    print('Post request Example');
    }
}





