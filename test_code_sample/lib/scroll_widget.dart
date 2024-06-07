import 'package:flutter/material.dart';

class ScrollWidget extends StatefulWidget {
  const ScrollWidget({super.key});

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  final List<String> _items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Scroll Widget",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            child: ListTile(
              title: Text(_items[index]),
              onTap: () {
                setState(() {
                  _items.insert(0, _items.removeAt(index));
                });
              },
            ),
          );
        },
      ),
    );
  }
}
