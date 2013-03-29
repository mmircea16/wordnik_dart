import "dart:async";
import "package:Wordnick/wordnik.dart";
import "package:unittest/unittest.dart";

void main(){
  test("== operator",(){
    WordRequest w1 = new WordRequest("state");
    WordRequest w2 = new WordRequest("different");
    expect(w1,equals(w1));
    expect(w1,isNot(equals(w2)));
  });
  
  test("constructor",(){
    WordRequest r1 = new WordRequest("test",true,true);
    WordRequest r2 = new WordRequest("");
    r2.word = "test";
    r2.useCanonical = true;
    r2.includeSuggestions = true;
    expect(r1,equals(r2));
  });
  
  test("http params",(){
    WordRequest r1 = new WordRequest("test",true,false);
    String response = "useCanonical=true&includeSuggestions=false";
    expect(r1.toParams(),equals(response));
  });
}

