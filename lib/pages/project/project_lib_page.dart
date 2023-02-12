import 'package:flutter/material.dart';
import 'package:teajai/models/project.dart';
import 'package:intl/intl.dart';
class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  List<Project> projects = [
    Project(
      title: 'My Champions: ส่งน้อง 1,000 คน เรียนต่อ',
      description:
          'จุดเริ่มต้นการเรียนสำหรับเด็กทุกคน ด้วยการมอบทุนการศึกษาให้น้องๆ 1,000 คนทั่วประเทศ ',
      targetAmount: 7000000,
      duration: 16,
      receiveAmount: 3500000,
      doneteCount: 500,
    ),
    Project(
      title: 'สนับสนุนกองทุนฟื้นฟูนกป่าล้านนา',
      description:
          'สนับสนุนค่าใช้จ่ายที่จำเป็นของหน่วยฟื้นฟูนกป่าล้านนา ในการดูแลรักษานกป่าที่บาดเจ็บและตกรัง',
      targetAmount: 451000,
      duration: 138,
      receiveAmount: 5000,
      doneteCount: 10,
    ),
    Project(
      title: 'โครงการนมเพื่อน้องในพื้นที่สังขละบุรี',
      description:
          'ร่วมบริจาคซื้อนมให้เด็กเล็กที่มีภาวะทุพโภชนาการ เพราะแม่มีปัญหาสุขภาพไม่สามารถให้นมลูกได้',
      targetAmount: 112002,
      duration: 47,
      receiveAmount: 6000,
      doneteCount: 235,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เทใจ'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        //Callback function
        itemBuilder: (BuildContext context, int index) {
          var project = projects[index];
          var myTextStyle = const TextStyle(fontSize: 12.0,color: Colors.black54);
          var formatter = NumberFormat('#,###,000');
          var target = formatter.format(project.targetAmount);
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project.title),
                  SizedBox(height: 8.0,),
                  Text(project.description,style: myTextStyle),
                  SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${project.duration.toString()} วัน', style: myTextStyle),
                      Text('$target บาท', style: myTextStyle),

                    ],
                  ),
                ],
              ) ,

            ),
          ); //แบบยาว
          //return Text(projects[index].title); แบบสั้น
        },
      ),
    );
  }
}
