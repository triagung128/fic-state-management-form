import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LtfmSlidingFormView extends StatefulWidget {
  const LtfmSlidingFormView({Key? key}) : super(key: key);

  Widget build(context, LtfmSlidingFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmSlidingForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 900),
                width: controller.submitted
                    ? 160
                    : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "Apply Leave",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //! 1. buat datepicker, atur label-nya menjadi
                      //? "Leave Date"

                      //! 2. Buat textarea, atur label-nya menjadi
                      //? "Reason"

                      //! 3. Tambahkan Divider

                      //! 4. Buat sebuah tombol:
                      //? width: MediaQuery.of(context).size.width,
                      //? height: 40

                      //! 5. Ketika di klik, tambahkan kode ini:
                      /*
                        controller.submitted = !controller.submitted;
                        controller.update();
                      */

                      //! 6. Jika Container mengecil ketika tombol di klik
                      //? maka task ini selesai!
                      InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          print("pickedDate: $pickedDate");
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate!);
                          controller.setState(() {
                            controller.fromFilterController.text =
                                formattedDate;
                          });
                        },
                        child: TextFormField(
                          controller: controller.fromFilterController,
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Leave Data',
                            suffixIcon: Icon(Icons.date_range),
                          ),
                        ),
                      ),
                      TextFormField(
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Reason',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Your reason",
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 1),
                      ElevatedButton(
                        onPressed: () {
                          controller.submitted = !controller.submitted;
                          controller.update();
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtfmSlidingFormView> createState() => LtfmSlidingFormController();
}
