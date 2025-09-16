
import 'package:http/http.dart' as http;

String baseUrl = 'https://jsonplaceholder.typicode.com';

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
      }

      //Parse single user json.
      static Future<void> parseSingleUser()async{
        print('Single user parsing');
      }

  }



