// import 'package:my_app/categoryProducts.dart';
// import 'package:my_app/model/categorymodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// class CategoriesList extends StatefulWidget {
//   const CategoriesList({super.key});

//   @override
//   State<CategoriesList> createState() => _CategoriesListState();
// }

// class _CategoriesListState extends State<CategoriesList> {
//   bool _loading = true;
//   final List _categoryList = [
//     {"name": "Fruits", "imageURL": "assets/fruits.png"},
//     {"name": "Vegetables", "imageURL": "assets/vegetables.png"},
//     {"name": "Clothes", "imageURL": "assets/clothes2.jpg"},
//     {"name": "Electromenager", "imageURL": "assets/electromenager.png"},
//     {"name": "Gym", "imageURL": "assets/gym.png"},
//     {"name": "Shoes", "imageURL": "assets/shoes.png"},
//     {"name": "Sports", "imageURL": "assets/sports.png"},
//     {"name": "Technology", "imageURL": "assets/technology.png"},
//     {"name": "Tools", "imageURL": "assets/tools.png"},
//   ];
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Container(
//             padding: const EdgeInsets.all(10),
//             child: ListView(
//                 children: [
//               ...List.generate(
//                   _categoryList.length,
//                   (index) => GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => CategoryProducts(
//                                 categoryModel: CategoryModel(
//                                     categoryId: 1,
//                                     categoryName: _categoryList[index]["name"],
//                                     categoryImageURL: _categoryList[index]
//                                         ["imageURL"]))));
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.only(bottom: 20),
//                         height: 160,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20)),
//                         width: double.infinity,
//                         child: Stack(
//                           alignment: Alignment.bottomLeft,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: Image.asset(
//                                 _categoryList[index]["imageURL"],
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Container(
//                                 height: 60,
//                                 width: 120,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color:
//                                       const Color.fromARGB(151, 238, 238, 238),
//                                 ),
//                                 child: Center(
//                                   child: FittedBox(
//                                     child: Text(
//                                       _categoryList[index]["name"],
//                                       style: const TextStyle(
//                                           color:
//                                               Color.fromARGB(255, 21, 59, 84),
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )))
//             ].animate(interval: const Duration(milliseconds: 100)).fadeIn())));
//   }
// }
