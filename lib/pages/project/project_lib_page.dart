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
          var descriptionStyle =
              const TextStyle(fontSize: 12.0, color: Colors.black54);
          var amountStyle = const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          );

          var formatter = NumberFormat('#,###,000');
          var percentTeax = ((project.receiveAmount / project.targetAmount) * 100).toStringAsFixed(0);
          var percent = int.tryParse(percentTeax);
          var target = formatter.format(project.targetAmount);
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project.title),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(project.description, style: descriptionStyle),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('เป้าหมาย', style: descriptionStyle),
                          Text('$target บาท', style: amountStyle),
                        ],
                      ),
                      Text('$percentTeax %', style: descriptionStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: percent!,
                        child: Container(
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 0.0),
                          color: Colors.orange,
                        ),
                      ),
                      Expanded(
                        flex: 100-percent,
                        child: Container(
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 0.0),
                          color: Color(0xFFE8E8E8),
                        ),
                      ),
                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${project.duration} วัน', style: descriptionStyle),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 14.0),
                          Text('${project.doneteCount}', style: descriptionStyle),
                        ],
                      ),
                      //Text('$percentText%', style: descriptionstyle),
                    ],
                  )
                ],
              ),
            ),
          ); //แบบยาว
          //return Text(projects[index].title); แบบสั้น
        },
      ),
    );
  }
}
