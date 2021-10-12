import 'package:flutter/material.dart';
import 'package:maitexatest/ui/homeScreen.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as HomePage;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail List",
          style: TextStyle(color: Colors.purple),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        centerTitle: true,

      ),
      body:ListView(
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            padding: EdgeInsets.only(top: 20,bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Center(child:
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(args.userListDetailsModel!.avatar.toString()),
                          fit: BoxFit.fill
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100)),

                ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 50,right: 50),
                    width: size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Name :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            Text("   "+args.userListDetailsModel!.firstName.toString(),style: TextStyle(fontSize: 15,),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Last Name :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            Text("   "+args.userListDetailsModel!.lastName.toString(),style: TextStyle(fontSize: 15,),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Email :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            Text("   "+args.userListDetailsModel!.email.toString(),style: TextStyle(fontSize: 15,),),
                          ],
                        )

                      ],
                    ),
                  ),
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}
