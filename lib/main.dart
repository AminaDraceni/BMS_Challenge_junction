import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff007185),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white, size: 40),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, color: Colors.white, size: 40),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track, color: Colors.white, size: 40),
            title: Text(""),
          ),
        ],
      ),

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: IconButton(icon: Icon(Icons.arrow_back,size: 40, color: Color(0xFF77C16B)), onPressed: null),
        bottomOpacity: 0,
        backgroundColor: Colors.white,
        
      ),
      body:// resselers all 
Column(



  children: [
    SizedBox(height: 30,),
        Container(
    
      width: 410,
    
      height: 602,
    
      decoration: BoxDecoration(
    
        color: const Color(0xffffffff)
    
    ),
    
    
    
      child :  ListView.builder(
    
                itemCount: 6,
    
                  itemBuilder: (context, i){
    
                    
    
                      return  Container( child: Column(
                        children: [
                          Container(
    
                     child :ListTile(
    
        title:
    
        Row (
    
            crossAxisAlignment: CrossAxisAlignment.center,
    
            children : <Widget>[
    
              SizedBox(width: 20,),
    
           Text(
    
          "Revendeur1",
    
          style: const TextStyle(
    
                                color:  const Color(0xff000000),
    
                                fontWeight: FontWeight.w400,
    
                                fontFamily: "OpenSans",
    
                                fontStyle:  FontStyle.normal,
    
                                fontSize: 18.0
    
    ),
    
          textAlign: TextAlign.center               
    
          ),
    
          Spacer(flex:2),
    
          /* SizedBox(
    
           width: (MediaQuery.of(context).size.width) * 0.34,
    
           height: (MediaQuery.of(context).size.height) * 0.025,
    
                child: Text(  "Wilaya : "+ "Alger",
    
                                style: const TextStyle(
    
        color:  const Color(0xff000000),
    
        fontWeight: FontWeight.w400,
    
        fontFamily: "OpenSans",
    
        fontStyle:  FontStyle.normal,
    
        fontSize: 11.0
    
    ),
    
       textAlign: TextAlign.left                     //textAlign: TextAlign.left
    
                          ),), */
    
                            /*Refus d'une invitation*/
    
                              
    
                            /*Acceptation d'une invitation*/     
    
                                 IconButton(onPressed:()=>  null,//a changer
    
                                 icon: Icon(
    
                                Icons.location_pin,
    
                                 color:  const Color(0xff77c16b),
    
                                 size: 30,
    
                                ),)]),
    
         subtitle :   Text(
    
                              "     Activité : "+ "electricien"  "   Wilaya : "+ "Alger",
    
                              style: const TextStyle(
    
        color:  const Color(0xff000000),
    
        fontWeight: FontWeight.w400,
    
        fontFamily: "OpenSans",
    
        fontStyle:  FontStyle.normal,
    
        fontSize: 11.0
    
    ),
    
                              textAlign: TextAlign.left                
    
                              ),
    
                                   onTap:null, /*_quittergroupe(document.documentID),*/
    
                              ),
    
                              
    
                              decoration: BoxDecoration(
    
        color:Colors.green.withOpacity(0.1),
    
        borderRadius: BorderRadius.circular(40),
    
        
    
    )
    
                              ),
                              SizedBox(height:15 ),
                        ],
                      ),
                          
                          );
    
                    
    
                  },
    
              ),
    
      /*StreamBuilder(
    
         stream: Firestore.instance.collection('Resseller').snapshots(),
    
         builder: (context,snapshot){
    
        /*Si la liste des invitations est vide affichage du message*/
    
         if (!snapshot.hasData) return const Text("It's empty",
    
          style: const TextStyle(
    
          color:  const Color(0xff3d3d3d),
    
          fontWeight: FontWeight.w400,
    
          fontFamily: "Roboto",
    
          fontStyle:  FontStyle.normal,
    
          fontSize: 15.0),
    
      textAlign: TextAlign.left );
    
       return  ListView.builder( 
    
         itemExtent: 80.0,
    
         itemCount:snapshot.data.documents.length,
    
         itemBuilder: (ctx,index )=> (
    
        buildlistItem(ctx,snapshot.data.documents[index])),);})*/),

        
  ],
)
);// resselers all 

  }


buildlistItem(BuildContext ctx,DocumentSnapshot document ) {
     return(ListTile(
    title:Row (
        crossAxisAlignment: CrossAxisAlignment.start,
        children : <Widget>[
       Text(
      document['nom'],
      style: const TextStyle(
          color:  const Color(0xff3d3d3d),
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
          fontStyle:  FontStyle.normal,
          fontSize: 17.0
      ),
      textAlign: TextAlign.left                
      ),
      Spacer(flex:1,),
       SizedBox(
       width: (MediaQuery.of(context).size.width) * 0.14,
       height: (MediaQuery.of(context).size.height) * 0.045,
            child: Text(  "Wilaya : "+ document['wilaya'],
                        style: const TextStyle(
                            color:  const Color(0xff52bf90),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 14.0),
                        //textAlign: TextAlign.left
                  ),), 
                    /*Refus d'une invitation*/
                      IconButton(onPressed:()=> null /*_refuserInvitation(document.documentID)*/,
                         icon: Icon(
                        Icons.cancel,
                         color:  const Color(0xffff5722),
                         size: 30,),),
                    /*Acceptation d'une invitation*/     
                         IconButton(onPressed:()=>  null,//a changer
                         icon: Icon(
                        Icons.check_circle,
                         color:  const Color(0xff13ef81),
                         size: 30,
                        ),)]),
     subtitle :   Text(
                      "Activité : "+ document['activite'],
                      style: const TextStyle(
                          color:  const Color(0xde3d3d3d),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                          fontStyle:  FontStyle.normal,
                          fontSize: 14.0
                      ),
                      textAlign: TextAlign.left                
                      ),
                           onTap:null, /*reseller = new resseller(),
                                          
                                         reseller.BDDressellerdoc =  BDD.collection("Resseller").document(document.documentID)
                                           */
                      )
                  );
                    }


}
