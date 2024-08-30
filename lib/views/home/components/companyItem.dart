import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controllers/home_controller.dart';
import 'package:job_portal/models/company_model.dart';

import '../../../bottomsheets/home_bottomsheet.dart';
import '../../../utils.dart';

class CompanyItem extends StatelessWidget {
  final CompanyModel company;
  const CompanyItem({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => GestureDetector(
        onTap: () {
          Get.bottomSheet(
            CompanyDetailsBottomSheet(company: company),
            isDismissible: true, // Allow user to dismiss by swiping down
            backgroundColor:
                Colors.white.withOpacity(0.8), // Semi-transparent background
          );
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      company.thumbnailUrl ?? '',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restrictToTwoWords(company.title ?? ''),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          restrictToTwoWords(company.title ?? ''),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (company.isApplied ?? false)
                        ? Colors.greenAccent
                        : Colors.blueAccent,
                  ),
                  child: Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
