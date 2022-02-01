import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int present = 0;
  int perPage = 6;

  List fullMenu = [
    {
      "image": "assets/images/image_1.jpg",
      "name": "Dinner Steakhouse",
      "location": "Deli ${String.fromCharCode(0x00B7)} Seattle",
      "rating": 5.0
    },
    {
      "image": "assets/images/image_2.jpg",
      "name": "Salad",
      "location": "Brunch ${String.fromCharCode(0x00B7)} Colorado Springs",
      "rating": 4.5
    },
    {
      "image": "assets/images/image_3.jpg",
      "name": "Fishery",
      "location": "Sushi ${String.fromCharCode(0x00B7)} Las Vegas",
      "rating": 4.5
    },
    {
      "image": "assets/images/image_4.jpg",
      "name": "Soup house",
      "location": "Soupery ${String.fromCharCode(0x00B7)} Chicago",
      "rating": 3.5
    },
    {
      "image": "assets/images/image_5.jpg",
      "name": "Egg & Avacado",
      "location": "Greeks ${String.fromCharCode(0x00B7)} Los Angeles",
      "rating": 4.0
    },
    {
      "image": "assets/images/image_6.jpg",
      "name": "Deli Ciuos",
      "location": "Deli ${String.fromCharCode(0x00B7)} New York",
      "rating": 3.0
    },
    {
      "image": "assets/images/image_7.jpg",
      "name": "Mantis",
      "location": "Hamir ${String.fromCharCode(0x00B7)} China Town",
      "rating": 5.0
    },
    {
      "image": "assets/images/image_8.jpg",
      "name": "Crisps",
      "location": "Subway ${String.fromCharCode(0x00B7)} Ohia",
      "rating": 3.5
    },
    {
      "image": "assets/images/image_9.jpg",
      "name": "Yummy",
      "location": "Yummy house ${String.fromCharCode(0x00B7)} Arizona",
      "rating": 4.0
    },
    {
      "image": "assets/images/image_10.jpg",
      "name": "Fish & Bread",
      "location": "Atlant ${String.fromCharCode(0x00B7)} Atalanta",
      "rating": 5.0
    },
    {
      "image": "assets/images/image_11.jpg",
      "name": "Burger",
      "location": "Burger house ${String.fromCharCode(0x00B7)} Orlando",
      "rating": 4.5
    },
    {
      "image": "assets/images/image_12.jpg",
      "name": "Rice & bread",
      "location": "Baltimore ${String.fromCharCode(0x00B7)} Texas",
      "rating": 4.0
    },
    {
      "image": "assets/images/image_13.jpg",
      "name": "Beef Steak",
      "location": "Only Meat ${String.fromCharCode(0x00B7)} New Mexico",
      "rating": 5.0
    },
    {
      "image": "assets/images/image_14.jpg",
      "name": "Fish Boneless",
      "location": "ChipHouse ${String.fromCharCode(0x00B7)} Nevada",
      "rating": 3.5
    },
    {
      "image": "assets/images/image_15.jpg",
      "name": "Peperoni",
      "location": "Pizza House ${String.fromCharCode(0x00B7)} Washington",
      "rating": 3.5
    },
    {
      "image": "assets/images/image_16.jpg",
      "name": "Lamb meat",
      "location": "Meat Meat Meat ${String.fromCharCode(0x00B7)} Pennsylvania",
      "rating": 4.5
    },
    {
      "image": "assets/images/image_17.jpg",
      "name": "Mini Salad",
      "location": "Veg House ${String.fromCharCode(0x00B7)} New Jersey",
      "rating": 4.5
    },
    {
      "image": "assets/images/image_18.jpg",
      "name": "Lavash",
      "location": "Fast Food House ${String.fromCharCode(0x00B7)} Hawai",
      "rating": 4.5
    },
  ];
  List menu = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    menu.addAll(fullMenu.getRange(present, present + perPage));
    present = present + perPage;
  }

  void _loadMoreData() {
    setState(() {
      if ((present + perPage) > fullMenu.length) {
        menu.addAll(fullMenu.getRange(present, fullMenu.length));
      } else {
        menu.addAll(fullMenu.getRange(present, present + perPage));
      }
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool usingDesktop = MediaQuery.of(context).size.width > 1024;
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            leading: const Icon(Icons.restaurant),
            title: const Text("FriendlyEats"),
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3)),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                             Icons.filter_list,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "All Restaurants",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                "by rating",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: usingDesktop ? 3 : 1,
                childAspectRatio: usingDesktop ? 2/1.3: 2/1.5),
            itemCount:
                (present < fullMenu.length) ? menu.length + 1 : menu.length,
            itemBuilder: (context, index) {
              return menu.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : (index == menu.length)
                      ? Container(
                          padding: const EdgeInsets.only(top: 20),
                          alignment: Alignment.topCenter,
                          child: MaterialButton(
                            height: 20,
                            child: const Text("Load More"),
                            onPressed: _loadMoreData,
                          ),
                        )
                      : _foods(menu[index]["image"], menu[index]["name"],
                          menu[index]["location"], menu[index]["rating"]);
            },
          ),
        ));
  }

  Widget _foods(String image, String name, String location, double rating) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      height: MediaQuery.of(context).size.height*0.4,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      RatingBar(
                          ignoreGestures: true,
                          itemSize: 25,
                          initialRating: rating,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                              full: const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              half: const Icon(
                                Icons.star_half,
                                color: Colors.yellow,
                              ),
                              empty: const Icon(
                                Icons.star_border,
                                color: Colors.yellow,
                              )),
                          onRatingUpdate: (rating) {}),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        location,
                        style: TextStyle(color: Colors.grey.shade600),
                      )
                    ],
                  ),
                  Text(
                    "\$\$\$",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
