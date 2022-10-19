// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_products_screen/t_products_screen.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class TraderOfferCard extends StatelessWidget {
  const TraderOfferCard({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final OfferModel offer;

//? handle delete offer
  Future<void> handleDeleteOffer(BuildContext context, String offerId) async {
    try {
      await Provider.of<StoreProvider>(context, listen: false)
          .deleteOffer(offerId);
      //! edit the offer product and remove offer data from it
      showSnackBar(context: context, message: 'تم حذف العرض');
    } catch (e) {
      showSnackBar(
        context: context,
        message: e.toString(),
        snackBarType: SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName,
            arguments: offer.productId);
      },
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (ctx) {
              return DeleteModal(
                title: 'هل تريد حذف هذا العرض؟',
                subTitle: 'سيستفيد من العرض من قام بالحجز من قبل',
                onRemove: () => handleDeleteOffer(context, offer.id),
              );
            });
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            mediumBorderRadius,
          ),
          boxShadow: [
            liteBoxShadow,
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                offer.imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: kHPad / 2,
                vertical: kVPad / 2,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        offer.title,
                      ),
                      Spacer(),
                      Text(
                        '-%${offer.discountPercentage.toStringAsFixed(0)}',
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        dateToString(offer.endAt),
                        style: h4TextStyleInactive.copyWith(
                          color: kTraderSecondaryColor.withOpacity(.8),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
