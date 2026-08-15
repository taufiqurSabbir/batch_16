import 'package:flutter/material.dart';
import 'package:flutter_16/task_manager/data/models/api_response.dart';
import 'package:flutter_16/task_manager/data/models/task_model.dart';
import 'package:flutter_16/task_manager/data/models/task_status_count.dart';

import '../data/service/api_caller.dart';
import '../utils/urls.dart';

class TaskProvider with ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  List<TaskStatusCountModel> taskCountList = [];

  List<TaskModel> newTask = [];
  List<TaskModel> progressTask = [];
  List<TaskModel> completedTask = [];
  List<TaskModel> cancelledTask = [];

  Future<void> getAllTaskCount() async {
    setLoading(true);
    final response = await ApiCaller.getRequest(URL: TMUrls.taskCount);

    List<TaskStatusCountModel> temList = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        temList.add(TaskStatusCountModel.fromJson(jsonData));
      }
    } else {}

    taskCountList = temList;

    setLoading(false);
  }

  Future<void> getAllTaskByStatus(String status) async {
    setLoading(true);

    final ApiResponse response =
        await ApiCaller.getRequest(URL: TMUrls.AllTask(status));

    if (response.isSuccess) {
      List<TaskModel> temList = [];

      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        temList.add(TaskModel.fromJson(jsonData));
      }

      if (status == 'New') {
        newTask = temList;
      } else if (status == 'Progress') {
        progressTask = temList;
      } else if (status == 'Completed') {
        completedTask = temList;
      } else if (status == 'Cancelled') {
        cancelledTask = temList;
      }
    }
    setLoading(false);
  }

  Future<bool> deleteTask(String taskID) async {
    final response = await ApiCaller.getRequest(URL: TMUrls.deleteTask(taskID));

    if (response.isSuccess) {
      newTask.removeWhere((task) => task.sId.toString() == taskID);
      progressTask.removeWhere((task) => task.sId.toString() == taskID);
      completedTask.removeWhere((task) => task.sId.toString() == taskID);
      cancelledTask.removeWhere((task) => task.sId.toString() == taskID);

      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changeStatus(String taskID, String status) async {
    final response =
        await ApiCaller.getRequest(URL: TMUrls.updateTask(taskID, status));

    if (response.isSuccess) {
      newTask.removeWhere((task) => task.sId.toString() == taskID);
      progressTask.removeWhere((task) => task.sId.toString() == taskID);
      completedTask.removeWhere((task) => task.sId.toString() == taskID);
      cancelledTask.removeWhere((task) => task.sId.toString() == taskID);

      await getAllTaskByStatus(status);
      return true;
    } else {
      return false;
    }
  }
}
