// accordion.dart
import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String content;

  const Accordion({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  // Show or hide the content
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      child: Column(children: [
        // The title
        ListTile(
          onTap: () {
            setState(() {
              _showContent = !_showContent;
            });
          },
          title: Text(
            widget.title.toUpperCase(),
          ),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        // Show or hide the content based on the state
        _showContent
            ? Container(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Text(
                  widget.content.trim(),
                  style: TextStyle(fontSize: 16),
                ),
              )
            : Container()
      ]),
    );
  }
}
