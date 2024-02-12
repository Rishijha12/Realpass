//
//  DateExtenstion.swift
//  basicStructureMVC
//
//  Created by Mehul Pal on 17/07/19.
//  Copyright © 2019 Jatin. All rights reserved.
//

import Foundation

extension Date {
    //"yyyy-MM-dd HH:mm:ss z"
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
    
    
    func dateFormatWithSuffix() -> String {
           return "d'\(self.daySuffix())' MMMM yyyy"
       }

       func daySuffix() -> String {
           let calendar = Calendar.current
           let components = (calendar as NSCalendar).components(.day, from: self)
           let dayOfMonth = components.day
           switch dayOfMonth {
           case 1, 21, 31:
               return "st"
           case 2, 22:
               return "nd"
           case 3, 23:
               return "rd"
           default:
               return "th"
           }
       }
    
    //get current date
    func getCurrentDate(format: String) -> String {
        let todaysDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let DateInFormat = dateFormatter.string(from: todaysDate)
        return DateInFormat
    }
    
    //get current year only
    func getCurrentYear(currentDate : Date, dateFormatter : DateFormatter) -> Int {
        dateFormatter.dateFormat = "yyyy"
        let todayYearOnly = Int(dateFormatter.string(from: currentDate as Date))
        return todayYearOnly!
    }
    
    //get current month only
    func getCurrentMonth(currentDate : Date, dateFormatter : DateFormatter) -> Int {
        dateFormatter.dateFormat = "MM"
        let todayMonthOnly = Int(dateFormatter.string(from: currentDate as Date))
        return todayMonthOnly!
    }
    
    //get current date only
    func getCurrentDate(currentDate : Date, dateFormatter : DateFormatter) -> Int {
        dateFormatter.dateFormat = "dd"
        let todayDateOnly = Int(dateFormatter.string(from: currentDate as Date))
        return todayDateOnly!
    }
    
    //get date in string
    func getStringDate(format: String, strDate : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let DateInFormat = dateFormatter.string(from: strDate)
        return DateInFormat
    }
    
    //convert in specific formate
    func converttoString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    //MUST HAVE TO PROVIDE TIME FORMATE LIKE HH:mm, HH should be in caps
    func timeIn24HourFormat(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    //MUST HAVE TO PROVIDE TIME FORMATE LIKE hh:mm, hh should be in small letters
    func timeIn12HourFormat(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    //Convert UTC to current
    func getUTCtoCurrentDate(format: String, strDate : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format//incoming date's formate like, "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        var dateFromString = Date()
        dateFromString = dateFormatter.date(from: strDate)!
        dateFormatter.timeZone = TimeZone.current
        let strdate = dateFormatter.string(from: dateFromString)
        return strdate
    }
    
    //Convert date formate to another formate
    func convertDateFormate(currentFormate: String, newFormate: String, strDate : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentFormate
        let strTempdate = dateFormatter.string(from: strDate)
        let dateFromString = dateFormatter.date(from: strTempdate)!
        dateFormatter.dateFormat = newFormate
        let strdate = dateFormatter.string(from: dateFromString)
        return strdate
    }
    
    //get only date from dateString(Any)
    func getDate(currentFormate: String, strDate : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentFormate
        let dateFromString = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let strdate = dateFormatter.string(from: dateFromString!)
        return strdate
    }

    //get only time from dateString(Any)
    func getTime(currentFormate: String, strDate : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentFormate
        let dateFromString = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "HH:mm"
        let strdate = dateFormatter.string(from: dateFromString!)
        return strdate
    }
    
    func compareDate(startDate : Date, endDate : Date) {
        
//        let startDate = startDate
//        let endDate = endDate.addingTimeInterval(-100)//make it plus and minus than also try with 0 to check
        
        if startDate == endDate {
            print("=")
        }
        else if startDate > endDate {
            print(">")
        }
        else if startDate < endDate {
            print("<")
        }
    }
    
    // Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    // Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    // Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    // Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    // Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    // Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    // Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String{
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
    func startOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year,.month], from: self)
        components.day = 1
        let firstDateOfMonth: Date = Calendar.current.date(from: components)!
        return firstDateOfMonth
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    //tomorrow date
    func nextDate(days: Int) -> Date {//pass 1
        let nextDate = Calendar.current.date(byAdding: .day, value: days, to: self)
        return nextDate ?? Date()
    }
    
    //yesterday date
    func previousDate(days: Int) -> Date { //pass 1
        let previousDate = Calendar.current.date(byAdding: .day, value: -days, to: self)
        return previousDate ?? Date()
    }
    
    //get future months
    func addMonths(numberOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: numberOfMonths, to: self)
        return endDate ?? Date()
    }
    
    //get past months
    func removeMonths(numberOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: -numberOfMonths, to: self)
        return endDate ?? Date()
    }
    
    //get the previous year to than current year
    func removeYears(numberOfYears: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .year, value: -numberOfYears, to: self)
        return endDate ?? Date()
    }
    
    //Add more time in current time
    func addingMinutes(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func getHumanReadableDayString() -> String {
        
        let weekdays = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
        ]
        
        let calendar = Calendar.current.component(.weekday, from: self)
        return weekdays[calendar - 1]
    }
    
    func timeSinceDate(fromDate: Date) -> String {
        let earliest = self < fromDate ? self  : fromDate
        let latest = (earliest == self) ? fromDate : self
        
        let components:DateComponents = Calendar.current.dateComponents([.minute,.hour,.day,.weekOfYear,.month,.year,.second], from: earliest, to: latest)
        let year = components.year  ?? 0
        let month = components.month  ?? 0
        let week = components.weekOfYear  ?? 0
        let day = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        if year >= 2{
            return "\(year) years ago"
        }else if (year >= 1){
            return "1 year ago"
        }else if (month >= 2) {
            return "\(month) months ago"
        }else if (month >= 1) {
            return "1 month ago"
        } else  if (week >= 2) {
            return "\(week) weeks ago"
        } else if (week >= 1){
            return "1 week ago"
        } else if (day >= 2) {
            return "\(day) days ago"
        } else if (day >= 1){
            return "1 day ago"
        } else if (hours >= 2) {
            return "\(hours) hours ago"
        } else if (hours >= 1){
            return "1 hour ago"
        } else if (minutes >= 2) {
            return "\(minutes) minutes ago"
        } else if (minutes >= 1){
            return "1 minute ago"
        } else if (seconds >= 3) {
            return "\(seconds) seconds ago"
        } else {
            return "Just now"
        }
    }
    
    func dateFormaterConverter(strDate : String) -> String
    {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "yyyy-MM-dd hh:mm"
        dateFormate.timeZone = TimeZone(abbreviation: "UTC")
        let chatMssgDate = dateFormate.date(from: strDate)
        dateFormate.timeZone = TimeZone.current
        dateFormate.dateFormat = "yyyy-MM-dd"
        return dateFormate.string(from: chatMssgDate!)
    }
    
    func isGreaterThanDate(dateToCompare: Date) -> Bool
    {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedAscending {
            isLess = true
        }
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        //Return Result
        return isEqualTo
    }
    
    func addDays(daysToAdd: Int) -> Date {
        let secondsInDays: TimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: Date = self.addingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    func addHours(hoursToAdd: Int) -> Date {
        let secondsInHours: TimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: Date = self.addingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
}

func diffrenceOfTwoDates(fromDate: Date, toDate: Date) ->  Int {
    let calendar = NSCalendar.current as NSCalendar
    
    // Replace the hour (time) of both dates with 00:00
    let date1 = calendar.startOfDay(for: fromDate)
    let date2 = calendar.startOfDay(for: toDate)
    
    let flags = NSCalendar.Unit.day
    let components = calendar.components(flags, from: date1, to: date2, options: [])
    
    return components.day!
}
