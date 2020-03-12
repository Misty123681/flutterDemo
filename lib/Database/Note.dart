class Note {
  int id;
  int priority;
  String title;
  String discription;
  String date;

  Note.defaultName(){
    this.date = '';
    this.priority = 1;
    this.discription = '';
    this.title = '';
  }

  Note(this.date, this.discription, this.priority, this.title);

  Note.withId(this.id,this.title, this.priority, this.discription, this.date);

//  int get id => _id;
//  int get priority => _priority;
//  String get title => _title;
//  String get discription => _discription;
//  String get date => _date;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map["id"] = this.id;
    }
    map["priority"] = priority;
    map["title"] = title;
    map["discription"] = discription;
    map["date"] = date;
    return map;

  }

  Note.fromMapObject(Map<String,dynamic> map){
    this.title =  map["title"];
    this.id = map["id"];
    this.discription = map["discription"] ;
    this.date = map["date"];
    this.priority = map["priority"];

  }
}
