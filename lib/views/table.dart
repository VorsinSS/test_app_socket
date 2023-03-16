import 'package:flutter/material.dart';
import 'package:test_app_socket/repo/repository.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(50),
              1: FlexColumnWidth(50),
              2: FlexColumnWidth(50),
            },
            border: TableBorder.all(
                color: Colors.black, style: BorderStyle.solid, width: 1),
            children: [
              TableRow(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 73, 38, 125),
                  ),
                  children: [
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                        child: Text(
                          'A',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                        child: Text(
                          'B',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                        child: Text(
                          'C',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ]),
                  ]),
              TableRow(children: [
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ]),
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ]),
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ]),
              ]),
              TableRow(children: [
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ]),
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ]),
              ]),
              TableRow(children: [
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ]),
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ]),
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ]),
              ]),
            ],
          ),
          const SizedBox(height: 5),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: _sendMessage,
            child: const Text('Отправить'),
          ),
          StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              return Text(snapshot.hasData ? '${snapshot.data}' : '');
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    _controller.dispose();

    super.dispose();
  }
}
