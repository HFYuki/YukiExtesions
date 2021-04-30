
/**** 模块说明文档 **
 * NotificationProtocol 通知管理协议 遵循此协议，更方便管理通知
 */


import Foundation
extension Notification: YukiCompatible {}

// MARK: - NotificationProtocol 通知协议用来处理通知
public protocol NotificationProtocol {
    var name: Notification.Name { get }
    func post(_ object:Any?, userInfo:[AnyHashable:Any]?)
    func add(withSelector selector: Selector, observer: Any, object: Any?)
    func add(withBlock object: Any?, queue: OperationQueue?, block:@escaping (Notification) -> Void) -> NSObjectProtocol
    func remove(_ observer: Any, object:Any?)
}

// MARK: - extension 默认实现NotificationProtocol
public extension NotificationProtocol {
    func post(_ object:Any? = nil, userInfo:[AnyHashable:Any]? = nil) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
    func add(withBlock object: Any? = nil, queue: OperationQueue? = .main, block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: name, object: object, queue: queue, using: block)
    }
    func add(withSelector selector: Selector, observer: Any, object: Any? = nil) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    func remove(_ observer: Any, object:Any? = nil) {
        NotificationCenter.default.removeObserver(observer, name: name, object: object)
    }
}

// MARK: - extension 实现空的NotificationProtocol
extension NotificationProtocol { }

// MARK: - extension 扩展Notification进行通知的操作
public extension Notification {
    
    static func post(name str:String, object:Any? = nil, userInfo:[AnyHashable : Any]? = nil) {
        Notification.post(notificationName: .name(str), object: object, userInfo: userInfo)
    }
    
    static func post(notificationName name:Notification.Name, object:Any? = nil, userInfo:[AnyHashable : Any]? = nil) {
        YuK.notice.post(name: name, object: object, userInfo: userInfo)
    }
    
    static func add(withBlock object: Any? = nil, name:String, queue: OperationQueue? = .main, block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return YuK.notice.addObserver(forName: .name(name), object: object, queue: queue, using: block)
    }
    
    static func add(withSelector selector: Selector, name:String, observer: Any, object: Any? = nil) {
        YuK.notice.addObserver(observer, selector: selector, name: .name(name), object: object)
    }
    
    static func remove(_ observer: Any, name:String = "", object:Any? = nil) {
        YuK.notice.removeObserver(observer, name: name.isEmpty ? nil : .name(name), object: object)
    }
}
public extension Notification.Name {
    static func name(_ name:String) -> Notification.Name {
        return Notification.Name(YuK.appBundleId + "." + name)
    }
}
