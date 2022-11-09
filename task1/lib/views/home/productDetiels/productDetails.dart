import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/controllers/controller.dart';

class productDetails extends StatelessWidget {
  String img;
  String title;
  String weight;
  double price;
  productDetails({
    Key? key,
    required this.img,
    required this.title,
    required this.weight,
    required this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/rect.png',
                ),
                Image.asset(
                  img,
                ),
                Align(
                  alignment: const Alignment(0, -0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .38,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20)),
                                  Text(
                                    '${weight} kg,price',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.favorite_border_outlined),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () =>
                                    context.read<control>().decreament(),
                                icon: const Icon(Icons.remove),
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child:
                                    Text('${context.watch<control>().count}'),
                              ),
                              IconButton(
                                onPressed: () =>
                                    context.read<control>().increament(),
                                icon: const Icon(Icons.add),
                              ),
                              const Spacer(),
                              Text(
                                '$price \$',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                            ],
                          ),
                          const ExpansionTile(
                            childrenPadding: EdgeInsets.all(10),
                            leading: const Text('Product Detail'),
                            title: Text(''),
                            children: [
                              Text(
                                  'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.')
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Nutritions'),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Review'),
                              const Spacer(),
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .08,
                    width: MediaQuery.of(context).size.width * .9,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Add to basket')),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
