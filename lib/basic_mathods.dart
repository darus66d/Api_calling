

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
    print('=====================');
    
    try{
      final newPost = {
        'title': 'My First post from Dart',
        'body' : 'This post was created using dart http package',
        'userId' : 1,
      };
      
      print('Creating new post.....');
      print('Title : ${newPost['title']}');
      
      final response = await http.post(
          Uri.parse('$baseUrl/posts'),
        headers: {
            'Content-Type': 'application/json',
          'Accept':'application/json',
        },
        body: jsonEncode(newPost),
      );
      print('status Code: ${response.statusCode}');

      if(response.statusCode == 201){
        final data = jsonDecode(response.body);
        print('Created post ID: ${data['id']}');
        print('Title: ${data['title']}');
      }else{
        print("Error: ${response.statusCode}");
      }
    }catch(e){
      print("Exception:$e");
    }
    print('');
    }

    //Put Request  update entire resource

  static Future<void> putExample()async{
    print('Put Request Example');
    print('=====================');

    try{
      final updatedPost ={
        'id':1,
        'title':'Updated Title via put',
        'body': 'This post was completely updated using put',
        'userId': 1,
      };

      print('Updating post with id 1...');
      print('New Title: ${updatedPost['title']}');

      final response = await http.put(
        Uri.parse('$baseUrl/posts/1'),
        headers: {
          'Content-Type' : 'application/json',
          'Accept' : 'application/json'
        },
        body: jsonEncode(updatedPost),
      );

    }catch(e){
      print("Exception: $e");
    }

  }


}





