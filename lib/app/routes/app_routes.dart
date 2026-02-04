part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SUBJECTTYPE=_Paths.SUBJECTTYPE;
  static const SUBJECTBOOKS=_Paths.SUBJECTBOOKS;
  static const HOMEVIEW=_Paths.HOMEVIEW;
  static const HOME = _Paths.HOMEAFTERLOGIN;
  static const MYEXAM = _Paths.MYEXAM;
  static const MAIN = _Paths.MAIN;
  static const SUBJECT = _Paths.SUBJECT;
  static const MYSECTIONS = _Paths.MYSECTIONS;
  static const SUBJECTS = _Paths.SUBJECTS;
  static const LECTURENOTPAID = _Paths.LECTURENOTPAID;
  static const HOMEAFTERLOGIN = _Paths.HOMEAFTERLOGIN;
  static const MAINPAGE = _Paths.MAINPAGE;
  static const ASSIGNMENT2=_Paths.ASSIGNMENT2;
  static const WALLET=_Paths.WALLET;
  static const PROFILE=_Paths.PROFILE;
static const MYQUESTIONS=_Paths.MYQUESTIONS;
static const CENTER=_Paths.CENTER;
static const MYQUESTIONSASK=_Paths.MYQUESTIONSASK;
static const ADDEDTO=_Paths.ADDEDTO;
static const SETTINGS=_Paths.SETTINGS;
static const EXAMSOLVE=_Paths.EXAMSOLVE;
static const MYBOOKS=_Paths.MYBOOKS;

  static const EMPTYCART=_Paths.EMPTYCART;


}



abstract class _Paths {
  _Paths._();
  // static const HOME = '/home';
  static const SUBJECTTYPE='/Subjecttype';
  static const SUBJECTBOOKS='/Subjectbooks';
  static const SUBJECT='/subject';
  static const MYQUESTIONS='/Myquestions';
  static const SUBJECTS='/Subjects';
  static const MYSECTIONS='/MySections';
  static const MYEXAM='/MyExam';
  static const ADDEDTO='/Addedto';
  static const CENTER='/SchedualCenter2';
  static const MAIN='/main';
  static const HOMEVIEW='/HomeView';
  static const EMPTYCART='/Emptycart';
  static const WALLET = '/walletMobile';
  static const LECTURENOTPAID='/Lecturenotpaid';
  static const HOMEAFTERLOGIN='/Homeafterlogin';
  static const MAINPAGE='/mainpage';
  static const ASSIGNMENT2='/assignment2';
  static const PROFILE='/Profile';
  static const MYQUESTIONSASK='/MyQuestionAsk';
  static const SETTINGS='/settings';
  static const EXAMSOLVE='/ExamSolve';
  static const MYBOOKS='/myBooks';

}
