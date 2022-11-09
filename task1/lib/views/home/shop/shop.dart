import 'package:flutter/material.dart';
import 'package:task1/views/home/productDetiels/productDetails.dart';

import '../../../model/model.dart';

class shop extends StatelessWidget {
  List<model> images = [
    model(
        img: 'assets/images/banana.png',
        title: 'Organic Bananas',
        weight: '1.5',
        price: 5.77),
    model(
        img: 'assets/images/banana.png',
        title: 'Red Apple',
        weight: '2.5',
        price: 51.77),
    model(
        img: 'assets/images/banana.png',
        title: 'Organic Bananas',
        weight: '1.5',
        price: 5.77)
  ];
  List<model> images2 = [
    model(
        img: 'assets/images/pepper.png',
        title: 'pepper',
        weight: '1.5',
        price: 4.87),
    model(
        img: 'assets/images/ginger.png',
        title: 'ginger',
        weight: '2.5',
        price: 1.77),
    model(
        img: 'assets/images/ginger.png',
        title: 'ginger',
        weight: '2.5',
        price: 7.77)
  ];
  List<model> images3 = [
    model(
        img: 'assets/images/beef.png',
        title: 'Beef Bone',
        weight: '4.8',
        price: 4.87),
    model(
        img: 'assets/images/chicken.png',
        title: 'Broiler Chicken',
        weight: '2.5',
        price: 6.4),
    model(
        img: 'assets/images/beef.png',
        title: 'Beef Bone',
        weight: '2.5',
        price: 9.9)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/carrot2.png',
              height: MediaQuery.of(context).size.height * .04,
              width: MediaQuery.of(context).size.width * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_city),
                Text(
                  'Dhaka, Banassre',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Store',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            modelView(context, 'Exclusive Offer', images),
            const SizedBox(
              height: 20,
            ),
            modelView(context, 'Best Selling', images2),
            const SizedBox(
              height: 20,
            ),
            modelView(context, 'Groceries', images3),
          ],
        ),
      ),
    ));
  }

  Column modelView(BuildContext context, String modelTitle, List<model> mod) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              modelTitle,
              style: const TextStyle(fontSize: 21),
            ),
            TextButton(
                onPressed: () => seeAll(context, modelTitle, mod),
                child: const Text('See all'))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width * .9,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) => Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Image.asset(
                      mod[index].img,
                      height: MediaQuery.of(context).size.height * .08,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      mod[index].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gilroy',
                          fontSize: 18),
                    ),
                    Text(
                      '${mod[index].weight} Kg',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${mod[index].price} \$',
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => productDetails(
                                    img: mod[index].img,
                                    title: mod[index].title,
                                    price: mod[index].price,
                                    weight: mod[index].weight),
                              ),
                            ),
                            child: const Text('+'),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  seeAll(BuildContext context, String modelTitle, List<model> mod) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) => Container(
              child: ListView.builder(
                  itemCount: mod.length,
                  itemBuilder: (ctx, index) => InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => productDetails(
                                img: mod[index].img,
                                title: mod[index].title,
                                price: mod[index].price,
                                weight: mod[index].weight),
                          ),
                        ),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(mod[index].img),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(mod[index].title),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('${mod[index].weight} kg'),
                                  Text('${mod[index].price}\$'),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
            ));
  }
}
