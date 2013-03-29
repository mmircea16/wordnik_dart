library wordnik;

import 'dart:async';
import 'dart:json';
import 'src/word_object.dart';
import 'src/word_request.dart';
//import 'package:http/http.dart' as http;
import 'dart:html';
import "package:intl/intl.dart";
import 'src/example_search_results.dart';
import 'src/example_request.dart';
import 'src/definition.dart';
import 'src/definition_request.dart';

export 'src/definition_request.dart';
export 'src/definition.dart';
export 'src/example_request.dart';
export 'src/example_search_results.dart';
export 'src/word_request.dart';
export 'src/word_object.dart';


class CustomHttpRequest {
 
  
  CustomHttpRequest(){
    
  }
  Future<String> read(String url,{Map headers}){
    HttpRequest http = new HttpRequest();
    http.open("GET",url);
    headers.keys.forEach((val){http.setRequestHeader(val, headers[val]);});
    var complete = new Completer();
    http.onLoad.listen((event){
      print(url);
      print(http.responseText);
      complete.complete(http.responseText);
      http.abort();
    });
    http.send();
    return complete.future;
  }
}


class WordnikAPI {
  
  final String apiKey;
  CustomHttpRequest client;
  Map<String,String> headers;
  String apiUrl;
  
  WordnikAPI(this.apiKey){
    client = new CustomHttpRequest();
    headers = new Map<String,String>();
    headers["api_key"] = this.apiKey;
    apiUrl = "http://api.wordnik.com/v4";
  }
  
  
  
  Future<List<Definition>> getDefinitions(DefinitionRequest req){
    var completer = new Completer();
    String params = "?${req.toParams()}";
    String path = "${apiUrl}/word.json/${req.word}/definitions${params}";
    Future<String> resp = client.read(path, headers:headers);
    resp.then((data){
       dynamic list = parse(data);
       List<Definition> defs = list.map((val)=>new Definition.fromJson(val, true)).toList();
       completer.complete(defs);
    });
    return completer.future;
  }
  
  Future<WordObject> getWordObject(WordRequest req){
    var completer = new Completer();
    String params = "?${req.toParams()}";
    String path = "${apiUrl}/word.json/${req.word}${params}";
    Future<String> resp = client.read(path, headers:headers);
    resp.then((data){
       WordObject w = new WordObject.fromJson(data);
       completer.complete(w);
    });
    return completer.future;
  }
  
  Future<Example> getTopExample(ExampleRequest req){
    var completer = new Completer();
    String params = "?${req.toParams()}";
    String path = "${apiUrl}/word.json/${req.word}/topExample${params}";
    Future<String> resp = client.read(path, headers:headers);
    resp.then((data){
       Example w = new Example.fromJson(data); 
       completer.complete(w);
    });
    return completer.future;
  }
  
  Future<ExampleSearchResults> getExamples(ExampleRequest req){
    var completer = new Completer();
    String params = "?${req.toParams()}";
    String path = "${apiUrl}/word.json/${req.word}/examples${params}";
    Future<String> resp = client.read(path, headers:headers);
    resp.then((data){
       ExampleSearchResults w = new ExampleSearchResults.fromJson(data);
       completer.complete(w);
    });
    return completer.future;
  }
  
  Future<String> getRandomString(){
   
    var completer = new Completer();
    
    Future<String> resp = client.read("http://api.wordnik.com/v4/words.json/randomWord?hasDictionaryDef=true&minDictionaryCount=100",headers: headers);
    int rez;
    resp.then(( r){
       String q= parse(r)["word"];
       completer.complete(q);
    }
    );
    return completer.future;
  }
  
  Future<String> getWordOfTheDay([DateTime date=null]){

    var completer = new Completer();  
    String dateStr = "";
    if (date != null){
      DateFormat df = new DateFormat("yyyy-MM-dd");
      dateStr="?date=${df.format(date)}";
    }
    Future<String> resp = client.read("http://api.wordnik.com/v4/words.json/wordOfTheDay${dateStr}",headers: headers);
    int rez;
    resp.then(( r){
       String q= parse(r)["word"];
       completer.complete(q);
    }
    );
    return completer.future;
  }
  
  Future<List<String>> getRandomWords([int limit=0]){

    var completer = new Completer();
    String limitStr = "";
    if (limit>0){
      limitStr = "&limit=${limit}";
    }
    Future<String> resp = client.read("http://api.wordnik.com/v4/words.json/randomWords?hasDictionaryDef=true&minDictionaryCount=100${limitStr}",headers: headers);
    int rez;
    resp.then(( r){
       List<String> q= parse(r).map((m){return m["word"];}).toList();
       completer.complete(q);
    }
    );
    return completer.future;
  }
}

