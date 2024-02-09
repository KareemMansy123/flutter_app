import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Textfield 1',
              ),
            ),
            const SizedBox(height: 10), // Provides space between the widgets
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Textfield 2',
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true, // Needed to use ListView inside Column
              physics: const NeverScrollableScrollPhysics(), // to disable ListView's scrolling
              itemCount: 5, // Number of items in the list
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  child: ListTile(
                    title: Text('List 1 Item $index'),
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5, // Number of items in the list
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                  ),
                  child: ListTile(
                    title: Text('List 2 Item $index'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

