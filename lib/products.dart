import 'package:flutter/material.dart';

import './pages/product.dart';

class Products extends StatelessWidget{
  final List<String> products;
  Products(this.products){
    print('[Product StateleesWidget] constructor');
  }

  Widget _buildProductItems(BuildContext context, int index){
   return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      BuildContext context) => ProductPage(),
                    ),
                )
              )
            ],
          )
        ],
      ),
    );
}

  @override
  Widget build(BuildContext context){
    print('[Product StateleesWidget] build');
    return products.length > 0 ? ListView.builder(
      itemBuilder: _buildProductItems,
      itemCount: products.length,
    ) : Center(child: Text('empty product now, please press the add product button~'));
  }
}