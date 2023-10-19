import 'package:flutter/material.dart';
import 'package:todo_app/model/data_model.dart';

import '../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "To-Do",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                icon: Icon(
                  isGrid ? Icons.grid_view : Icons.list,
                  color: Colors.black,
                )),
          ],
        ),
        body: isGrid
            ? ListView.builder(
                itemExtent: 150,
                itemCount: Global.g1.dataList.length,
                itemBuilder: (context, index) {
                  dataModel data = Global.g1.dataList[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onDoubleTap: () {
                        setState(() {
                          Global.g1.dataList.removeAt(index);
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              dataModel d1 = Global.g1.dataList[index];
                              txtTitle.text = d1.title!;
                              txtDesc.text = d1.desc!;
                              return updialog(index);
                            },
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 3,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Title : ${data.title}",
                                    style: const TextStyle(fontSize: 20),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Descripition : ${data.desc}",
                                    style: const TextStyle(fontSize: 20),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: Global.g1.dataList.length,
                itemBuilder: (context, index) {
                  dataModel data = Global.g1.dataList[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onDoubleTap: () {
                        setState(() {
                          Global.g1.dataList.removeAt(index);
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              dataModel d1 = Global.g1.dataList[index];
                              txtTitle.text = d1.title!;
                              txtDesc.text = d1.desc!;
                              return updialog(index);
                            },
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 3,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Title : ${data.title}",
                                    style: const TextStyle(fontSize: 20),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Descripition : ${data.desc}",
                                    style: const TextStyle(fontSize: 20),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {},
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'data').then((value) {
                  setState(() {});
                });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            )),
      ),
    );
  }

  AlertDialog updialog(int index) {
    return AlertDialog(
      actions: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Edit to data ",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: txtTitle,
          decoration: InputDecoration(
            hintText: "Title",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: txtDesc,
          decoration: InputDecoration(
            hintText: "Description",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                Global.g1.dataList[index] = dataModel(
                  title: txtTitle.text,
                  desc: txtDesc.text,
                );
              });
              Navigator.pop(context);
            },
            child: const Text(
              "Ok",
              style: TextStyle(fontSize: 20, color: Colors.black),
            )),
      ],
    );
  }
}
