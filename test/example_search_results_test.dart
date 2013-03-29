import "dart:async";
import "package:Wordnick/wordnik.dart";
import "dart:io";
import "dart:json";
import "package:unittest/unittest.dart";

void main(){
  
  test("simple creation",(){
  
    ExampleSearchResults res = new ExampleSearchResults();
    
    expect(res,equals(res));
    
  });
  
  test("create contentProvider",(){
    ContentProvider c1 = new ContentProvider.fromJson("{\"id\":1,\"name\":\"test\"}");
    ContentProvider c2 = new ContentProvider();
    c2.id = 1 ;c2.name = "test";
    expect(c1,equals(c2));
  });
  
  test("create facetValue",(){
    FacetValue c1 = new FacetValue.fromJson("{\"count\":2,\"value\":\"gist\"}");
    FacetValue c2 = new FacetValue();
    c2.count = 2 ;c2.value = "gist";
    expect(c1,equals(c2));
  });
  
  test("create facet",(){
    Facet c1 = new Facet.fromJson("{\"name\":\"test\",\"facetValues\":[{\"count\":3,\"value\":\"val1\"},{\"count\":2,\"value\":\"val2\"}]}");
    Facet c2 = new Facet();
    c2.name = "test" ;
    FacetValue fv1 = new FacetValue();fv1.count=3;fv1.value="val1";
    FacetValue fv2 = new FacetValue();fv2.count=2;fv2.value="val2";
    c2.facetValues = [fv1,fv2];
    expect(c1,equals(c2));
  });
  
  test("create ScoreWord",(){
    ScoreWord c1 = new ScoreWord.fromJson("{\"position\":2,\"id\":3,\"word\":\"wording\"}");
    ScoreWord c2 = new ScoreWord();
    c2.position = 2 ;c2.id = 3;c2.word="wording";
    expect(c1,equals(c2));
  });
  
  
  test("create Sentence",(){
    Sentence c1 = new Sentence.fromJson("{\"hasScoredWords\":true,\"id\":4,\"display\":\"bla\",\"scoredWords\":[{\"id\":10},{\"id\":12}]}");
    Sentence c2 = new Sentence();
    c2.hasScoredWords = true ;c2.id = 4;c2.display="bla";
    ScoreWord sw1 = new ScoreWord(); sw1.id = 10;
    ScoreWord sw2 = new ScoreWord(); sw2.id = 12;
    c2.scoredWords = [sw1,sw2];
    expect(c1,equals(c2));
  });
  
  test("create Example",(){
    Example e1 = new Example.fromJson("{\"title\":\"title\",\"id\":3,\"text\":\"text\",\"sentence\":{\"hasScoredWords\":true,\"id\":4,\"display\":\"bla\",\"scoredWords\":[{\"id\":10},{\"id\":12}]}}");
    Example e2 = new Example();
    e2.title = "title" ;e2.id = 3;e2.text="text";
    Sentence c2 = new Sentence();
    c2.hasScoredWords = true ;c2.id = 4;c2.display="bla";
    ScoreWord sw1 = new ScoreWord(); sw1.id = 10;
    ScoreWord sw2 = new ScoreWord(); sw2.id = 12;
    c2.scoredWords = [sw1,sw2];
    e2.sentence=c2;
    expect(e1,equals(e2));
  });
  
}

