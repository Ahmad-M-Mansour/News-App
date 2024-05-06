import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmer extends StatelessWidget {
  const shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Source Name
                        Container(
                          alignment: Alignment.topLeft,
                          height: 16,
                          width: 80,
                          color: Colors.grey.shade300,
                        ),
                        // Category
                        Container(
                          alignment: Alignment.centerRight,
                          height: 16,
                          width: 80,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),
                  // Image
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  // Date
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        const Spacer(),
                        Container(
                          alignment: Alignment.topRight,
                          height: 16,
                          width: 100,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),
                  // Title
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      height: 36,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  // Description
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      height: 28,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
