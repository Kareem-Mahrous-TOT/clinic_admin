import 'dart:developer';

import '../../../core/dependency_injection/di_container.dart';
import '../../../core/dio/base_dio.dart';
import '../../../core/utils/shared_keys.dart';
import '../abstarctions/appointment_data_source.dart';
import 'package:dio/dio.dart';

class AppointmentDataSourceImpl implements AppointmentDataSource {
  final BaseDio dioClient;

  AppointmentDataSourceImpl({required this.dioClient});

  @override
  Future<Map<String, dynamic>> addAppointment(
      {required String doctorId,
      required String patientId,
      required String date,
      required String startTime,
      required String endTime}) async {
    final String token = preferences.getString(SharedKeys.accessToken) ?? "";
    final response = await dioClient.post(
      '/Appointment',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
      data: {
        "startTime": startTime,
        "endTime": endTime,
        "date": date,
        "patientId": patientId,
        "doctorId": doctorId
      },
    );
    log(
      '${response.data}:::::::::login',
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getAppointment() async {
    final String token = preferences.getString(SharedKeys.accessToken) ?? "";

    final response = await dioClient.get(
      '/Appointment/Patient',
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    log(
      '${response.data}:::::::::login',
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> updateAppointment({
    required String doctorId,
    required String patientId,
    required String date,
    required String startTime,
    required String endTime,
    required String appointmentId,
  }) async {
    final String token = preferences.getString(SharedKeys.accessToken) ?? "";
    final response = await dioClient.put(
      '/Appointment/$appointmentId',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
      data: {
        "startTime": startTime,
        "endTime": endTime,
        "date": date,
        "patientId": patientId,
        "doctorId": doctorId
      },
    );
    log(
      '${response.data}:::::::::login',
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> deleteAppointment(
      {required String appointmentId}) async {
    final String token = preferences.getString(SharedKeys.accessToken) ?? "";

    final res = await dioClient.delete(
      '/Appointment/$appointmentId',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    return res.data;
  }
}
