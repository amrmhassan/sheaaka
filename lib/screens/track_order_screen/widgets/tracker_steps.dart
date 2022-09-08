// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/track_order_screen/widgets/tracking_item.dart';

class TrackerSteps extends StatelessWidget {
  const TrackerSteps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: PaddingWrapper(
          child: Column(
            children: [
              TrackingItem(
                active: true,
                title: 'حجز الطلب',
                subTitle: 'هنا سيتم كتابة وصف بسيط للطلب',
              ),
              TrackingItem(
                title: 'معالجة الطلب',
                subTitle: 'هنا سيتم كتابة وصف بسيط للطلب',
              ),
              TrackingItem(
                title: 'استلام الطلب',
                subTitle: 'هنا سيتم كتابة وصف بسيط للطلب',
              ),
              TrackingItem(
                title: 'تم حجز الطلب',
                subTitle: 'هنا سيتم كتابة وصف بسيط للطلب',
              ),
              TrackingItem(
                title: 'تم حجز الطلب',
                subTitle: 'هنا سيتم كتابة وصف بسيط للطلب',
              ),
              TrackingItem(
                title: 'تم حجز الطلب',
                subTitle: 'هنا سيتم كتابة وصف بسيط للطلب',
              ),
              TrackingItem(
                title: 'تم حجز الطلب',
                subTitle: 'هنا سيتم كتابة وصف بسيط للطلب',
              ),
              TrackingItem(
                title: 'معالجة الطلب',
                subTitle: 'هنا سيتم كتابة وصف بسيط للطلب',
                last: true,
              ),
              VSpace(),
            ],
          ),
        ),
      ),
    );
  }
}
