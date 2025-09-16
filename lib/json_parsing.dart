
import 'dart:convert';

import 'package:http/http.dart' as http;

String baseUrl = 'https://jsonplaceholder.typicode.com';

//Run this Example
void main()async{
  await JsonParsingExamples.runAllExamples();
}

// Model class for user

class User{
  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
  });

  //Factory constructor to create user from json

  factory User.fromJson(Map<String,dynamic>json){
    return User(
      id : json['id'],
      name : json['name'],
      email : json['email'],
      phone : json['phone'],
      website : json['website'],

    );
  }

  //Method to convert user to json
  Map<String,dynamic> toJson(){
    return{
    'id':id,
    'name':name,
    'email':email,
    'phone':phone,
    'website':website,
    };
  }
  @override
  String toString(){
    return 'User(id:$id,name"$name,email:$email)';
    }
  }

    //model class for post
  class Post{
    final int id;
    final int userId;
    final String title;
    final String body;

    Post({
      required this.id,
      required this.userId,
      required this.title,
      required this.body,
  });

    factory Post.fromJson(Map<String,dynamic>json){
      return Post(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['body'],
      );
    }
    Map<String,dynamic> toJson(){
      return{
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
    }
    @override
    String toString(){
      return 'Post(id: $id,title: $title)';
    }
  }

      class JsonParsingExamples{
      static Future<void> runAllExamples()async{

        print("Json parsing Examples");
        print('=======================');

        await parseSingleUser();
        await parseUserList();
      }

      //Parse single user json.
      static Future<void> parseSingleUser()async{
        print('Single user parsing');
        print('====================');

        try{
          final response = await http.get(Uri.parse('$baseUrl/users/1'));

          if(response.statusCode==200){
            print('Raw Json: ');
            print(response.body);
            print('');
            //Parse  Json String to Map 
            final Map<String,dynamic> jsonData = jsonDecode(response.body);
            print('Parsed Map: ');
            print('ID: ${jsonData['id']}');
            print("Name: ${jsonData['name']}");
            print('Email: ${jsonData['email']}');
            print('');
            //create user object from json
            final user = User.fromJson(jsonData);
            print('User objects : $user');
            print("");
          }else{
            print("Error: ${response.statusCode}");
          }
        }catch(e){
          print("Exception: $e");
        }
        print("");
      }

      //parse list of users

      static Future<void> parseUserList() async{
        print("User list parsing");
        print('================');

        try{
          final response = await http.get(Uri.parse('$baseUrl/users'));

          if(response.statusCode==200){
            //parse json array
            final List<dynamic> jsonArray = jsonDecode(response.body);
            print('Found ${jsonArray.length}users');
            print('');

            //Convert each json object to user

            final List<User> users=
                jsonArray.map((json) => User.fromJson(json)).toList();

            //print first 3 users
            print("First 3 Users:");
            for(int i= 0; i<3 && i<users.length;i++){
              final user = users[i];
              print('${i+1}.${user.name}(${user.email})');
            }
            print('');
          }else{
            print('Error: ${response.statusCode}');
          }
        }catch(e){
          print('Exception: $e');
        }
        print('');
      }

      //Parse Single post

      //Parse List of posts
      static Future<void> parsePostList()async{
        print("Post list parsing");
        print("");
        try{
          final response = await http.get(Uri.parse('$baseUrl/posts'));
          if(response.statusCode==200){
            final List<dynamic>jsonArray = jsonDecode(response.body);
            final List<Post> posts = jsonArray.map((json)=>Post.fromJson(json)).toList();
            print('Found${posts.length}posts');
            print('');

            //print first 3 posts
            print("First 3 posts");
            for(int i=0;i<3 && i<posts.length;i++){
              final post = posts[i];
              print("${i+1}.${post.title}");
            }
            print("");
          }else{
            print('Error: ${response.statusCode}');
          }
        }catch(e){
          print("Exception:$e");
        }


      }

      //Create json from object

      static Future<void> createJsonFromObject() async{
        print('Object to json');
        print("================");

        //Create a user object
        final user = User(
          id: 999,
          name: 'Darus Salam',
          email: 'john@Example.com',
          phone: '123-456-7890',
          website: 'darussalam.com',
        );
        print("Original User :$user");

        //Convert to json

        final userJson = user.toJson();
        print("Json Map: $userJson");


        //Convert to json String
        final jsonString = jsonEncode(userJson);
        print("Json String: $jsonString");


        //Parse back to object
        final parsedUser = User.fromJson(jsonDecoder(jsonString));

      }

  }



