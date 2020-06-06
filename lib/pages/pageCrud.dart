import 'package:flutter/material.dart';
import 'package:flutterimplement/add_editclient.dart';
import 'package:flutterimplement/db/database.dart';
import 'package:flutterimplement/model/client_model.dart';


class PageCrud extends StatefulWidget {
  @override
  _PageCrudState createState() => _PageCrudState();
}


class _PageCrudState extends State<PageCrud> {
  @override
  void didUpdateWidget(PageCrud oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        
        title: Text("CRUD"),
        
        actions: <Widget>[
          RaisedButton(
            color: Theme.of(context).splashColor,
            onPressed: (){
              ClientDatabaseProvider.db.deleteAllClient();
              setState(() { 
              });
            },
            child: Text('Borrar Todo',
              style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Colors.black
             )
            ),
          )
        ],
      ),
      body: 
      FutureBuilder<List<Client>>(
        //we call the method, which is in the folder db file database.dart 
        future: ClientDatabaseProvider.db.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              //Count all records
              itemCount: snapshot.data.length,
              //all the records that are in the client table are passed to an item Client item = snapshot.data [index];
              itemBuilder: (BuildContext context, int index){
                Client item = snapshot.data[index];
                //delete one register for id
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (diretion) {
                    ClientDatabaseProvider.db.deleteClientWithId(item.id);
                  },
                  //Now we paint the list with all the records, which will have a number, name, phone
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.phone),
                    leading: CircleAvatar(child: Text(item.id.toString())),
                    //If we press one of the cards, it takes us to the page to edit, with the data onTap:
                    //This method is in the file add_editclient.dart
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddEditClient(
                          true,
                          //Here is the record that we want to edit
                          client: item,                          
                        )                        
                      )
                      );
                    },
                  ),
                );
              },
            );
          }else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      //This button takes us to the method add new register, which is in the file add_editclient.dart
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEditClient(false)));
        },
      ),
    );
  }
}