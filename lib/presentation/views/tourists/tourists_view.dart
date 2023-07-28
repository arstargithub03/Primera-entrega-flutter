import 'package:flutter/material.dart';
import 'package:flutter_lu/services/tourists_services.dart';
import 'package:go_router/go_router.dart';

class TouristsView extends StatefulWidget {

  static const name = 'tourists-view';
  const TouristsView({super.key});

  @override
  State<TouristsView> createState() => _TouristsViewState();
}

class _TouristsViewState extends State<TouristsView> {

  List<Map<String, dynamic>> _data = [];


  @override
    void initState() {
    super.initState();
    getAllTourists()
      .then((data) {
        setState(() {
         _data = data;
        });
      }
    ).catchError((error) {
      //TODO: handle error
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: ListView.builder(
                itemCount: _data.length,

                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    color: Colors.blue,
                    
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Tourist Name: ${_data[index]['tourist_name']}')
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios_sharp),
                              onPressed: () {
                                context.go('/tourists/detail/${_data[index]['id']}');
                              },
                            ),
                          ),
                        ],
                      ),
                      
                    ),

                  );
                },
              ),
            
          ),
    ); 
  }
}