
/**** 模块说明文档 **
 * 时间处理
 * 参考来源：https://github.com/CaamDau
 */

import Foundation

extension Date: YukiCompatible {}
extension TimeInterval: YukiCompatible {}

public extension Yuki where Base == TimeInterval {
    /// 时间戳 转时间
    func date(_ since:Yuki<Date>.TimeSince = .s1970) -> Date {
        switch since {
        case .s1970:
            return Date(timeIntervalSince1970: base)
        case .s2001:
            return Date(timeIntervalSinceReferenceDate: base)
        case .sNow:
            return Date(timeIntervalSinceNow: base)
        case .s(let d):
            return Date(timeInterval: base, since: d)
        }
    }
    /// 时间戳 相对时间转换
    func timestamp(_ from:Yuki<Date>.TimeSince, _ to:Yuki<Date>.TimeSince) -> Yuki {
        return base.YK.date(from).YK.timestamp(to).YK
    }
}

public extension Yuki where Base == Date {
    enum TimeSince {
        case s1970
        case s2001
        case sNow
        case s(_ date:Date)
        
        var rawValue:Int {
            switch self {
            case .s1970:
                return 1970
            case .s2001:
                return 2001
            case .sNow:
                return 1
            case .s(let date):
                return Int(date.YK.timestamp())
            
            }
        }
    }
}
public extension Yuki where Base == Date {
    /// Returns the timestamp or time interval
    /// 时间戳 | 时间间隔  110.cd_date(.s2001).cd_timestamp(.sNow)
    func timestamp(_ since:TimeSince = .s1970) -> TimeInterval {
        switch since {
        case .s1970:
            return base.timeIntervalSince1970
        case .s2001:
            return base.timeIntervalSinceReferenceDate
        case .sNow:
            return base.timeIntervalSinceNow
        case .s(let d):
            return base.timeIntervalSince(d)
        }
    }
    
    /// 转时间字符串
    func time(_ format:String = "yyyy-MM-dd HH:mm:ss:SSS") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: base)
    }
    
    /// 转时间字符串
    func time(forStyle date:DateFormatter.Style = .none, time:DateFormatter.Style = .none) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = date
        formatter.timeStyle = time
        return formatter.string(from: base)
    }
    
    /// 时间 间隔
    func interval(_ to:Date, components: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second], calendar:Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(components, from: base, to: to)
    }
    
    /// 单独取得时间中的单元，
    /// 注意！当 .weekday 的时候，返回的是第几天而非周几，周日是第一天
    /// calendar 默认 Calendar.current，可指定算法
    func component(_ component:Calendar.Component, calendar:Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: base)
    }
    
    /// 转日历 取得时间中的单元组，
    func components(_ components:Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second], calendar:Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(components, from: base)
    }
    
    func count(of smaller: Calendar.Component, in larger: Calendar.Component, calendar:Calendar = Calendar.current) -> Int? {
        return calendar.range(of: smaller, in: larger, for: base)?.count
    }
}

public extension Yuki where Base == String {
    func date(_ format:String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: base)
    }
}



public extension TimeInterval {
    /// 时间戳 转时间
    func yk2_date(_ since:Yuki<Date>.TimeSince = .s1970) -> Date {
        switch since {
        case .s1970:
            return Date(timeIntervalSince1970: self)
        case .s2001:
            return Date(timeIntervalSinceReferenceDate: self)
        case .sNow:
            return Date(timeIntervalSinceNow: self)
        case .s(let d):
            return Date(timeInterval: self, since: d)
        }
    }
    /// 时间戳 相对时间转换
    func yk2_timestamp(_ from:Yuki<Date>.TimeSince, _ to:Yuki<Date>.TimeSince) -> TimeInterval {
        return self.yk2_date(from).yk2_timestamp(to)
    }
}

public extension Date {
    /// Returns the timestamp or time interval
    /// 时间戳 | 时间间隔  110.cd_date(.s2001).cd_timestamp(.sNow)
    func yk2_timestamp(_ since:Yuki<Date>.TimeSince = .s1970) -> TimeInterval {
        switch since {
        case .s1970:
            return self.timeIntervalSince1970
        case .s2001:
            return self.timeIntervalSinceReferenceDate
        case .sNow:
            return self.timeIntervalSinceNow
        case .s(let d):
            return self.timeIntervalSince(d)
        }
    }
    
    /// 转时间字符串
    func yk_time(_ format:String = "yyyy-MM-dd HH:mm:ss:SSS") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// 转时间字符串
    func yk_time(forStyle date:DateFormatter.Style = .none, time:DateFormatter.Style = .none) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = date
        formatter.timeStyle = time
        return formatter.string(from: self)
    }
    
    /// 时间 间隔
    func tk_interval(_ to:Date, components: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second], calendar:Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(components, from: self, to: to)
    }
    
    /// 单独取得时间中的单元，
    /// 注意！当 .weekday 的时候，返回的是第几天而非周几，周日是第一天
    /// calendar 默认 Calendar.current，可指定算法
    func yk_component(_ component:Calendar.Component, calendar:Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    /// 转日历 取得时间中的单元组，
    func yk_components(_ components:Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second], calendar:Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(components, from: self)
    }
    
    func yk_count(of smaller: Calendar.Component, in larger: Calendar.Component, calendar:Calendar = Calendar.current) -> Int? {
        return calendar.range(of: smaller, in: larger, for: self)?.count
    }
}

public extension String {
    func yk_date(_ format:String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}

