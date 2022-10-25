import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/newsProvider.dart';

class cardNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    newsProvider objWatch = context.watch<newsProvider>();
    newsProvider objRead = context.watch<newsProvider>();
    return ListView.builder(
        itemCount: objWatch.articls?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => objRead.launchUR('${objRead.articls![index].url}'),
              child: Card(
                color: objWatch.w,
                child: Container(
                  child: Column(
                    children: [
                      Image.network(
                        '${objWatch.articls![index].urlImage}',
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('${objWatch.articls![index].title}',
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.headline6),
                            Text('${objWatch.articls![index].description}',
                                overflow: TextOverflow.clip,
                                maxLines: 3,
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
