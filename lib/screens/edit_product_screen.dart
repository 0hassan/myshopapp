import 'package:flutter/material.dart';
import 'package:myshopapp/providers/main_products_modal.dart';
import 'package:myshopapp/providers/products_provider.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/EditProgramScreen';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _imageurlFocusNode = FocusNode();
  final _imageurlcontroler = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct = MainProductModal(
    description: '',
    id: '',
    imgUrl: '',
    price: 0,
    title: '',
  );

  @override
  void initState() {
    _imageurlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  var isInit = true;
  var initValues = {
    'title': '',
    'price': '',
    'description': '',
    'imageURL': '',
  };
  var productId = '';
  @override
  void didChangeDependencies() {
    if (isInit) {
      productId = ModalRoute.of(context)?.settings.arguments as String;
      if (productId != '') {
        _editedProduct =
            Provider.of<ProductsProvider>(context).findById(productId);
        initValues = {
          'title': _editedProduct.title,
          'price': _editedProduct.price.toString(),
          'description': _editedProduct.description,
          // 'imageURL': _editedProduct.imgUrl,
          'imageURL': '',
        };
        _imageurlcontroler.text = _editedProduct.imgUrl;
      }
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageurlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _imageurlFocusNode.dispose();
    _imageurlcontroler.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if ((!_imageurlcontroler.text.startsWith('http') &&
            !_imageurlcontroler.text.startsWith('https')) ||
        ((!_imageurlcontroler.text.endsWith('.png')) &&
            (!_imageurlcontroler.text.endsWith('.jpg')) &&
            (!_imageurlcontroler.text.endsWith('.jpeg')))) {
      return;
    }
    if (!_imageurlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState!.save();
    if (_editedProduct.id != '') {
      Provider.of<ProductsProvider>(context, listen: false)
          .editProduct(productId, _editedProduct);
    } else {
      Provider.of<ProductsProvider>(context, listen: false)
          .addProduct(_editedProduct);
    }
    Navigator.of(context).pop();
  }

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
        actions: [
          IconButton(
              onPressed: () {
                _saveForm();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter The Title';
                } else {
                  return null;
                }
              },
              initialValue: initValues['title'],
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              onSaved: (vlaue) {
                _editedProduct = MainProductModal(
                  description: _editedProduct.description,
                  id: _editedProduct.id,
                  imgUrl: _editedProduct.imgUrl,
                  price: _editedProduct.price,
                  title: vlaue.toString(),
                );
              },
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter The Price';
                } else if (double.tryParse(value.toString()) == null) {
                  return 'Invalid Input!';
                }
                return null;
              },
              initialValue: initValues['price'],
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
              onSaved: (vlaue) {
                _editedProduct = MainProductModal(
                  description: _editedProduct.description,
                  id: _editedProduct.id,
                  imgUrl: _editedProduct.imgUrl,
                  price: double.parse(vlaue.toString()),
                  title: _editedProduct.title,
                );
              },
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter The Description!';
                } else if (value.characters.length < 10) {
                  return 'Description should not be less then 10 Chracters.';
                } else {
                  return null;
                }
              },
              initialValue: initValues['description'],
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              // textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              onSaved: (vlaue) {
                _editedProduct = MainProductModal(
                  description: vlaue.toString(),
                  id: _editedProduct.id,
                  imgUrl: _editedProduct.imgUrl,
                  price: _editedProduct.price,
                  title: _editedProduct.title,
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                    right: 10,
                    left: 4,
                  ),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: _imageurlcontroler.text.isEmpty
                      ? const Text('Énter a URL.')
                      : Image.network(
                          _imageurlcontroler.text,
                          fit: BoxFit.cover,
                        ),
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Image URL is required';
                      } else if ((!value.startsWith('http') &&
                              !value.startsWith('https')) ||
                          ((!value.endsWith('.png')) &&
                              (!value.endsWith('.jpg')) &&
                              (!value.endsWith('.jpeg')))) {
                        return 'Invalid URL';
                      } else {
                        return null;
                      }
                    },
                    // initialValue: initValues['imageURL'],
                    decoration: const InputDecoration(
                      labelText: 'Image URL',
                    ),
                    controller: _imageurlcontroler,
                    focusNode: _imageurlFocusNode,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      _saveForm();
                    },
                    onSaved: (vlaue) {
                      _editedProduct = MainProductModal(
                        description: _editedProduct.description,
                        id: _editedProduct.id,
                        imgUrl: vlaue.toString(),
                        price: _editedProduct.price,
                        title: _editedProduct.title,
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
