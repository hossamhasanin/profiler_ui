import 'package:flutter/material.dart';
import 'package:profiler_ui/signup.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: <String , WidgetBuilder>{
    "/signup": (BuildContext context) => new SignupPage()
  },
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Animation animation , delayedAnimation , muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(duration: Duration(seconds: 3) , vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: animationController
    ));
    
    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.5 , 1.0 , curve: Curves.fastOutSlowIn),
      parent: animationController
    ));
    
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.8 , 1.0 , curve: Curves.fastOutSlowIn),
      parent: animationController
    ));

    

  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    
    
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context , Widget child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Transform(
                transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text(
                          "Hello",
                          style: TextStyle(
                              fontSize: 80.0,fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                        child: Text(
                          "There",
                          style: TextStyle(
                              fontSize: 80.0,fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(230.0, 175.0, 0.0, 0.0),
                        child: Text(
                          ".",
                          style: TextStyle(
                              fontSize: 80.0,fontWeight: FontWeight.bold,color: Colors.green
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(delayedAnimation.value * width, 0.0, 0.0),
                child: Container(
                  padding: EdgeInsets.only(top: 35.0 , left: 20.0 , right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)
                            )
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)
                            )
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0 , 0),
                        padding: EdgeInsets.only(top: 15.0 , left: 20.0),
                        child: InkWell(
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat",
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          child: GestureDetector(
                            onTap: (){},
                            child: Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: ImageIcon(AssetImage("assets/facebook.png")),
                              ),
                              SizedBox(width: 10.0),
                              Center(
                                child: Text(
                                  "Login with facebook",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat"
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Transform(
                transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "New to Spotify ?",
                      style: TextStyle(
                          fontFamily: "Montserrat"
                      ),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed("/signup");
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}


