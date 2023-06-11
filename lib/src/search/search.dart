import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/materail_product/detail/product_detail.dart';
import 'package:myapp/src/materail_product/getx/controller.dart';
import 'package:myapp/src/materail_product/getx/model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ProductController productController = Get.put(ProductController());
  TextEditingController dataSearch = TextEditingController();
  final FocusNode _node = FocusNode();
  bool status = false;
  List<Product> _searchname = [];
  String nameproduct = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.grey)),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                width: MediaQuery.of(context).size.width * 0.80,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.grey.shade200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: TextFormField(
                        controller: dataSearch,
                        autofocus: true,
                        style: const TextStyle(fontSize: 16),
                        textInputAction: TextInputAction.search,
                        onFieldSubmitted: (String value) {
                          setState(() {
                            status = true;
                          });
                          nameproduct = dataSearch.text;
                          _node.unfocus();
                          if (nameproduct != '') {
                            setState(() {
                              _searchname = productController.statetList
                                  .where((element) => element.name!
                                      .toLowerCase()
                                      .contains(nameproduct.toLowerCase()))
                                  .toList();
                            });
                          } else {
                            setState(() {
                              nameproduct = '';
                            });
                          }
                          setState(() {
                            status = true;
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: 'noto_regular'),
                            border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        nameproduct = dataSearch.text;
                        _node.unfocus();
                        if (nameproduct != '') {
                          setState(() {
                            _searchname = productController.statetList
                                .where((element) => element.name!
                                    .toLowerCase()
                                    .contains(nameproduct.toLowerCase()))
                                .toList();
                          });
                        } else {
                          setState(() {
                            nameproduct = '';
                          });
                        }
                        setState(() {
                          status = true;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Color.fromARGB(255, 15, 94, 159),
                        ),
                        width: 50,
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
        child: Column(
          children: [
            
            status == false
                ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(width: 3),
                          Text('Search Product...',
                              style: TextStyle(fontFamily: 'noto_regular')),
                        ],
                      ),
                    ),
                )
                : _searchname.length.toInt() == 0
                    ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.search_off_sharp,
                                color: Colors.grey.shade600,
                                size: 35,
                              ),
                              Text(
                                'No data',
                                style: TextStyle(fontFamily: 'noto_regular'),
                              ),
                            ],
                          ),
                        ),
                    )
                    : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                          Row(
                            children: [
                              Text('Materail Product...',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'noto_regular',
                                      color: Colors.grey.shade700)),
                            ],
                          )
                        ]),
                    ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                runSpacing: 15,
                spacing: 15,
                children: List.generate(
                    _searchname
                        .where((element) => element.model!.length.toInt() != 0)
                        .length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        product: productController.statetList
                                            .where((p0) =>
                                                p0.id.toString() ==_searchname[index].id
                                                    .toString())
                                            .first)));
                          },
                          child: Ink(
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * 0.44,
                              height: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 140,
                                      child: Image.network(
                                          _searchname[index].image.toString())),
                                  const SizedBox(height: 8),
                                  Text(_searchname[index].name.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: name),
                                  Text(
                                    _searchname[index].description.toString(),
                                    style: description,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  const Divider(height: 1, color: Colors.black),
                                  const SizedBox(height: 8),
                                  Text(
                                      'Stock Onhand: ' +
                                          _searchname[index]
                                              .qtyOnhand
                                              .toString() +
                                          ' Unit',
                                      style: stock),
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
