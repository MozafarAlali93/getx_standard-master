import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/components/global-widgets/main_appbar.dart';

import '../../../../../config/theme/my_theme.dart';
import '../../../../components/global-widgets/empty_widget.dart';
import '../controllers/graphql_controller.dart';

class GraphQLView extends GetView<GraphQLController> {
  const GraphQLView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: MainAppBar(
        prefixAction: () => MyTheme.changeTheme(),
        suffixAction: () {},
      ),
      body: Obx(() => controller.isError.value == true
          ? EmptyWidget(onPressed: () async => await controller.getCountries())
          : RefreshIndicator(
              color: theme.primaryColor,
              onRefresh: () async {
                controller.mutationResult.value = "";
                await controller.getCountries();
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: RawScrollbar(
                  thumbColor: theme.primaryColor,
                  radius: const Radius.circular(100),
                  thickness: 5,
                  interactive: true,
                  child: controller.countryList.isEmpty
                      ? const SizedBox.shrink()
                      : Column(
                          children: [
                            Text(
                              "Query result",
                              style: theme.textTheme.headlineSmall,
                            ),
                            SizedBox(height: 20.sp),
                            Expanded(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.getLang(
                                          controller.countryList[index].code ??
                                              "");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        border: Border.all(
                                            width: 1,
                                            color: theme.primaryColor),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50.sp, vertical: 15.sp),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.countryList[index]
                                                          .name ??
                                                      "",
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                                Text(
                                                  controller.countryList[index]
                                                          .emoji ??
                                                      "",
                                                  style: theme
                                                      .textTheme.displayLarge,
                                                ),
                                                Text(controller
                                                        .countryList[index]
                                                        .code ??
                                                    ""),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            if (controller.countryoNeModel !=
                                                    null &&
                                                controller.countryoNeModel?.data
                                                        ?.country?.name ==
                                                    controller
                                                        .countryList[index]
                                                        .name)
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                              .countryoNeModel!
                                                              .data!
                                                              .country!
                                                              .capital ??
                                                          "",
                                                      style: theme
                                                          .textTheme.bodyLarge,
                                                    ),
                                                    Text(
                                                      controller
                                                              .countryoNeModel!
                                                              .data!
                                                              .country!
                                                              .phone ??
                                                          "",
                                                      style: theme
                                                          .textTheme.bodyLarge,
                                                    ),
                                                    Text(
                                                      controller
                                                              .countryoNeModel!
                                                              .data!
                                                              .country!
                                                              .currency ??
                                                          "",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: controller.countryList.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(height: 12.sp);
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            )),
    );
  }
}
