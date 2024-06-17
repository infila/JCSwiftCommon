//
//  Date+Ext.swift
//  JCSwiftCommon
//
//  Created by James Chen on 2022/10/31.
//

import Foundation

public extension Date {
  func format2String(_ style: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = style
    return formatter.string(from: self)
  }

  init(timeMills: Int) {
    self.init(timeIntervalSince1970: TimeInterval(timeMills / 1000))
  }

  init(string: String, withFormat style: String) {
    let formatter = DateFormatter()
    formatter.dateFormat = style
    let date = formatter.date(from: string)
    self.init(timeMills: date?.timeMills ?? 0)
  }

  var timeMills: Int {
    return Int(timeIntervalSince1970) * 1000
  }
}

public extension Date {
  func compareDays(with anotherDay: Date) -> Int {
    guard let day = calendar.dateComponents([Calendar.Component.day], from: self, to: anotherDay).day else {
      return 0
    }
    return day
  }

  func dayStartDate() -> Date {
    calendar.startOfDay(for: self)
  }
}

public extension Date {
  /// Create a new date form calendar components.
  ///
  ///     let date = Date(year: 2010, month: 1, day: 12) // "Jan 12, 2010, 7:45 PM"
  ///
  /// - Parameters:
  ///   - calendar: Calendar (default is current).
  ///   - timeZone: TimeZone (default is current).
  ///   - era: Era (default is current era).
  ///   - year: Year (default is current year).
  ///   - month: Month (default is current month).
  ///   - day: Day (default is today).
  ///   - hour: Hour (default is current hour).
  ///   - minute: Minute (default is current minute).
  ///   - second: Second (default is current second).
  ///   - nanosecond: Nanosecond (default is current nanosecond).
  init?(
    calendar: Calendar? = Calendar.current,
    timeZone: TimeZone? = NSTimeZone.default,
    era: Int? = Date().era,
    year: Int? = Date().year,
    month: Int? = Date().month,
    day: Int? = Date().day,
    hour: Int? = Date().hour,
    minute: Int? = Date().minute,
    second: Int? = Date().second,
    nanosecond: Int? = Date().nanosecond) {
    var components = DateComponents()
    components.calendar = calendar
    components.timeZone = timeZone
    components.era = era
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.second = second
    components.nanosecond = nanosecond

    guard let date = calendar?.date(from: components) else { return nil }
    self = date
  }

  ///  Era.
  ///
  ///        Date().era -> 1
  ///
  var era: Int {
    return calendar.component(.era, from: self)
  }

  var calendar: Calendar {
    return Calendar(identifier: Calendar.current.identifier)
  }

  var year: Int {
    get {
      return calendar.component(.year, from: self)
    }
    set {
      guard newValue > 0 else { return }
      let currentYear = calendar.component(.year, from: self)
      let yearsToAdd = newValue - currentYear
      if let date = calendar.date(byAdding: .year, value: yearsToAdd, to: self) {
        self = date
      }
    }
  }

  ///  Month.
  ///
  ///     Date().month -> 1
  ///
  ///     var someDate = Date()
  ///     someDate.month = 10 // sets someDate's month to 10.
  ///
  var month: Int {
    get {
      return calendar.component(.month, from: self)
    }
    set {
      let allowedRange = calendar.range(of: .month, in: .year, for: self)!
      guard allowedRange.contains(newValue) else { return }

      let currentMonth = calendar.component(.month, from: self)
      let monthsToAdd = newValue - currentMonth
      if let date = calendar.date(byAdding: .month, value: monthsToAdd, to: self) {
        self = date
      }
    }
  }

  ///  Day.
  ///
  ///     Date().day -> 12
  ///
  ///     var someDate = Date()
  ///     someDate.day = 1 // sets someDate's day of month to 1.
  ///
  var day: Int {
    get {
      return calendar.component(.day, from: self)
    }
    set {
      let allowedRange = calendar.range(of: .day, in: .month, for: self)!
      guard allowedRange.contains(newValue) else { return }

      let currentDay = calendar.component(.day, from: self)
      let daysToAdd = newValue - currentDay
      if let date = calendar.date(byAdding: .day, value: daysToAdd, to: self) {
        self = date
      }
    }
  }

  /// Weekday.
  ///
  ///     Date().weekday -> 5 // fifth day in the current week.
  ///
  var weekday: Int {
    return calendar.component(.weekday, from: self)
  }

  ///  Hour.
  ///
  ///     Date().hour -> 17 // 5 pm
  ///
  ///     var someDate = Date()
  ///     someDate.hour = 13 // sets someDate's hour to 1 pm.
  ///
  var hour: Int {
    get {
      return calendar.component(.hour, from: self)
    }
    set {
      let allowedRange = calendar.range(of: .hour, in: .day, for: self)!
      guard allowedRange.contains(newValue) else { return }

      let currentHour = calendar.component(.hour, from: self)
      let hoursToAdd = newValue - currentHour
      if let date = calendar.date(byAdding: .hour, value: hoursToAdd, to: self) {
        self = date
      }
    }
  }

  ///  Minutes.
  ///
  ///     Date().minute -> 39
  ///
  ///     var someDate = Date()
  ///     someDate.minute = 10 // sets someDate's minutes to 10.
  ///
  var minute: Int {
    get {
      return calendar.component(.minute, from: self)
    }
    set {
      let allowedRange = calendar.range(of: .minute, in: .hour, for: self)!
      guard allowedRange.contains(newValue) else { return }

      let currentMinutes = calendar.component(.minute, from: self)
      let minutesToAdd = newValue - currentMinutes
      if let date = calendar.date(byAdding: .minute, value: minutesToAdd, to: self) {
        self = date
      }
    }
  }

  ///  Seconds.
  ///
  ///     Date().second -> 55
  ///
  ///     var someDate = Date()
  ///     someDate.second = 15 // sets someDate's seconds to 15.
  ///
  var second: Int {
    get {
      return calendar.component(.second, from: self)
    }
    set {
      let allowedRange = calendar.range(of: .second, in: .minute, for: self)!
      guard allowedRange.contains(newValue) else { return }

      let currentSeconds = calendar.component(.second, from: self)
      let secondsToAdd = newValue - currentSeconds
      if let date = calendar.date(byAdding: .second, value: secondsToAdd, to: self) {
        self = date
      }
    }
  }

  /// Nanoseconds.
  ///
  ///     Date().nanosecond -> 981379985
  ///
  ///     var someDate = Date()
  ///     someDate.nanosecond = 981379985 // sets someDate's seconds to 981379985.
  ///
  var nanosecond: Int {
    get {
      return calendar.component(.nanosecond, from: self)
    }
    set {
      let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
      guard allowedRange.contains(newValue) else { return }

      let currentNanoseconds = calendar.component(.nanosecond, from: self)
      let nanosecondsToAdd = newValue - currentNanoseconds

      if let date = calendar.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self) {
        self = date
      }
    }
  }
}
