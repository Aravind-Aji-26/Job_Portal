import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../models/company_model.dart';
import '../utils.dart';

class CompanyDetailsBottomSheet extends StatelessWidget {
  final CompanyModel company;
  final HomeController homeController = Get.find();
  CompanyDetailsBottomSheet({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Wrap content vertically
        children: [
          // Display company details here (thumbnail, title, description, etc.)
          Image.network(
            company.thumbnailUrl ?? '',
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 10),
          Text(
            restrictToTwoWords(company.title ?? ''),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(company.title!),
          const SizedBox(height: 20),
          const Text(
            'Job Title',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          const Text(
            'Senior Software Engineer',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Requirements',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          const Text(
            'Applicants must have atleast 3 years of experience',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: (company.isApplied ?? false) ? null : () {
              homeController.applyJob(company.id);
              Get.back();
              Get.snackbar(
                'Success',
                'Job Applied Successfully',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: (company.isApplied ?? false) ? Colors.grey : Colors.blueAccent,
                borderRadius: BorderRadius.circular(5),
              ),
              child:  Center(
                child: Text(
                  (company.isApplied ?? false) ? 'APPLIED' : 'APPLY NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
