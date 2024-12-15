import "package:flutter/material.dart";


class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
  late AnimationController controller;
  final List<String> _items = [];
  GlobalKey<AnimatedListState> key = GlobalKey();
  TextEditingController? textEditingController;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    textEditingController!.dispose();
    super.dispose();
  }

  void _addItem() {
    _items.insert(0, textEditingController!.text);
    key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem(int index) {
    key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.red,
                child: ListTile(
                  title: Text(
                    "Deleted",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
        duration: const Duration(seconds:1));
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    hintText: "add a task",
                    hintStyle: const TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _addItem();
                    textEditingController!.text = "";
                  },
                  child: const Text("+ add"))
            ],
          ),
          SizedBox(
            height: 500,
            child: AnimatedList(
              key: key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Dismissible(
                    key: UniqueKey(),
                    background: SizedBox(height: 50,child: Container(color: Colors.red,),),
                    secondaryBackground: SizedBox(height: 50,child: Container(color: Colors.red,),),
                    direction: DismissDirection.endToStart,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: Colors.orangeAccent,
                      child: ListTile(
                        title: Text(_items[index]),
                        trailing: IconButton(
                            onPressed: () {
                              _removeItem(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
