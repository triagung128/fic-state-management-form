import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LtfmFilterBottomSheetView extends StatefulWidget {
  const LtfmFilterBottomSheetView({Key? key}) : super(key: key);

  Widget build(context, LtfmFilterBottomSheetController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmFilterBottomSheet"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.tune),
                label: const Text("Filter"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () async {
                  await showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Wrap(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  //! 1. Buat datepicker:
                                  //? datepicker: "From"
                                  //? datepicker: "To"
                                  //! 2. Buat tombol dengan label "FILTER"
                                  //! 3. Ketika di klik, panggil Navigator.pop(context)
                                  InkWell(
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      );
                                      print("pickedDate: $pickedDate");
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate!);
                                      controller.setState(() {
                                        controller.fromFilterController.text =
                                            formattedDate;
                                      });
                                    },
                                    child: TextFormField(
                                      controller:
                                          controller.fromFilterController,
                                      enabled: false,
                                      decoration: const InputDecoration(
                                        labelText: 'from',
                                        suffixIcon: Icon(Icons.date_range),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      );
                                      print("pickedDate: $pickedDate");
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate!);
                                      controller.setState(() {
                                        controller.toFilterController.text =
                                            formattedDate;
                                      });
                                    },
                                    child: TextFormField(
                                      controller: controller.toFilterController,
                                      enabled: false,
                                      decoration: const InputDecoration(
                                        labelText: 'to',
                                        suffixIcon: Icon(Icons.date_range),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('FILTER'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtfmFilterBottomSheetView> createState() =>
      LtfmFilterBottomSheetController();
}
