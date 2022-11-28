import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LtfmProductFormView extends StatefulWidget {
  const LtfmProductFormView({Key? key}) : super(key: key);

  Widget build(context, LtfmProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmProductForm"),
        actions: const [
          //! 5. Tambahkan tombol Save
          //! 6. Beri padding/margin pada tombol Save sebanyak 10
          //! 7. Panggil controller.save() ketika tombol di klik
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //! 1. Buat sebuah Card, tambahkan Column di dalamnya
              //! 2. Tambahkan padding.all 20.0
              //! 3. Di dalam column yang ada di dalam Card, tambahkan field ini:
              //? textfield product name
              //? textfield price (hanya bisa menerima angka)
              //? textfield description (textfield dengan maxlines: 15)
              //! 4. Tambahkan dropdown untuk memilih category, gunakan kode ini:
              /*
              QDropdownField(
                label: "Category",
                hint: "Your product category",
                validator: Validator.required,
                items: const [
                  {
                    "label": "Food",
                    "value": 1,
                  },
                  {
                    "label": "Drink",
                    "value": 2,
                  },
                  {
                    "label": "Main Course",
                    "value": 3,
                  }
                ],
                onChanged: (value, label) {},
              ),
              */
              //! 5. Tambahkan radio untuk menentukan status product, gunakan kode ini:
              /*
              QRadioField(
                label: "Status",
                validator: Validator.atLeastOneitem,
                items: const [
                  {
                    "label": "Published",
                    "value": "published",
                  },
                  {
                    "label": "Draft",
                    "value": "draft",
                  }
                ],
                onChanged: (value, label) {},
              ),
             */
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Product Name',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "What's your product name?",
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Price',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Price your product?",
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        maxLines: 15,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Your product description",
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 8),
                      QDropdownField(
                        label: "Category",
                        hint: "Your product category",
                        validator: Validator.required,
                        items: const [
                          {
                            "label": "Food",
                            "value": 1,
                          },
                          {
                            "label": "Drink",
                            "value": 2,
                          },
                          {
                            "label": "Main Course",
                            "value": 3,
                          }
                        ],
                        onChanged: (value, label) {},
                      ),
                      const SizedBox(height: 8),
                      QRadioField(
                        label: "Status",
                        validator: Validator.atLeastOneitem,
                        items: const [
                          {
                            "label": "Published",
                            "value": "published",
                          },
                          {
                            "label": "Draft",
                            "value": "draft",
                          }
                        ],
                        onChanged: (value, label) {},
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
  State<LtfmProductFormView> createState() => LtfmProductFormController();
}
