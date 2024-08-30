import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_portal/models/company_model.dart';

import '../services/api_service.dart';

class HomeController extends GetxController {
  RxList<CompanyModel> companies = <CompanyModel>[].obs;
  List<CompanyModel> companiesList = [];
  RxList<CompanyModel> filteredCompanies = <CompanyModel>[].obs;
  final TextEditingController searchController = TextEditingController();
  RxBool loading = false.obs;
  RxBool isSearch = false.obs;

  @override
  void onInit() {
    super.onInit();
    print('HomeController initialized');
    getJobs();
  }

  Future<void> getJobs() async {
    loading.value = true;
    APIService apiService = Get.find();
    var responseData = await apiService.get('photos');
    companiesList =
        responseData.map((json) => CompanyModel.fromJson(json)).toList();
    companies.assignAll(companiesList);
    filteredCompanies.assignAll(companiesList);
    update();
    print("companiesList length: ${filteredCompanies.length}");
    loading.value = false;
  }

  void search() {
    if (searchController.text.trim().isEmpty) {
      filteredCompanies = companies;
      update();
    } else {
      filteredCompanies.value = companiesList
          .where((company) {
            return company.title!
                .toLowerCase()
                .contains(searchController.text.toLowerCase());
          })
          .toList()
          .obs;
      update();
    }
  }

  applyJob(int? id) {
    if (id != null) {
      int index = companies.indexWhere((element) => element.id == id);
      companies[index].isApplied = true;
      update();
    }
  }
}
