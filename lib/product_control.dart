import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget{
  final Function addProduct;
  ProductControl(this.addProduct);
  //this argument is passing down by productManagerState
  //and it is a syntext shortcut for addProduct = this.addProduct 
  //and this.addproduct is represent for _addProduct the argument passed from productManagerState

  @override
  Widget build(BuildContext context){
    return RaisedButton(
          onPressed: () {
            addProduct('sweet treats');
          }, 
        child: Text('Add Product'));
  }
}