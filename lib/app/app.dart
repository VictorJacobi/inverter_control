
import 'package:project_iot/UI/screens/login/login_screen.dart';
import 'package:project_iot/UI/screens/splash/splash_screen.dart';
import 'package:project_iot/networks/data_base/authenticate.dart';
import 'package:project_iot/networks/data_base/readData.dart';
import 'package:project_iot/networks/data_base/write_data.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SplashScreen),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: Authentication),
    LazySingleton(classType: WriteData),
    LazySingleton(classType: ReadData),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),


    // LazySingleton(classType: AgoraService),
    // @stacked-service
  ],
  // bottomsheets: [
  //   StackedBottomsheet(classType: NoticeSheet),
  //   StackedBottomsheet(classType: GenotypeSheet),
  //   StackedBottomsheet(classType: BloodGroupSheet),
  //   StackedBottomsheet(classType: SpecialiSheet),
  //   StackedBottomsheet(classType: SelectStateView),
  //   StackedBottomsheet(classType: MapSheet),
  //   StackedBottomsheet(classType: SubscriptionSheet),
  //   StackedBottomsheet(classType: AddFundsSheet),
  //   StackedBottomsheet(classType: TransactionHistorySheet),
  //   StackedBottomsheet(classType: PaymentSummarySheet),
  //   StackedBottomsheet(classType: DrugsDetailSheetView),
  //   StackedBottomsheet(classType: BillsOthersSheetView),
  //
  //   StackedBottomsheet(classType: AllergiesSheet),
  //   StackedBottomsheet(classType: VouchersSheetView),
  //   StackedBottomsheet(classType: BillsSheetView),
  //   StackedBottomsheet(classType: SelectBankSheet),
  //   StackedBottomsheet(classType: SelectCitiesSheet),
  //   StackedBottomsheet(classType: ProfileAllergiesSheet),
  //   StackedBottomsheet(classType: CancelAppointSheet),
  //   StackedBottomsheet(classType: RescheduleSheet),
  //   StackedBottomsheet(classType: ReasonSheet),
  //   StackedBottomsheet(classType: ThemesSheet),
  //   StackedBottomsheet(classType: RatingSheet),
  //   StackedBottomsheet(classType: ChooseHosSheet),
  //   StackedBottomsheet(classType: ChooseDocSheet),
  //   StackedBottomsheet(classType: ModeSheet),
  //   StackedBottomsheet(classType: ServiceSheet),
  //   StackedBottomsheet(classType: InsufficientSheet),
  //   StackedBottomsheet(classType: EditDiagnosisSheet),
  //   StackedBottomsheet(classType: DiagnosisSheet),
  //   StackedBottomsheet(classType: DiagnosisPrevSheet),
  //   StackedBottomsheet(classType: MedicationPrevSheet),
  //   StackedBottomsheet(classType: EditMedicationSheet),
  //   StackedBottomsheet(classType: MedicationSheet),
  //   StackedBottomsheet(classType: DrBillsDetailsSheet),
  //   StackedBottomsheet(classType: AvailabilityStatusSheetView),
  //   StackedBottomsheet(classType: DrSelectStateSheetView),
  //   StackedBottomsheet(classType: SpecializationSheet),
  //   StackedBottomsheet(classType: UploadImageView),
  //   StackedBottomsheet(classType: ChooseSpecialistSheetView),
  //   StackedBottomsheet(classType: DeliveryOptionSheet),
  //   StackedBottomsheet(classType: AppointmentTimeSheet),
  //   StackedBottomsheet(classType: AgoraChannelSheet),
  //   StackedBottomsheet(classType: RelationshipSheet),
  //   // @stacked-bottom-sheet
  // ],
  // dialogs: [
  //   StackedDialog(classType: InfoAlertDialog),
  //   StackedDialog(classType: DateDialog),
  //   StackedDialog(classType: Info),
  //   StackedDialog(classType: CreateNewPasswordViewDialog),
  //   StackedDialog(classType: EmergencyNumberViewDialog),
  //   StackedDialog(classType: SpecialDialog),
  //   StackedDialog(classType: VoucherViewDialog),
  //   StackedDialog(classType: PassCodeViewDialog),
  //   StackedDialog(classType: CancelDialog),
  //   StackedDialog(classType: LogoutViewDialog),
  //   StackedDialog(classType: RescheduleDialog),
  //   StackedDialog(classType: ReviewDialog),
  //   StackedDialog(classType: PaymentDialog),
  //   StackedDialog(classType: DrChangePasswordViewDialog),
  //   StackedDialog(classType: CreateBillsViewDialog),
  //   StackedDialog(classType: PtViewDialog),
  //   // @stacked-dialog
  // ],
)
class App {}
