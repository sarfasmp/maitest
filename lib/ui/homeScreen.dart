import 'package:flutter/material.dart';
import 'package:maitexatest/apiModel/userListModel.dart';
import 'package:maitexatest/provider/userListPro.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  UserListDetailsModel? userListDetailsModel;

  HomePage({this.userListDetailsModel});

  @override
  Widget build(BuildContext context) {
    var userPro =Provider.of<UserListProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "User List",
            style: TextStyle(color: Colors.purple),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          centerTitle: true,
        ),
        body: DefaultTabController(
          length: 2,
              child: Column(
                children: [
                  SizedBox(height: 10,),

                  TabBar(
                    overlayColor: MaterialStateProperty.all(Colors.black),
                    tabs: [
                      Tab(child: Text("Users List 1",style: TextStyle(color: Colors.black),),),
                      Tab(child: Text("Users List 2",style: TextStyle(color: Colors.black),),),

                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                        children: [

                          FutureBuilder(
                              future: userPro.fetchUserDetails(pageNumber: 1),
                              builder: (context,snapshot){
                                if(!snapshot.hasData){
                                  return  Center(child: CircularProgressIndicator());
                                }
                                else{
                                  List<UserListDetailsModel> detailList=snapshot.data as List<UserListDetailsModel>;
                                  return
                                    ListView(
                                      children: detailList.asMap().entries.map((e) => Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: ListTile(
                                          onTap: (){
                                            Navigator.pushNamed(context, '/detailScreen',
                                              arguments: HomePage(userListDetailsModel: detailList[e.key],)

                                            );
                                          },
                                          leading: CircleAvatar(radius: 35,child: Image.network(e.value.avatar.toString()),),
                                          title: Text(e.value.firstName.toString()),
                                          subtitle: Text(e.value.email.toString()),

                                        ),
                                      ),

                                      ).toList(),



                                    );
                                }


                          }),

                          FutureBuilder(
                              future: userPro.fetchUserDetails(pageNumber: 2),
                              builder: (context,snapshot){
                                if(!snapshot.hasData){
                                  return  Center(child: CircularProgressIndicator());
                                }
                                else{
                                  List<UserListDetailsModel> detailList=snapshot.data as List<UserListDetailsModel>;
                                  return
                                    ListView(
                                      children: detailList.asMap().entries.map((e) => Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: ListTile(
                                          onTap: (){
                                            Navigator.pushNamed(context, '/detailScreen',
                                                arguments: HomePage(userListDetailsModel: detailList[e.key],)

                                            );
                                          },
                                          leading: CircleAvatar(radius: 35,child: Image.network(e.value.avatar.toString()),),
                                          title: Text(e.value.firstName.toString()),
                                          subtitle: Text(e.value.email.toString()),

                                        ),
                                      ),

                                      ).toList(),



                                    );
                                }


                              }),


                        ]
                    ),
                  )
                ],
              ),
            ),


    );
  }
}
