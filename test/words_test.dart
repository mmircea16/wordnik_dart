
import "dart:async";
import "package:Wordnick/wordnik.dart";
import "package:unittest/unittest.dart";


WordnikAPI api;

void main(){
  setup();

  testRandomWord();
  testWordOfTheDay();
  testRandomWords();
  testGetWordObject();
  testGetExamples();
}

void setup(){
  print("Hello Wordnik Test: Setup stage");
  api = new WordnikAPI("187b7605269b0c53bf65714c9a901203abe8587b53a397a0a");
}

void testGetExamples(){
  group("Get examples API call",(){
    ExampleRequest req = new ExampleRequest("osteosarcoma");
    Future<ExampleSearchResults> response = api.getExamples(req);
    test("check error",(){
      throwsA(response);
    });
    test("check response for 'osteosarcoma'",(){
      
      ExampleSearchResults comp = new ExampleSearchResults.fromJson("{\"examples\":[{\"year\":2009,\"provider\":{\"name\":\"wordnik\",\"id\":711},\"url\":\"http://www.chop.edu/service/oncology/cancers-explained/bone-cancer-in-children.html\",\"word\":\"osteosarcoma\",\"text\":\"If osteosarcoma is suspected based on X-rays or other imaging tests, a sample of the tumor (a biopsy) will be examined under the microscope to confirm the diagnosis.\",\"title\":\"Bone Cancer in Children\",\"documentId\":30105801,\"exampleId\":792037061,\"rating\":444.0},{\"year\":2008,\"provider\":{\"name\":\"simonschuster\",\"id\":722},\"url\":\"http://books.simonandschuster.com/9781416996071\",\"word\":\"osteosarcoma\",\"text\":\"“It’s called osteosarcoma, which is a type of bone cancer that kids get.”\",\"title\":\"The Comeback Season\",\"documentId\":32496597,\"exampleId\":608956103,\"rating\":290.0},{\"year\":2009,\"provider\":{\"name\":\"wordnik\",\"id\":711},\"url\":\"http://transcripts.cnn.com/TRANSCRIPTS/0908/26/ltm.03.html\",\"word\":\"osteosarcoma\",\"text\":\"(END VIDEO CLIP) GUPTA: You may not know but Teddy Junior had osteosarcoma, which is another type of cancer.\",\"title\":\"CNN Transcript Aug 26, 2009\",\"documentId\":23071981,\"exampleId\":862849518,\"rating\":280.83008},{\"year\":2011,\"provider\":{\"name\":\"spinner\",\"id\":712},\"url\":\"http://us.rd.yahoo.com/finance/news/rss/story/*http://biz.yahoo.com/prnews/110919/de70202.html?.v=1\",\"word\":\"osteosarcoma\",\"text\":\"During the drug testing process, the medicine in FORTEO caused some rats to develop a bone cancer called osteosarcoma.\",\"title\":\"\",\"documentId\":32944241,\"exampleId\":653807754,\"rating\":269.0},{\"year\":2011,\"provider\":{\"name\":\"spinner\",\"id\":712},\"url\":\"http://www.npr.org/2011/11/26/142795959/after-nba-and-jazz-wayman-tisdales-story-cut-short?ft=1&f=7\",\"word\":\"osteosarcoma\",\"text\":\"It ended up being a disease called osteosarcoma bone cancer, which is a rare form of mainly childhood bone cancer.\",\"title\":\"News\",\"documentId\":33126327,\"exampleId\":662172440,\"rating\":269.0}]}");  
      expect(response,completion(equals(comp)));
    });
  });
}

void testGetWordObject(){
  group("Get Word API Call",(){
    WordRequest req = new WordRequest("test");
    Future<WordObject> response = api.getWordObject(req);
    test("check error",(){
      throwsA(response);
    });
    test("simple retrive for 'test'",(){
      WordObject w = new WordObject("test");
      w.id = 0;
      expect(response,completion(equals(w)));
    });
    
    test("simple retrive for 'cats'",(){
      WordRequest req = new WordRequest("cats");
      Future<WordObject> response = api.getWordObject(req);
      WordObject w = new WordObject("cats");
      w.id = 0;
      w.canonicalForm = "cat";
      w.suggestions = ["cat"];
      expect(response,completion(equals(w)));
    });
    
  });
}

void testRandomWords(){
  group("Random Word",(){
    Future<List<String>> random = api.getRandomWords();
    test("has default length",(){
      expect(random,completion(hasLength(equals(10)),"len is default"));
    });
    test("check error",(){
      throwsA(random);
    });
    test("has length = 15",(){
      random = api.getRandomWords(15);
      expect(random,completion(hasLength(equals(15))));
    });
  });
}

void testRandomWord(){
  group("Random Word",(){
    Future<String> random = api.getRandomString();
    test("has length > 0",(){
      expect(random,completion(hasLength(greaterThan(0)),"len > 0"));
    });
    test("check error",(){
      throwsA(random);
    });
  });
}

void testWordOfTheDay(){
  group("Word of the Day",(){
    Future<String> random = api.getWordOfTheDay();
    test("has length > 0",(){
      expect(random,completion(hasLength(greaterThan(0)),"len > 0"));
    });
    test("check error",(){
      throwsA(random);
    });
   
    test("24 march 2013",(){
      DateTime dt = new DateTime.utc(2013,3,24);
      random = api.getWordOfTheDay(dt);
      expect(random,completion(equals("soca"),"24 march"));
    });
    
    test("1st jan 2013",(){
      DateTime dt = new DateTime.utc(2013,1,1);
      random = api.getWordOfTheDay(dt);
      expect(random,completion(equals("manzai"),"1 jan"));
    });
  });
}
