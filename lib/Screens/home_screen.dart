import 'package:e_online_shop/Model/model.dart';
import 'package:flutter/material.dart';

import '../Services/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productModel = [];
  bool isLoaded = false;

  getMyProduct() {
    isLoaded = true;
    getProducts().then((value) {
      setState(() {
        productModel = value;
        isLoaded = false;
      });
    });
  }

  @override
  void initState() {
    getMyProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Online Shop"),
      ),
      body: isLoaded
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemCount: productModel.length,
              itemBuilder: (context, index) {
                final apiProduct = productModel[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(apiProduct.title),
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}

