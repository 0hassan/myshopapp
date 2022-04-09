import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/EditProgramScreen';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Products',
          style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontFamily: 'Lato-Regular'),
        ),
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
