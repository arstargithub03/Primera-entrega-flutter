import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../services/tourists_services.dart';


class TouristDetailView extends StatefulWidget {

  static const name = 'touristbyid-view';
  final int touristId;

  const TouristDetailView({
    super.key, 
    required this.touristId
  });

  @override
  State<TouristDetailView> createState() => _TouristDetailViewState();
}

class _TouristDetailViewState extends State<TouristDetailView> {


  Map<String, dynamic> _touristData = {};


  @override
    void initState() {
    super.initState();
    getTouristById(widget.touristId)
      .then((data) {
        setState(() {
         _touristData = data;
        });
      }
    ).catchError((error) {
      //TODO: handle error
    });
  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('HEIGHTS'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.menu)
          )
        ],
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: _touristData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.blue.shade900],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Column(
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 15.0, bottom: 10.0),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,),
                            onPressed: () {
                            context.go('/home/1');
                          }),
                          const Text('ROUTER', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          const Text('Setting', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ]
                                       ),
                     ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        CustomCard(title: 'ID:'  ,touristData: _touristData['id'].toString()),
                        CustomCard(title: 'NAME:'  ,touristData: _touristData['tourist_name']),
                        CustomCard(title: 'EMAIL:'  ,touristData: _touristData['tourist_email']),
                        CustomCard(title: 'LOCATION:'  ,touristData: _touristData['tourist_location']),
                        CustomCard(title: 'CREATEDAT:'  ,touristData: _touristData['createdat']),
                      ],
                    )
                  ],
                ) 
              ),
          ),
      );
  }
}

class CustomCard extends StatelessWidget {
  
  final String _touristData;
  final String _title;

  const CustomCard({
    super.key,
    required String touristData, 
    required String title,
  }) : _touristData = touristData, _title = title;
    

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,                        
      elevation: 1,
      child: 
      ListTile(
        title: Text(
          _title, 
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
        ),
        subtitle: Text(
          _touristData,
          style: const TextStyle(
            color: Colors.white
          ),
        ),
      ),
    
    );
  }
}