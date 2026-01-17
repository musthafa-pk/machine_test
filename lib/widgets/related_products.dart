import 'package:flutter/material.dart';
import 'package:macine_test/widgets/productgrid_card.dart';

class RelatedProductsSection extends StatelessWidget {
  const RelatedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Related Products",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // SizedBox(
        //   height: 260,
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 5,
        //     itemBuilder: (context, index) {
        //       return const Padding(
        //         padding: EdgeInsets.only(left: 16),
        //         child: SizedBox(
        //           width: 180,
        //           child: ProductGridCard(),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
