import 'di_container.dart';
import '../../presentation/blocs/appointment/appointment_bloc.dart';
import '../../presentation/blocs/auth/auth_bloc.dart';
import '../../presentation/blocs/category/category_bloc.dart';
import '../../presentation/blocs/doctor/doctor_bloc.dart';
import '../../presentation/blocs/search/search_bloc.dart';
import '../../presentation/blocs/update_personal_data/update_personal_data_bloc.dart';

void registerFactories() {
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginQuery: getIt(),
      registerQuery: getIt(),
    ),
  );
  getIt.registerFactory<CategoryBloc>(
    () => CategoryBloc(
      getCategoryQuery: getIt(),
      getDoctorBySpecialtyQuery: getIt(),
    ),
  );
  getIt.registerFactory<DoctorBloc>(
    () => DoctorBloc(
      getDoctorQuery: getIt(),
      getDoctorByIdQuery: getIt(),
    ),
  );
  getIt.registerFactory<AppointmentBloc>(
    () => AppointmentBloc(
      addAppointmentCommand: getIt(),
      getAppointmentQuery: getIt(),
      deleteAppointmentCommand: getIt(),
      updateAppointmentCommand: getIt(),
    ),
  );
  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(
      searchDoctorByTextCommand: getIt(),
    ),
  );
  getIt.registerFactory<UpdatePersonalDataBloc>(
    () => UpdatePersonalDataBloc(
      updatePersonalDataQuery: getIt(),
    ),
  );
}
