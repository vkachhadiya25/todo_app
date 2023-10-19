import 'package:flutter/material.dart';
import 'package:todo_app/model/data_model.dart';

import '../utils/global.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDesc = TextEditingController();

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
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Add To - Do",
                    style: TextStyle(fontSize: 22),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Priority",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Low",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Medium",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "High",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Upgread",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: txtTitle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: const Text(
                    "Title",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: txtDesc,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: const Text(
                    "Descripition",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            dataModel data = dataModel(
              title: txtTitle.text,
              desc: txtDesc.text,
            );
            Global.g1.dataList.add(data);
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.save,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
