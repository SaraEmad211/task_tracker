// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:to_do_list/My_search_delegate.dart';
import 'package:to_do_list/Sign_in.dart';
import 'package:to_do_list/To_Do.dart';
import 'global functions/customText.dart';
import 'global functions/TaskCard.dart';
class Homescreen extends StatefulWidget {

 final String username;
  final String email;
  final String phone;

  const Homescreen({super.key, required this.username, required this.email,required this.phone});


  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {
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
      "color": const Color(0xFF6072FF)
    },
    {
      "title": "UI Design 🎨",
      "description": "Make a homepage for \n the app.",
      "time": "11:00 AM",
      "progress": 0.75,
      "color": const Color(0xFFE65974)
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
    SafeArea(
      child: Expanded(
        child: Column(
          children: [
            
        //   SizedBox(height:screenHeight*0.07,
        // ),
        
           top_icons(screenWidth),
          SizedBox(height:screenHeight*0.04,
         ),
        Padding(
          padding: EdgeInsets.only(right: screenWidth*0.1),
          child: RichText(text: TextSpan(
            children: [
              TextSpan(text: "Good Morning, ${widget.username} !",style: TextStyle(color: Colors.black,fontSize: 24))
            ]
          ),),
        ),
        Padding(
          padding: EdgeInsets.only(left: screenWidth*0.05),
          child: Flexible(
            child: RichText(text: TextSpan(
              children: [
                TextSpan(text: "you have ",style: TextStyle(color:const Color.fromARGB(255, 34, 36, 95),fontSize: 30,fontWeight: FontWeight.bold)),
                TextSpan(text: "49 tasks",style: TextStyle(color:const Color.fromARGB(255, 63, 69, 237),fontSize: 30,fontWeight: FontWeight.bold)),
                TextSpan(text: " this month 👍",style: TextStyle(color:const Color.fromARGB(255, 34, 36, 95),fontSize: 30,fontWeight: FontWeight.bold))


              ]
            ),),
          ),
        ),
        GestureDetector(
  onTap: () {
    showSearch(context: context, delegate: MySearchDelegate(tasks,screenHeight,screenWidth));
  },child: search_box(screenHeight, screenWidth),),
          
        // SizedBox(
        //   height: screenHeight*0.05,
        // )
        //,
        row_operations(screenWidth),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          customText("Today's Tasks", 30,color:const Color.fromARGB(255, 34, 36, 95),isBold: true),
          SizedBox(width: screenWidth*0.2,),
          customText("See All", 20,color: const Color.fromARGB(255, 154, 154, 154))
                  ],
          ),
        ),
        
        Flexible(
          child: SizedBox(
                height: screenHeight*0.25,
          
            child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
              child: ListView.separated(
                         scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) {
                        return TaskCard(
                          title: tasks[index]["title"],
                          description: tasks[index]["description"],
                          time: tasks[index]["time"],
                          progress: tasks[index]["progress"],
                          color: tasks[index]["color"],
                          screenWidth: screenWidth
                        );
                      },
                separatorBuilder: (context, index) => const SizedBox(width: 10), 
              itemCount: tasks.length),
            ),
          ),
        )
        
        ],
        
        ),
      ),
    )
   
      ,
endDrawer:Drawer_profile()
     
    );
  }

  // ignore: non_constant_identifier_names
  Drawer Drawer_profile() {
       final screenWidth = MediaQuery.of(context).size.width;
    final   screenHeight= MediaQuery.of(context).size.height;

    return Drawer(
child: Column(
 children: [

 Container(
          height: 230, 
          width: double.infinity, 
          color: const Color.fromARGB(255, 200, 186, 237),
          alignment: Alignment.center,
          child: Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.02,top: screenHeight*0.05),
            child: Column(
              children: [
                Row(
                  children: [
                    customText(widget.username, 30,isBold: true),
                    SizedBox(width: screenWidth*0.18,),
                    const Icon(Icons.face_2,size: 30,)
                  ],
                ),
                customText("📧Email:",color: const Color(0xFF185ABD) ,25,isBold: true),
                              customText(widget.email, 20),
            
                              customText("📞Number:",color: const Color(0xFF185ABD) ,25,isBold: true),
                        customText("+2${widget.phone}", 20),
            
            
              ],
            ),
          ),
        
        ),
         ListTile(title:customText("Log Out", 25, isBold: true),
       onTap: () =>
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const Sign_in()),
),
         )

 ],
  
),
);
  }


// ignore: non_constant_identifier_names
Row top_icons(double screenWidth) {
    return Row(children: [
  SizedBox(width: screenWidth*0.08,),
    const CircleAvatar(backgroundColor: Color.fromARGB(255, 245, 201, 201),
      maxRadius:30,child: Icon(Icons.list_sharp),)
    ,    SizedBox(width: screenWidth*0.5,),
     CircleAvatar(

        radius: 30,

       
     child: InkWell(
    onTap: () {
      _scaffoldKey.currentState?.openEndDrawer();
    },
     child: const Icon(Icons.face),
      ))
  

    ],
  );
  }



  


 

//   Padding search_box(double screenHeight, double screenWidth) {
//     return Padding(
// padding:EdgeInsets.only(top: screenHeight*.05),
// child: SizedBox(
     
//       width: screenWidth*0.9,
//       child: TextField(
//         decoration: InputDecoration(  prefixIcon: const Icon(Icons.search),labelText: "Search a task ...",border:OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none,),filled: true, fillColor: Colors.white,
//        ),
//       ),
//     ),
// );
//   }
 Container search_box(double screenHeight, double screenWidth) {
    return 
   Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: const [
        Icon(Icons.search, color: Colors.grey),
        SizedBox(width: 10),
        Text(
          "Search a task ...",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    ),
  
   );
  }

 // ignore: non_constant_identifier_names
 Center row_operations(double screenWidth) {
    return Center(
child: SafeArea(
  child:Row(
     mainAxisSize: MainAxisSize.min,
    children: [

      Flexible(
        child: InkWell(child: stack("To_Do",25,0xFFDB516A,0xFFFBE3EB,Icons.assignment),
        onTap: () =>
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => To_Do()),
          )),
      ),
      SizedBox(width: screenWidth*0.05,),
      Flexible(child: stack("Progress",20,0xFFF3C829,0xFFFEFAE6,Icons.sync)),
            SizedBox(width: screenWidth*0.05,),
  
      Flexible(child: stack("Done",25,0xFF0DC080,0xFFE0FFF5,Icons.assignment_turned_in)),
  
  
    ],
  )
 
)
,
);
  }


  // ignore: non_constant_identifier_names
  Stack stack(String TEXT,double sizefont,int boredercolour,int Colour,IconData  iconn) {
    return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 236, 233, 244),
          borderRadius: BorderRadius.circular(50),
        ),
        child:Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
          const SizedBox(height: 10,),
              Text(TEXT,style: TextStyle(fontSize: sizefont,fontWeight: FontWeight.bold),maxLines: 1,  
                  overflow: TextOverflow.ellipsis, 
                  softWrap: true,),
          
          
            ],
          ),
        ),
      ),
   
    ],
    );
  }
}


// ignore: non_constant_identifier_names
