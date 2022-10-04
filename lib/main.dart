import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calendar'),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Calendar(),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? _selectedDate;
  EventList<Event>? _markedDateMap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SfDateRangePicker(),
        // _widget(),
      ],
    );
  }

  Widget _widget() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red[900]!)),
      width: 500,
      height: 550,
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          _selectedDate = date;
          // events.add(Event(date: date));
          events;
          // _markedDateMap = events as EventList<Event>?;
          setState(() {});
        },
        weekendTextStyle: TextStyle(
          color: Colors.red,
        ),
        thisMonthDayBorderColor: Colors.grey,

        //  weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
        customDayBuilder: (
          /// you can provide your own build function to make custom day containers
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
          /// This way you can build custom containers for specific days only, leaving rest as default.

          // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
          if (day.day == 15) {
            return const Center(
              child: Icon(Icons.local_airport),
            );
          } else {
            return null;
          }
        },
        weekFormat: false,
        markedDatesMap: _markedDateMap,
        height: 450.0,
        selectedDateTime: _selectedDate,
        daysHaveCircularBorder: null, // null for not rendering any border, true for circular border, false for rectangular border
      ),
    );
  }
}
