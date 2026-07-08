import 'package:flutter/material.dart';
import 'package:flutter_16/module_17/CRUD/controller/product_controller.dart';
import 'package:flutter_16/module_17/CRUD/model/product_model.dart';
class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  ProductController productController = ProductController();


  Future fetchData() async {
    await productController.getProduct();

    setState(() {

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  
  
  productDialog(bool isUpdate, {Data? data}){
    TextEditingController productNameController = TextEditingController();
    TextEditingController productIMGController = TextEditingController();
    TextEditingController productQTYController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();
    

    if(isUpdate){
      productNameController.text = data!.productName.toString();
      productIMGController.text = data.img.toString();
      productQTYController.text = data.qty.toString();
      productUnitPriceController.text = data.unitPrice.toString();
      productTotalPriceController.text = data.totalPrice.toString();
    }

    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(isUpdate ? 'Edit product' : 'Create Product'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: productNameController,
            decoration: InputDecoration(
              labelText: 'Name'
            ),
          ),

          SizedBox(height: 10,),

          TextField(
            controller: productIMGController,
            decoration: InputDecoration(
                labelText: 'Image'
            ),
          ),

          SizedBox(height: 10,),

          TextField(
            controller: productQTYController,
            decoration: InputDecoration(
                labelText: 'QTY'
            ),
          ),

          SizedBox(height: 10,),

          TextField(
            controller: productUnitPriceController,
            decoration: InputDecoration(
                labelText: 'Unit price'
            ),
          ),

          SizedBox(height: 10,),


          TextField(
            controller: productTotalPriceController,
            decoration: InputDecoration(
                labelText: 'Total price'
            ),
          ),



          SizedBox(height: 10,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancle')),
              
              ElevatedButton(onPressed: () async {


                if(isUpdate){
                  productController.updateProduct( data!.sId.toString(), Data(
                      productName: productNameController.text,
                      img: productIMGController.text,
                      qty: int.parse(productQTYController.text),
                      unitPrice: int.parse(productUnitPriceController.text),
                      totalPrice: int.parse(productTotalPriceController.text)
                  ));

                  await fetchData();
                }else{
                  productController.createProduct(Data(
                      productName: productNameController.text,
                      img: productIMGController.text,
                      qty: int.parse(productQTYController.text),
                      unitPrice: int.parse(productUnitPriceController.text),
                      totalPrice: int.parse(productTotalPriceController.text)
                  ));
                }






                await fetchData();
                Navigator.pop(context);
              }, child: Text('Submit'))
            ],
          )
          

        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product list'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 0.85
          ),
          itemCount: productController.products.length,
          itemBuilder: (context,index){
            final item = productController.products[index];
            return Column(
            children: [
              SizedBox(
                  height: 140,
                  child: Image.network(item.img.toString())),

              Text(item.productName.toString(), style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

              Text('Price: ${item.totalPrice}'),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  IconButton(onPressed: (){
                    productDialog(true,data: item);
                  }, icon: Icon(Icons.edit_note,color: Colors.orange,),),
                  IconButton(onPressed: (){
                    productController.deleteProduct(item.sId.toString()).then((value) async {
                      if(value){
                       await fetchData();
                      ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('Product deleted'))
                      );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('something wrong try again'))
                        );
                      }
                    });

                  }, icon: Icon(Icons.delete,color: Colors.red,),)
                ],
              )



            ],
            );

          }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        productDialog(false);
      }, child: Icon(Icons.add),),
    );
  }
}
