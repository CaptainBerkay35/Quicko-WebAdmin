import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FranchiseWidget extends StatelessWidget {
  const FranchiseWidget({Key? key}) : super(key: key);

  Widget franchiseData(int? flex,Widget widget){
    return Expanded(flex: flex!,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _franchisesStream = FirebaseFirestore.instance.collection('vendors').snapshots();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return StreamBuilder<QuerySnapshot>(
      stream: _franchisesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,index){
          final franchiseUserData = snapshot.data!.docs[index];
          return Container(
            child:Row(
              children: [
                franchiseData(1, Container(
                  height: 50,
                  width: 50,
                  child: Image.network(franchiseUserData['storeImage']),
                ),),
                franchiseData(3, Text(franchiseUserData['businessName'],style: TextStyle(fontWeight:FontWeight.bold),),),
                franchiseData(2, Text(franchiseUserData['cityValue'],style: TextStyle(fontWeight:FontWeight.bold),),),
                franchiseData(2, Text(franchiseUserData['stateValue'],style: TextStyle(fontWeight:FontWeight.bold),),),
                franchiseData(1,franchiseUserData['approved'] == false? ElevatedButton(onPressed: ()async{
                  await _firestore.collection('vendors').doc(franchiseUserData['vendorId']).update({
                    'approved' : true,
                  });
                },
                  child: Text('Approved'))
                  : ElevatedButton(onPressed: ()async{
                  await _firestore.collection('vendors').doc(franchiseUserData['vendorId']).update({
                    'approved' : false,
                  });
                }, child:Text('Reject',style: TextStyle(fontWeight:FontWeight.bold),),),),
                franchiseData(1, ElevatedButton(onPressed: (){}, child:Text('View More',style: TextStyle(fontWeight:FontWeight.bold),),),),
              ],
            ),
          );
        });
      },
    );
  }
}
