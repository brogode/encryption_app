import 'package:flutter/material.dart';
import 'encryption_app.dart';

final keygenarate = keygenarater();
final fileEncryption = FileEncryption();


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  String keyField = '';
  //final value = keygenarate.generateRandomKey();
  final value = 'abcdefghijklmnop';

  void updateTextField() {
    setState(() {
      keyField = value;
    });
  }
  //////////////////////////////////////////
  String fileFieldValue = '';
  String keyFieldValue = '';
  String errorMessage = '';
  String newFieldValue = '';
  final ivString = 'qrstuvwxzy123456';

  void validateEncryption() {
    if (fileFieldValue.isEmpty & keyFieldValue.isEmpty & newFieldValue.isEmpty) {
      setState(() {
        errorMessage = 'Text Field is empty!';
      });
    } else {
      setState(() {
        errorMessage = 'encryption Process complete';
      });
      fileEncryption.encryptFile(fileFieldValue, newFieldValue, keyFieldValue, ivString);
      
    }
  }

  void validatedencryption() {
    if (fileFieldValue.isEmpty & keyFieldValue.isEmpty & newFieldValue.isEmpty) {
      setState(() {
        errorMessage = 'Text Field is empty!';
      });
    } else {
      setState(() {
        errorMessage = 'decryption Process complete';
      });
      fileEncryption.decryptFile(fileFieldValue, newFieldValue, keyFieldValue, ivString);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 131, 91, 5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 25.0),
          child: Icon(Icons.person),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 39, 32, 17),
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: ''
        ),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),
        label: ''
        ),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "What would like to do today:",
            style: TextStyle(
              fontSize: 36,
            ),
          ),
          ),
        SizedBox(height: 40,),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            onChanged: (value) {
                setState(() {
                  keyFieldValue = value;
                });
              },
            controller: TextEditingController(text: keyField),
            decoration: InputDecoration(

              hintText: 'Enter or genarate the key......',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
          ),
          ),
          SizedBox(height: 40,),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            onChanged: (value) {
                setState(() {
                  fileFieldValue = value;
                });
              },
            decoration: InputDecoration(
              hintText: 'Enter file name......',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
          ),
          ),

          SizedBox(height: 40,),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            onChanged: (value) {
                setState(() {
                  newFieldValue = value;
                });
              },
            decoration: InputDecoration(
              hintText: 'Enter the name you want to give to the new file...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
          ),
          ),

        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(top: 50, right: 3),
                  child: ElevatedButton(
                    //color: Color.fromARGB(255, 201, 151, 44),
                    child: Text('Decrypt',style: TextStyle(fontSize: 20),),
                    onPressed: () {
                      validatedencryption();
                      },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 3),
                  child: ElevatedButton(
                    //color: Color.fromARGB(255, 201, 151, 44),
                    child: Text('Encrypt',style: TextStyle(fontSize: 20),),
                    onPressed: () {
                      validateEncryption();
                    },
                  ),
                ),
              ],
          ),

        SizedBox(height: 0,),

        Padding(
                  padding: EdgeInsets.only(top: 50, right: 3),
                  child: ElevatedButton(
                    //color: Color.fromARGB(255, 201, 151, 44),
                    child: Text('Genarate key',
                    style: TextStyle(fontSize: 20),),
                    onPressed: () {
                      updateTextField();                    },
                  ),
                ),

                SizedBox(height: 40,),

                Text(
              errorMessage,
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
                ),
      ]),
    );
  }
}