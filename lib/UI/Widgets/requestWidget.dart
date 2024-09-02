import 'package:flutter/material.dart';
import 'templateerrorcontainer.dart';

/// A stateless widget that displays a list of request items.
///
/// This widget handles various states of data fetching, including:
///
/// - [loading]: Indicates whether the data is being loaded.
/// - [fetch]: Indicates whether the data fetching is successful.
/// - [errorText]: A message to display in case of an error.
/// - [fetchData]: A future that fetches the data when called.
/// - [listWidget]: A list of widgets representing the requests.
/// - [numberOfWidgets]: The maximum number of widgets to display in the list.
/// - [showSeeAllButton]: A flag that determines whether to show the "See All" button.
/// - [seeAllButtonText]: The text to display on the "See All" button.
/// - [nextPage]: An optional widget to navigate to when the "See All" button is pressed.
///
/// The widget includes a [FutureBuilder] that manages the loading, error, and data states.
///
/// - Actions:
///   - On pressing the "See All" button, the app navigates to the [nextPage].
class RequestsWidget extends StatelessWidget {
  final bool loading;
  final bool fetch;
  final String errorText;
  final Future<void> fetchData;
  final List<Widget> listWidget;
  final int numberOfWidgets;
  final bool showSeeAllButton;
  final String seeAllButtonText;
  final Widget? nextPage;

  const RequestsWidget({
    Key? key,
    required this.loading,
    required this.fetch,
    required this.errorText,
    required this.listWidget,
    required this.fetchData,
    required this.numberOfWidgets,
    required this.showSeeAllButton,
    required this.seeAllButtonText,
    required this.nextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: FutureBuilder<void>(
        future: loading ? null : fetchData,
        builder: (context, snapshot) {
          if (!fetch) {
            return Container(
              height: 200,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return buildNoRequestsWidget(screenWidth, 'Error: $errorText');
          } else if (fetch) {
            if (listWidget.isEmpty) {
              return buildNoRequestsWidget(screenWidth, errorText);
            } else if (listWidget.isNotEmpty) {
              return Container(
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: listWidget.length > numberOfWidgets ? numberOfWidgets : listWidget.length,
                      itemBuilder: (context, index) {
                        return listWidget[index];
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                    ),
                    SizedBox(height: 10),
                    if (showSeeAllButton)
                      buildSeeAllButtonReviewedList(context),
                  ],
                ),
              );
            }
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget buildSeeAllButtonReviewedList(BuildContext context) {
    return Center(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(13, 70, 127, 1),
            fixedSize: Size(
              MediaQuery.of(context).size.width * 0.9,
              MediaQuery.of(context).size.height * 0.08,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage!));
          },
          child: Text(
            seeAllButtonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'default',
            ),
          ),
        ),
      ),
    );
  }
}
