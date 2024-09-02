import 'package:flutter/material.dart';
import 'templateerrorcontainer.dart';

/// A stateless widget that displays all request items in a list.
///
/// This widget manages the display states of data fetching, including:
///
/// - [loading]: Indicates whether the data is currently being loaded.
/// - [fetch]: Indicates whether the data fetching was successful.
/// - [errorText]: A message to display when an error occurs during data fetching.
/// - [fetchData]: A future that retrieves the data when invoked.
/// - [listWidget]: A list of widgets that represent the request items.
///
/// The widget utilizes a [FutureBuilder] to handle different loading states:
///
/// - If [loading] is true, a [CircularProgressIndicator] is displayed.
/// - If [fetch] is false, a loading indicator is shown.
/// - If there’s an error during data fetching, an error message is displayed.
/// - If [listWidget] is empty, a message indicating no requests is shown.
/// - If there are request items, they are displayed in a [ListView].
///
/// - Actions:
///   - The widget builds a list view displaying all items from [listWidget].
///   - If an error occurs, it shows an error message using [buildNoRequestsWidget].
class RequestsWidgetShowAll extends StatelessWidget {
  final bool loading;
  final bool fetch;
  final String errorText;
  final Future<void> fetchData;
  final List<Widget> listWidget;


  const RequestsWidgetShowAll({
    Key? key,
    required this.loading,
    required this.fetch,
    required this.errorText,
    required this.listWidget,
    required this.fetchData,
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
                      itemCount: listWidget.length,
                      itemBuilder: (context, index) {
                        return listWidget[index];
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                    ),
                    SizedBox(height: 10),
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
}
