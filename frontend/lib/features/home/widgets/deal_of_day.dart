import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({
    Key ? key
  }): super(key: key);

  @override
  State < DealOfDay > createState() => _DealOfDayState();
}

class _DealOfDayState extends State < DealOfDay > {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the day',
              style: TextStyle(fontSize: 20),
            ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1655665914248-08fec013714f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1OHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, ),
            child: const Text('\$100', style: const TextStyle(fontSize: 18), ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            child: const Text(
              'Enes',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https://images.unsplash.com/photo-1656229818787-7d5a3b3cab6a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2MHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60', fit: BoxFit.fitWidth, width: 100, height: 100, ),
              Image.network('https://images.unsplash.com/photo-1656229818787-7d5a3b3cab6a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2MHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60', fit: BoxFit.fitWidth, width: 100, height: 100, ),
              Image.network('https://images.unsplash.com/photo-1656229818787-7d5a3b3cab6a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2MHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60', fit: BoxFit.fitWidth, width: 100, height: 100, ),
              Image.network('https://images.unsplash.com/photo-1656229818787-7d5a3b3cab6a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2MHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60', fit: BoxFit.fitWidth, width: 100, height: 100, ),
            ],
          ),
        ),
        Container(
          //^ ----- new ----- padding style 
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text('See all deals', style: TextStyle(color: Colors.cyan[800]),),
        ),
      ],
    );
  }
}