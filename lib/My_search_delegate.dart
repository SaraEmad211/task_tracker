import 'package:flutter/material.dart';
import 'global functions/TaskCard.dart';
import 'global functions/customText.dart';

class MySearchDelegate extends SearchDelegate{
  //   @override
  // ThemeData appBarTheme(BuildContext context) {
  //   final theme = Theme.of(context);
  //   return theme.copyWith(
  //     inputDecorationTheme: InputDecorationTheme(
  //       hintStyle: TextStyle(color: Colors.grey[600]),
  //       labelStyle: const TextStyle(color: Colors.grey),
  //       filled: true,
  //       fillColor: Colors.white,
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 20),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(30),
  //         borderSide: BorderSide.none,
  //       ),
  //     ),
  //   );
  // }
 
  MySearchDelegate(List tasks,double screenHeight,double screenWidth);
    @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){
      query="";
    }, icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
return const Text("") ;}

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
   return Text("") ;
  }


}

Flexible task_list (List tasks,double screenHeight,double screenWidth){
  return     
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
        );
}