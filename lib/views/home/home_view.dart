import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controllers/home_controller.dart';

import 'components/companyItem.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.find();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: const Icon(Icons.menu_outlined),
        actions: [
          Obx(
            () => Visibility(
              visible: homeController.isSearch.value,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: homeController.searchController,
                  onChanged: (text) {
                    homeController.search();
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for companies',
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              homeController.isSearch.value = !homeController.isSearch.value;
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Find your dream\njob today',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: homeController.filteredCompanies.isEmpty ? const Center(
                    child: Text(
                      'Nothing to show here',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ) : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeController.filteredCompanies.length,
                    itemBuilder: (context, index) => CompanyItem(
                      company: homeController.filteredCompanies[index],
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
