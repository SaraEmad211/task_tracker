import 'package:flutter/material.dart';
import 'package:to_do_list/homescreen.dart';

class To_Do extends StatelessWidget {
  final List<Task> tasks=[
    Task("Wireframing", "Make some ideation from sketch and wireframes.", "12:00 PM", Colors.redAccent),
    Task("UI Design", "Visual design from the wireframe and make design system.", "1:30 PM", Colors.blueAccent),
    Task("Prototyping", "Make the interactive prototype for testing & stakeholders.", "3:00 PM", Colors.amberAccent),
    Task("Usability Testing", "Primary user testing and usability testing of the prototype.", "3:45 PM", Colors.tealAccent),
    Task("Meeting", "Sum up discussion for the new product with stakeholders.", "4:30 PM", Colors.purpleAccent),
  ];
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, size: 24, color: Colors.black),
                      onPressed: () {Navigator.pop(context);},
                    ),
                    Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {/*to add page */},
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text("Add Task", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: DateSelector(),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskItem(
              key: ValueKey(tasks[index].title), 
              task: tasks[index],
              isFirst: index == 0,
              isLast: index == tasks.length - 1,
            );
          },
        ),
      ),
    );
  }
}

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  final List<int> dates = [11, 12, 13, 14, 15, 16, 17];
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                children: [
                  Text(
                    days[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: isSelected ? Colors.blue : Colors.black54,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  Text(
                    dates[index].toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: isSelected ? Colors.blue : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
class Task{
  final String title;
  final String description;
  final String time;
  final Color color;
  Task(this.title,this.description,this.time,this.color);
}
class TaskItem extends StatelessWidget{
  final Task task;
  final bool isFirst;
  final bool isLast;
  const TaskItem({Key? key, required this.task, this.isFirst = false, this.isLast = false}) : super(key: key);  @override
  Widget build(BuildContext context) {
    return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
         children: [
           if(!isFirst)
             Container(width: 2,height: 20,color: Colors.grey),
           CircleAvatar(
              radius: 8,
              backgroundColor: task.color,
  ),
  if(!isLast)
    Container(width: 2,height: 50,color: Colors.grey),
  ],
  ),
  SizedBox(width: 16),
  Expanded(child: Container(
  padding: EdgeInsets.all(12),
  margin: EdgeInsets.only(bottom: 16),
  decoration: BoxDecoration(
  color: task.color.withOpacity(0.2),
  borderRadius: BorderRadius.circular(25),
  ),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(task.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: task.color)),
        Text(task.time,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ],
    ),
    SizedBox(height: 8),
    Text(task.description,style: TextStyle(fontSize: 20,color: Colors.black54)),
  ],
  ),
  ),
  ),
  ],
  );
  }
}