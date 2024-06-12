import 'package:clinic_admin/domain/entities/get_doctor_by_id_entity.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/failure.dart';
import '../entities/doctor_entity.dart';
import '../entities/doctors_entity.dart';

abstract class DoctorRepo {
  Future<Either<Failure, DoctorsEntity>> getAllDoctors({
    required int index,
  });
  Future<Either<Failure, GetDoctorByIdEntity>> getDoctorById(
      {required String doctorId});
  Future<Either<Failure, DoctorEntity>> deleteDoctor(
      {required String doctorId});
  Future<Either<Failure, DoctorEntity>> addDoctor(
      {required Doctor doctorData,
      required int specializationId,
      required String password});
}
