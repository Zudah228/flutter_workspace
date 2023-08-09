import 'package:flutter_workspace/pages/abstract_only_navigation_page.dart';
import 'package:flutter_workspace/pages/firebase/check_email_verification/check_email_verification_page.dart';
import 'package:flutter_workspace/pages/firebase/in_app_messaging/firebase_in_app_messaging_page.dart';
import 'package:flutter_workspace/pages/firebase/manage_firestore_document_change/manage_firestore_document_change_page.dart';
import 'package:flutter_workspace/pages/firebase/query_index_error/query_index_error_page.dart';
import 'package:flutter_workspace/pages/home_page.dart';

class FirebasePage extends AbstractOnlyNavigationPage {
  FirebasePage()
      : super(pages: [
          const NavigationPage(page: FirebaseInAppMessagingPage()),
          const NavigationPage(page: CheckEmailVerificationPage()),
          const NavigationPage(page: ManageFirestoreDocumentChange()),
          const NavigationPage(page: QueryIndexErrorPage())
        ]);
}
