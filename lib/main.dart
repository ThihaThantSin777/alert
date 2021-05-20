import 'package:flutter/material.dart';
import 'package:qa/questionList.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionAnswer(),
    );
  }
}

class QuestionAnswer extends StatefulWidget {
  @override
  _QuestionAnswerState createState() => _QuestionAnswerState();
}

class _QuestionAnswerState extends State<QuestionAnswer> {
  QueList ql=new QueList();
  List<Widget> icons = [];
void showAlert(context,int index){
  if(icons.length==6){ 
      icons.clear();
Alert(
      context: context,
      type: AlertType.info,
      title: "FINISHED",
      desc: "Finished quiz.",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              ql.index=0;
              Navigator.pop(context);
            });
          },
          width: 120,
        )
      ],
    ).show();
  }
}
  void check(bool cond){
    if(ql.getAnswer()==cond){
 icons.add(  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 20,
                    child: Icon(Icons.check, color: Colors.white, size: 30),
                  ),);
    }else {
      icons.add(  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 20,
                    child: Icon(Icons.close, color: Colors.white, size: 30),
                  ),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      ql.getQuestion(), 
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                   setState(() {
                     check(true);
                     ql.next();
                     print(ql.index);
            showAlert(context, ql.index);
                   });
                  },
                                  child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 350,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                            "မှန်",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                      ),
                    ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                        check(false);
                     ql.next();
                     showAlert(context, ql.index);
                    });
                  },
                                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    width: 350,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        "မှား",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: icons,
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
