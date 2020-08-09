# iOS Calendar App challenge

## Project Specifications

- This project aims to open the calendar app on iOS simulator ```(Language & Region -> United States)```
- Add an event after checking the date is not a weekend or a public holiday
- List of public holidays is provided as a CSV file (PublicHolidays2020.csv)
- Selcts a random date from the dates avaialble in current month
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

### StepDefinitions

CalendarAppStepDefinitions.swift

### Helpers

All the helper functions are located under the ```Helpers``` group

### Page object

All the ideentifiers and page related operations are under ```Components``` group

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


