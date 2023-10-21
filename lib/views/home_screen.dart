
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30,),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20)
            ),
            child: ListTile(
              leading: Icon(Icons.person,color: Colors.red,size: 40,),
              title: Text("name"),
              subtitle: Text("write ur name"),
              trailing: Icon(Icons.favorite,color: Colors.red,size: 40,),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon((Icons.home),size: 40,),
              Icon((Icons.favorite),size: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
