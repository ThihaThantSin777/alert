
class QueList{
  int index=0;
  List<Questions>ques=[Questions("မြန်မာနိုင်ငံ၏မြို့တော်မှာရန်ကုန်မြို့ဖြစ်ပါ်သည်",false),
  Questions("မြန်မာနိုင်ငံတွင်တိုင်းရင်းသား ၁၃၅မျိုးနေထိုင်သည်",true),
  Questions("အကြီးဆုံးပြည်နယ်မှာမွန်ပြည်နယ်ဖြစ်သည်",false),
  Questions("တရုတ်နဲ့ နယ်နမိတိထိစပ်နေသည်",true),
  Questions("မြစ်များသည်တောင်မှမြောက်သို့စီးဆင်းနေသည်",false),
  Questions("ဗိုလ်ချုပ်အောင်ဆန်းသည်နတ်မောက်ဇာတိဖြစ်သည်",true),

  ];

  String getQuestion(){
    return ques[index].question;
  }
  bool getAnswer(){
    return ques[index].answer;
  }

  void next(){
    if(index < ques.length-1){
      index++;
    }
  }
}
class Questions {
   late String question;
    late  bool answer;
  Questions(String question, bool answer) {
    
    this.question = question;
    this.answer = answer;
  }
}
