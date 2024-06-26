import '../../core/network/failure.dart';
import '../../domain/entities/doctor_entity.dart';
import '../../domain/entities/doctors_entity.dart';
import '../../domain/repos/doctor_repo.dart';
import '../data_source/abstarctions/doctor_data_source.dart';
import 'package:dartz/dartz.dart';

class DoctorRepoImpl implements DoctorRepo {
  final DoctorDataSource doctorDataSource;

  DoctorRepoImpl({required this.doctorDataSource});
  @override
  Future<Either<Failure, DoctorsEntity>> getAllDoctors() async {
    try {
      final res = await doctorDataSource.getAllDoctors();
      return Right(
        DoctorsEntity.fromJson(res),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, DoctorEntity>> getDoctorById(
      {required String doctorId}) async {
    try {
      final res = await doctorDataSource.getDoctorById(doctorId: doctorId);
      return Right(
        DoctorEntity.fromJson(res),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, DoctorEntity>> addDoctor(
      {required DoctorEntity doctorData}) async {
    try {
      final res = await doctorDataSource.addDoctor(doctorData: doctorData);
      return Right(DoctorEntity.fromJson(res));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
