# iOS Calendar App challenge

## Project Specifications

- This project aims to open the calendar app on iOS simulator ```(Language & Region -> United States)```
- Add an event after checking the date is not a weekend or a public holiday
- List of public holidays is provided as a CSV file (PublicHolidays2020.csv)
- Selcts a random date from the dates avaialble in current month.
Collects all the dates from current month filters out the weekends and public holidays
Then selects a random date from the list of available dates
- Sets an event end time based on the duration and time unit (minutes or hours) provided
- Checks if the event was successfully added

## Setup for the project

In order to run you need cocoapods installed on the machine

```bash
gem install cocoapods
```
Install the pod by running

```bash
pod install
```

Open the workspace using the ```CalendarApp.xcworkspace``` file

Change the Schema to ``CalendarAppUiTests``

And change the build target to tests

## Project Structure

The test case is written as Feature test using Gherkin language support for XCtest provided by net-a-porter

The test case and StepDefinitions are all located under the ```CalendarAppUITests``` folder

### Feature 

CalenderAppUITests.swift

```bash
func testCalendarApp() {
    Given("I have launched the Calendar app")
    When("I want to create an event with title \"Introduction\"")
    And("It is not a weekend or a public holiday and starts at 6:05 PM")
    And("I set the duration as \"30 minutes\"")
    And("I save the event")
    Then("I should be able to find it on the date")

}
```

### StepDefinitions

CalendarAppStepDefinitions.swift

```bash
step("It is not a weekend or a public holiday and starts at (.+) (AM|PM)") { (startTime: String, timeOfDay: String) in
    let startDate: Date = getRandomValidDate()
    eventDate = startDate
    eventTime = startTime
    
    fillStartDateTime(startDate: startDate, startTime: startTime, timeOfDay: timeOfDay)
}
```

### Helpers

All the helper functions are located under the ```Helpers``` group

```DateHelper.swift```

```bash
func getRandomValidDate() -> Date {
    var calendar = NSCalendar.current
    calendar.timeZone = .current
      var dateFrom = Date().startOfMonth()
      let dateTo = Date().endOfMonth()
      var availabledates : [Date] = []
      
      while dateFrom <= dateTo {
          if !calendar.isDateInWeekend(dateFrom) && !isPublicHoliday(date: dateFrom){
              availabledates.append(dateFrom)
          }
          dateFrom = Calendar.current.date(byAdding: .day, value: 1, to: dateFrom)!
      }
      
      let randomInt = Int.random(in: 0..<availabledates.count)
      return availabledates[randomInt]
}
```


### Page object

All the ideentifiers and page related operations are under ```Components``` group

```EventForm.swift```

```bash
func fillStartDateTime(startDate : Date, startTime : String, timeOfDay : String) {
    let predicate = NSPredicate(format: "label CONTAINS[c] %@", lbStart)
    let starts = calendarApp.cells.containing(predicate).element
    starts.tap()
    
    let hour_minutes = startTime.split(separator: ":")
    setDate(eventDate: startDate)
    setHour(hour: String(hour_minutes[0]))
    setMinutes(minute: String(hour_minutes[1]))
    setAMPM(timeOfDay: timeOfDay)
    eventAMPM = timeOfDay
    
    starts.tap()
}
```

## Please note that the simulator's region setting should be United States 

I have intentionally avoided adding a Team to the project to avoid adding memebers to the team to run the project

## XCpretty

To generate report run with XCpretty. Also adds screenshots to the output folder.

``` 
 xcodebuild -workspace CalendarApp.xcworkspace \
-scheme "CalendarAppUITests" \
-destination 'platform=iOS Simulator,name=iPhone SE (2nd generation),OS=13.6' \
-derivedDataPath './output' \
test | xcpretty 
```


