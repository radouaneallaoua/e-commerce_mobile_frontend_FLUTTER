import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce_app/model/productmodel.dart';
import 'package:e_commerce_app/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:drop_down_list/drop_down_list.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final CarouselController controller = CarouselController(initialItem: 1);
  bool _searchingIsEnabled = false;
  String _selectedCategory = "";
  double _minPrice = 0;
  double _maxPrice = 0;
  String _brand = "";
  int _searchIndexItem = 0;
  late TextEditingController _minPriceEditingController;
  late TextEditingController _maxPriceEditingController;
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  List itemsSearch = [
    {
      "icon": Icon(
        CupertinoIcons.square_grid_2x2,
        color: Colors.blue[300],
        size: 20,
      ),
      'label': "category",
    },
    {
      "icon": Icon(
        CupertinoIcons.money_dollar,
        color: Colors.blue[300],
        size: 20,
      ),
      'label': "price"
    },
    {
      "icon": Icon(
        CupertinoIcons.star,
        color: Colors.blue[300],
        size: 20,
      ),
      'label': "brand"
    },
  ];

  final List<dynamic> _searchItemsGroup = [
    {
      "title": "Select category",
      "options": [
        SelectedListItem(
          name: "Test1",
          value: "TYO",
        ),
        SelectedListItem(
          name: "Test2",
          value: "NY",
        ),
        SelectedListItem(
          name: "Test3",
          value: "LDN",
        ),
        SelectedListItem(
          name: "Test4",
          value: "Test",
        ),
        SelectedListItem(
          name: "Test5",
          value: "Tset2",
        ),
      ],
      "target": "category"
    },
    {
      "title": "Select price range",
      "options": [
        SelectedListItem(
          name: "Test1",
          value: "TYO",
        ),
        SelectedListItem(
          name: "Test2",
          value: "NY",
        ),
        SelectedListItem(
          name: "Test3",
          value: "LDN",
        ),
        SelectedListItem(
          name: "Test4",
          value: "Test",
        ),
        SelectedListItem(
          name: "Test5",
          value: "Tset2",
        ),
      ],
      "target": "price"
    },
    {
      "title": "Select brand",
      "options": [
        SelectedListItem(
          name: "Brand1",
          value: "TYO",
        ),
        SelectedListItem(
          name: "Brand2",
          value: "NY",
        ),
        SelectedListItem(
          name: "Brand3",
          value: "LDN",
        ),
        SelectedListItem(
          name: "Brand4",
          value: "Test",
        ),
        SelectedListItem(
          name: "Brand5",
          value: "Tset2",
        ),
      ],
      "target": "brand"
    },
  ];

  _toggleSearch() {
    setState(() {
      _searchingIsEnabled = !_searchingIsEnabled;
      _selectedCategory = "";
      _minPrice = 0;
      _maxPrice = 0;
      _brand = "";
    });
  }

  late Future<List> categories;
  final TextEditingController _cityTextEditingController =
      TextEditingController();
  // Future<List> _fetchCategories() async {
  //   final url = Uri.parse('http://192.168.161.216:8000/categories');
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     return (json.decode(response.body) as List);
  //   } else {
  //     return Future(() => List.empty());
  //   }
  // }

  @override
  void initState() {
    _maxPriceEditingController =
        TextEditingController(text: _maxPrice.toString());
    _minPriceEditingController =
        TextEditingController(text: _minPrice.toString());
    super.initState();
  }

  @override
  void dispose() {
    _cityTextEditingController.dispose();
    _maxPriceEditingController.dispose();
    _minPriceEditingController.dispose();
    super.dispose();
  }

  void _showButtonSheetForPrice(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 400,
            width: double.infinity,
            child: Form(
                key: _formStateKey,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "minimum price",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          setState(() {
                            _minPrice = double.tryParse(value!)!;
                          });
                        },
                        controller: _minPriceEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(
                              CupertinoIcons.money_dollar,
                              color: Colors.indigo,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "maximum price",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _maxPriceEditingController,
                        onSaved: (value) {
                          setState(() {
                            _maxPrice = double.tryParse(value!)!;
                          });
                        },
                        validator: (value) {
                          if (double.tryParse(value!)! < _minPrice) {
                            return "Max price can not be less than min price";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(
                              CupertinoIcons.money_dollar,
                              color: Colors.indigo,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {
                          if (_formStateKey.currentState!.validate()) {
                            _formStateKey.currentState!.save();
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )),
          );
        });
  }

  void _onTap() {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          _searchItemsGroup[_searchIndexItem]["title"],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: _searchItemsGroup[_searchIndexItem]["options"],
        onSelected: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          setState(() {
            if (_searchItemsGroup[_searchIndexItem]["target"] == "category") {
              _selectedCategory = list.toString();
              print(_selectedCategory);
            } else if (_searchItemsGroup[_searchIndexItem]["target"] ==
                "brand") {
              _brand = list.toString();
            } else {
              _minPrice = 10;
              _maxPrice = 20;
            }
          });
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  Widget _getTarget(int index) {
    switch (index) {
      case 0:
        return _selectedCategory.startsWith("[")
            ? Container(
                width: MediaQuery.of(context).size.width / 3 - 20,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: const Color.fromARGB(255, 5, 80, 142)),
                ),
                height: 40,
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Center(
                        child: Text(_selectedCategory.substring(
                            1, _selectedCategory.length - 1)))))
            : Container(
                width: MediaQuery.of(context).size.width / 3 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: const Color.fromARGB(255, 5, 80, 142)),
                ),
                height: 40,
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        itemsSearch[index]["icon"],
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          itemsSearch[index]["label"],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 7, 127, 167)),
                        )
                      ],
                    )));

      case 1:
        return _minPrice != 0 && _maxPrice != 0
            ? Container(
                width: MediaQuery.of(context).size.width / 3 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[100],
                  border:
                      Border.all(color: const Color.fromARGB(255, 5, 80, 142)),
                ),
                height: 40,
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Center(
                        child:
                            FittedBox(child: Text("$_minPrice - $_maxPrice")))))
            : Container(
                width: MediaQuery.of(context).size.width / 3 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: const Color.fromARGB(255, 5, 80, 142)),
                ),
                height: 40,
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        itemsSearch[index]["icon"],
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          itemsSearch[index]["label"],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 7, 127, 167)),
                        )
                      ],
                    )));

      case 2:
        return _brand.startsWith("[")
            ? Container(
                width: MediaQuery.of(context).size.width / 3 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[100],
                  border:
                      Border.all(color: const Color.fromARGB(255, 5, 80, 142)),
                ),
                height: 40,
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Center(
                        child: Text(_brand.substring(1, _brand.length - 1)))))
            : Container(
                width: MediaQuery.of(context).size.width / 3 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: const Color.fromARGB(255, 5, 80, 142)),
                ),
                height: 40,
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        itemsSearch[index]["icon"],
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          itemsSearch[index]["label"],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 7, 127, 167)),
                        )
                      ],
                    )));

      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Builder(builder: (context) {
            return Container(
                padding: const EdgeInsets.only(top: 6, left: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Icon(
                        CupertinoIcons.search,
                        size: 25,
                      ),
                    ),
                    suffixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: IconButton(
                            onPressed: () {
                              _toggleSearch();
                              // showSearch(
                              //     context: context,
                              //     delegate:
                              //         ProductSearchDelegate(context: context));
                              // showBottomSheet(
                              //     context: context,
                              //     builder: (context) {
                              //       return SizedBox(
                              //         height: 400,
                              //         width: double.infinity,
                              //         child: Form(
                              //             child: Column(
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.start,
                              //           children: [
                              //             PopupMenuButton(
                              //                 onSelected: (value) {
                              //                   setState(() {
                              //                     _selectedCategory = value;
                              //                   });
                              //                 },
                              //                 icon: TextButton(
                              //                   style: const ButtonStyle(
                              //                     backgroundColor:
                              //                         MaterialStatePropertyAll<
                              //                             Color>(Colors.indigo),
                              //                   ),
                              //                   onPressed: null,
                              //                   child: Padding(
                              //                     padding: const EdgeInsets
                              //                         .symmetric(
                              //                         horizontal: 30,
                              //                         vertical: 5),
                              //                     child: Text(
                              //                         _selectedCategory
                              //                                     .length ==
                              //                                 0
                              //                             ? "select a category"
                              //                             : _selectedCategory,
                              //                         style: const TextStyle(
                              //                             color: Colors.white)),
                              //                   ),
                              //                 ),
                              //                 itemBuilder: (context) {
                              //                   return List.generate(
                              //                       5,
                              //                       (index) => PopupMenuItem(
                              //                             child: Text(
                              //                                 "category $index"),
                              //                             value:
                              //                                 "category $index",
                              //                           ));
                              //                 })
                              //           ],
                              //         )),
                              //       );
                              //     });
                            },
                            icon: Icon(
                              CupertinoIcons.slider_horizontal_3,
                              color: Colors.indigo[600],
                            ))),
                  ),
                ));
          }),
          const SizedBox(
            height: 10,
          ),
          if (_searchingIsEnabled)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                    itemsSearch.length,
                    (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _searchIndexItem = index;
                          });
                          if (index == 1) {
                            _showButtonSheetForPrice(context);
                          } else {
                            _onTap();
                          }
                        },
                        child: _getTarget(index)))
              ],
            ).animate().scaleX(),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
                height: 200,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    CarouselView(
                        itemExtent: 180,
                        controller: controller,
                        children: [
                          ...List.generate(
                            10,
                            (index) => index % 2 == 0
                                ? Image.asset(
                                    "assets/intro3.png",
                                    fit: BoxFit.cover,
                                  )
                                : index % 3 == 0
                                    ? Image.asset(
                                        "assets/market.png",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        "assets/prices.png",
                                        fit: BoxFit.cover,
                                      ),
                          )
                        ]
                            .animate(interval: const Duration(milliseconds: 20))
                            .fadeIn()
                            .then()
                            .scaleY()),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "most popular",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
                text: "Latest ",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                children: [
                  TextSpan(
                    text: "products",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.orange[500]),
                  )
                ]),
          ).animate().moveX(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Product(
                    productModel: ProductModel(
                        productId: index,
                        productName: "product $index",
                        productDescription:
                            "this is a description for the nest product and something else that you don't know about the product $index",
                        productImageURL: "assets/intro3.png",
                        oldPrice: 50,
                        price: 40),
                  ).animate().fadeIn(delay: const Duration(milliseconds: 100));
                }),
          )
        ],
      ),
    ));
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}



// class ProductSearchDelegate extends SearchDelegate {
//   late BuildContext context;
//   ProductSearchDelegate({required this.context});

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       Tooltip(
//         message: "filter with other criteria",
//         child: IconButton(
//             onPressed: () {
//               Scaffold.of(context).showBottomSheet((context) => const SizedBox(
//                     height: 100,
//                     width: double.infinity,
//                   ));
//             },
//             icon: const Icon(Icons.filter_alt_sharp)),
//       ),
//       Tooltip(
//         message: "clear search",
//         child: IconButton(
//             onPressed: () {
//               query = "";
//             },
//             icon: const Icon(Icons.cancel)),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return Tooltip(
//       message: "back",
//       child: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: const Icon(Icons.arrow_back_ios)),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return ListView(
//       children: [
//         ...List.generate(
//             30,
//             (index) => const ListTile(
//                   title: Text("Test"),
//                 ))
//       ],
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List itemsSearch = [
//       {
//         "icon": Icon(
//           CupertinoIcons.square_grid_2x2,
//           color: Colors.blue[300],
//           size: 20,
//         ),
//         'label': "category",
//       },
//       {
//         "icon": Icon(
//           CupertinoIcons.money_dollar,
//           color: Colors.blue[300],
//           size: 20,
//         ),
//         'label': "price"
//       },
//       {
//         "icon": Icon(
//           CupertinoIcons.star,
//           color: Colors.blue[300],
//           size: 20,
//         ),
//         'label': "brand"
//       },
//     ];
//     return Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: ListView(scrollDirection: Axis.vertical, children: [
//           Column(
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ...List.generate(
//                       itemsSearch.length,
//                       (index) => GestureDetector(
//                             onTap: () => showAllCategories(),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width / 3 - 20,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                     color:
//                                         const Color.fromARGB(255, 5, 80, 142)),
//                               ),
//                               height: 80,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(18.0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     itemsSearch[index]["icon"],
//                                     const SizedBox(
//                                       height: 3,
//                                     ),
//                                     Text(
//                                       itemsSearch[index]["label"],
//                                       style: const TextStyle(
//                                           color:
//                                               Color.fromARGB(255, 7, 127, 167)),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ))
//                 ],
//               ),
//             ],
//           ),
//         ]));
//   }

//   showAllCategories() {
//     String category = " ";
//     return SizedBox(
//       height: 200,
//       child: Column(
//         children: [
//           ...List.generate(10, (index) {
//             return RadioListTile.adaptive(
//               value: "category $index",
//               groupValue: category,
//               onChanged: (newValue) {
//                 category != newValue;
//               },
//             );
//           })
//         ],
//       ),
//     );
//   }
// }
