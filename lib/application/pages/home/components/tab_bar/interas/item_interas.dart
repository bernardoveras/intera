import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/domain/models/intera.dart';
import 'package:intera/core/extensions/formatter_extension.dart';
import 'package:intera/core/settings.dart';
import '../../../../../../core/extensions/screen_util_extension.dart';

class ItemInteras extends StatelessWidget {
  final int index;
  final Intera intera;

  const ItemInteras({Key? key, required this.index, required this.intera})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: index == 0 ? 0 : 2.height,
        bottom: index == index - 1 ? 0 : 2.height,
      ),
      child: LayoutBuilder(builder: (context, sizes) {
        return Container(
          height: 100.height,
          decoration: BoxDecoration(
            color: Settings.theme.value == ThemeMode.light
                ? Colors.white
                : Colors.black38,
            borderRadius: BorderRadius.circular(8.radius),
            boxShadow: Settings.theme.value == ThemeMode.light
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5.0,
                    ),
                  ]
                : null,
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 4.height,
                width: sizes.maxWidth * intera.progress,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.radius),
                    topLeft: Radius.zero,
                    bottomRight: intera.progress < 100
                        ? Radius.zero
                        : Radius.circular(8.radius),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.height),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Settings.theme.value == ThemeMode.dark
                              ? Colors.white.withOpacity(0.05)
                              : Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.08),
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 20.width),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${intera.name}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.grey.shade200
                                    : Colors.grey.shade700,
                                fontSize: 18.sp,
                              ),
                            ),
                            Container(
                              width: 200.width,
                              child: Text(
                                intera.members != null &&
                                        intera.members!.length > 0
                                    ? intera.members!
                                        .map((e) => e.name)
                                        .join(', ')
                                    : 'Sem membros...',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Get.isDarkMode
                                      ? Colors.grey.shade200
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              'Pago: ${Formatter.currency(intera.totalPago)} de${Formatter.currency(intera.total, false)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Get.isDarkMode
                                    ? Colors.grey.shade200
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.grey,
                      size: 24.height,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
