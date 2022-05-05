import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/widgets/dialog_item_widget.dart';

class UploadProductScreen extends StatelessWidget {
  const UploadProductScreen({Key? key}) : super(key: key);
  static const routeName = '/uplaodProduct';
  static final List<String> brands = [
    'Addidass',
    'Apple',
    'Dell',
    'H&M',
    'Nike',
    'Samsung',
    'Huawei'
  ];
  static final List<String> categories = [
    'Phones',
    'Clothes',
    'Beauty & Health',
    'Shoes',
    'Furniture',
    'Watches',
  ];
  @override
  Widget build(BuildContext context) {
    const borderSide = BorderSide(
      color: Colors.grey,
      width: 2,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Product Name',
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Price \$',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.transparent),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          // width: 200,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: borderSide,
                              left: borderSide,
                              right: borderSide,
                              top: borderSide,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            DialogItemWidget(
                              icon: Icons.camera,
                              title: 'Camera',
                              color: ConstColors.starterColor,
                            ),
                            DialogItemWidget(
                              icon: Icons.photo_library_outlined,
                              title: 'Gallery',
                              color: ConstColors.starterColor,
                            ),
                            const DialogItemWidget(
                              icon: Icons.clear,
                              title: 'Remove',
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Add a new Category',
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                              value: 'String1',
                              child: Text('Mobile1'),
                            ),
                            DropdownMenuItem(
                              value: 'String2',
                              child: Text('Mobile2'),
                            ),
                            DropdownMenuItem(
                              value: 'String3',
                              child: Text('Mobile3'),
                            ),
                          ],
                          onChanged: (Object? value) {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Brand',
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                              value: 'String1',
                              child: Text('Mobile1'),
                            ),
                            DropdownMenuItem(
                              value: 'String2',
                              child: Text('Mobile2'),
                            ),
                            DropdownMenuItem(
                              value: 'String3',
                              child: Text('Mobile3'),
                            ),
                          ],
                          onChanged: (Object? value) {},
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.transparent),
                  Expanded(
                    child: TextFormField(
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Description',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            // color: Colors.red,
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Upload'),
                Icon(Icons.upload),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
