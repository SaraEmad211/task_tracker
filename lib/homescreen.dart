import 'package:flutter/material.dart';
import 'package:to_do_list/Sign_In.dart';
import 'package:to_do_list/To_Do.dart';

class homescreen extends StatefulWidget {

 final String username;
  final String email;
  final String phone;

  const homescreen({super.key, required this.username, required this.email,required this.phone});


  @override
  State<homescreen> createState() => _homescreenState();
}
class _homescreenState extends State<homescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 

  @override
  Widget build(BuildContext context) {
         final screenWidth = MediaQuery.of(context).size.width;
    final   screenHeight= MediaQuery.of(context).size.height;

      List<Map<String, dynamic>> tasks = [
    {
      "title": "Team Meeting 🙌",
      "description": "Group discussion for \n the new product.",
      "time": "10:00 AM",
      "progress": 0.48,
      "color": Color(0xFF6072FF)
    },
    {
      "title": "UI Design 🎨",
      "description": "Make a homepage for \n the app.",
      "time": "11:00 AM",
      "progress": 0.75,
      "color": Color(0xFFE65974)
    },
    {
      "title": "Coding Session 💻",
      "description": "Implement new features.",
      "time": "02:00 PM",
      "progress": 0.30,
      "color": Colors.purple
    },
  ];

    return  Scaffold(
        key: _scaffoldKey,
      body: 
    SingleChildScrollView(
      child: Column(
        children: [
        SizedBox(height:screenHeight*0.07,
      ),
         top_icons(screenWidth),
        
      
      Padding(
      padding:  EdgeInsets.only(right: screenWidth*0.2,top: screenHeight*.05),
        child: customText("Good Morning, ${widget.username} !", 24),
      ),
        Padding(
      padding: EdgeInsets.only(right: screenWidth*0.2),
      child: customText("you have 49 tasks \n this month 👍", 30, color:Color.fromARGB(255, 34, 36, 95),isBold: true),
        )  
      ,
      search_box(screenHeight, screenWidth)
      ,
      SizedBox(
        height: screenHeight*0.05,
      )
      ,
      row_operations(screenWidth),
      Padding(
        padding:  EdgeInsets.only(top:screenHeight*0.03,left: screenWidth*0.08),
        child: Row(
      children: [
        customText("Today's Tasks", 30,color:Color.fromARGB(255, 34, 36, 95),isBold: true),
        SizedBox(width: screenWidth*0.2,),
        customText("See All", 20,color: Color.fromARGB(255, 154, 154, 154))
      ],
        ),
      ),
      
      SizedBox(
            height: screenHeight*0.2,
      
        child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
          child: ListView.separated(
                     scrollDirection: Axis.horizontal,
           itemBuilder: (context, index) {
                    return Expanded(
                      child: TaskCard(
                        title: tasks[index]["title"],
                        description: tasks[index]["description"],
                        time: tasks[index]["time"],
                        progress: tasks[index]["progress"],
                        color: tasks[index]["color"],
                      ),
                    );
                  },
            separatorBuilder: (context, index) => SizedBox(width: 10), 
          itemCount: tasks.length),
        ),
      )
      
      ],
      
      ),
    )
   
      ,
endDrawer:Drawer_profile()
     
    );
  }

  Drawer Drawer_profile() {
       final screenWidth = MediaQuery.of(context).size.width;
    final   screenHeight= MediaQuery.of(context).size.height;

    return Drawer(
child: Column(
 children: [

 Container(
          height: 230, 
          width: double.infinity, 
          color: Color.fromARGB(255, 200, 186, 237),
          alignment: Alignment.center,
          child: Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.05,top: screenHeight*0.05),
            child: Column(
              children: [
                Row(
                  children: [
                    customText("${widget.username}", 30,isBold: true),
                    SizedBox(width: screenWidth*0.18,),
                    Icon(Icons.face_2,size: 30,)
                  ],
                ),
                customText("📧Email:",color: Color(0xFF185ABD) ,25,isBold: true),
                              customText("${widget.email}", 20),
            
                              customText("📞Number:",color: Color(0xFF185ABD) ,25,isBold: true),
                        customText("+2${widget.phone}", 20),
            
            
              ],
            ),
          ),
        
        ),
         ListTile(title:customText("Log Out", 25, isBold: true),
       onTap: () =>
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => Sign_In()),
),
         )

 ],
  
),
);
  }


Row top_icons(double screenWidth) {
    return Row(children: [
  SizedBox(width: screenWidth*0.08,),
    CircleAvatar(backgroundColor: Color.fromARGB(255, 245, 201, 201),
      maxRadius:30,child: Icon(Icons.list_sharp),)
    ,    SizedBox(width: screenWidth*0.6,),
     CircleAvatar(

        radius: 30,

       
     child: InkWell(
    onTap: () {
      _scaffoldKey.currentState?.openEndDrawer();
    },
     child: Icon(Icons.face),
      ))
  

    ],
  );
  }



  


 

  Padding search_box(double screenHeight, double screenWidth) {
    return Padding(
padding:EdgeInsets.only(top: screenHeight*.05),
child: SizedBox(
     
      width: screenWidth*0.9,
      child: TextField(
        decoration: InputDecoration(  prefixIcon: Icon(Icons.search),labelText: "Search a task ...",border:OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none,),filled: true, fillColor: Colors.white,
       ),
      ),
    ),
);
  }

 Padding row_operations(double screenWidth) {
    return Padding(
padding: EdgeInsets.only(left: screenWidth*0.09),
child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      InkWell(child: stack("To_Do",20,0xFFDB516A,0xFFFBE3EB,Icons.assignment),
      onTap: () =>
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => To_Do()),
  )),
      SizedBox(width: screenWidth*0.05,),
      stack("Progress",20,0xFFF3C829,0xFFFEFAE6,Icons.sync),
            SizedBox(width: screenWidth*0.05,),
  
      stack("Done",20,0xFF0DC080,0xFFE0FFF5,Icons.assignment_turned_in),
  
  
    ],
  ),
)
,
);
  }


  Stack stack(String TEXT,double sizefont,int boredercolour,int Colour,IconData  iconn) {
    return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 236, 233, 244),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      Padding(
        padding:  EdgeInsets.only(top:20.0),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(boredercolour),
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Color(Colour),
                radius: 45,
                child: Icon(iconn, size: 50,color: Color(boredercolour),),
              ),
            ),
SizedBox(height: 10,),
            Text(TEXT,style: TextStyle(fontSize: sizefont,fontWeight: FontWeight.bold),),


          ],
        ),
      ),
    ],
    );
  }
}

Widget customText(String text, double size, {Color color = Colors.black,bool isBold = false}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      
    ),
     
  );
}

Widget TaskCard({
  required String title,
  required String description,
  required String time,
  required double progress,
  required Color color,
}) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(title, 25, color: Colors.white,isBold: true),
          SizedBox(height: 5), 
          Wrap(
            children: [
            customText(description,20,color: Colors.white)
            ],
          ),
          SizedBox(height: 5),
          customText(time, 20, color: Colors.white,isBold: true),
        ],
      ),
    ),
  );
}