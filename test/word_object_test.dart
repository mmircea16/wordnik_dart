import "dart:async";
import "package:Wordnick/wordnik.dart";
import "dart:io";
import "dart:json";
import "package:unittest/unittest.dart";


void main(){  
  test("== operator",(){
    WordObject w1 = new WordObject("test");
    WordObject w2 = new WordObject("different");
    
    expect(w1,equals(w1));
    expect(w1,isNot(equals(w2)));
  });
  
  test("parse json",(){
    String json = "{\"id\":1,\"word\":\"test\",\"canonicalForm\":\"test1\",\"originalWord\":\"test2\",\"vulgar\":\"test3\",\"suggestions\":[\"elem1\",\"elem2\"]}";
    WordObject w1 = new WordObject.fromJson(json);
    WordObject w2 = new WordObject('test');
    w2.id = 1;
    w2.canonicalForm = 'test1';
    w2.originalWord = 'test2';
    w2.vulgar = 'test3';
    w2.suggestions = ['elem1','elem2'];
    expect(w1,equals(w2));
  });
  
 
  
  test("parse simpe json",(){
    String json = "{\"id\":1,\"word\":\"test\"}";
    WordObject w1 = new WordObject.fromJson(json);
    WordObject w2 = new WordObject('test');
    w2.id = 1;
    w2.canonicalForm = null;
    w2.originalWord = null;
    w2.vulgar = null;
    w2.suggestions = [];
    expect(w1,equals(w2));
  });
}

