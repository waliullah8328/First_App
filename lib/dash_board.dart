import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("DashBoard"),
        centerTitle: true,
      ),
      body: const Text("Hello"),

      drawer: Drawer(
        child: ListView(
          children:  [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Drawer Header")),
            const ListTile(

              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            const ListTile(

              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
            const ListTile(

              leading: Icon(Icons.help),
              title: Text("Help"),
            ),
            const SizedBox(height: 320,),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                TextButton.icon(onPressed: (){
                  box.remove('lastScreen');
                  SystemNavigator.pop();

                }, label: const Text("Log Out"),
                  icon: const Icon(Icons.logout),
                ),
                TextButton.icon(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Exit App?"),
                          content: const Text("Are you sure you wan to exit the app?"),
                          actions: [
                            TextButton.icon(
                              onPressed: (){
                                Navigator.pop(context);

                              },
                              icon: const Icon(Icons.cancel),
                              label: const Text("Cancel"),),
                            TextButton.icon(
                              onPressed: (){
                                SystemNavigator.pop();

                              },
                              icon: const Icon(Icons.exit_to_app),
                              label: const Text("Exit"),),
                          ],

                        );
                      },
                    );
                    //SystemNavigator.pop();

                  },
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text("Exit"),
                ),
              ],
            ),
          ],
        ),
      ),





    );
  }
}
