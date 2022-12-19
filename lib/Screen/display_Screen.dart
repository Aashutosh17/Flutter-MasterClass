import 'package:flutter/material.dart';

import '../model/student.dart';

class Displaystudentscreen extends StatefulWidget {
  const Displaystudentscreen({super.key});

  @override
  State<Displaystudentscreen> createState() => _DisplaystudentscreenState();
}

class _DisplaystudentscreenState extends State<Displaystudentscreen> {
  List<Student> lstStudent = [];

  @override
  void didChangeDependencies() {
    lstStudent = ModalRoute.of(context)!.settings.arguments as List<Student>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: lstStudent.isNotEmpty
          ? ListView.builder(
              itemCount: lstStudent.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(lstStudent[index].fname!),
                  subtitle: Text(lstStudent[index].address!),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            // Delete student
                            lstStudent.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text('No Data'),
            ),
    );
  }
}
