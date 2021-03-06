//Created  on 2019/6/26 by  LCD:https://github.com/liucaide .

/**** 模块说明文档 **
 * 扩充常用方法
 */


import Foundation

//MARK:--- 打印 ----------
public var yk_printOpen:Bool = true
#if DEBUG
public func print_yk(_ items: Any..., file:Any = #file, function:Any = #function, line: Any = #line){
    guard yk_printOpen else { return }
    debugPrint("--- 开始打印 👉👉👉")
    debugPrint(file, function, line)
    debugPrint(items)
    debugPrint("--- 打印结束 👻👻👻")
}
#else
public func print_cd(_ items: Any...){}
#endif

#if DEBUG
public func print_address(_ value:AnyObject){
    guard yk_printOpen else { return }
    debugPrint("---👉👉👉 内存地址-->", value)
    debugPrint(Unmanaged.passUnretained(value).toOpaque())
    debugPrint("--- 打印结束 👻👻👻")
}
#else
public func print_address(_ value:AnyObject){}
#endif

//MARK:--- 耗时 ----------
/// 耗时
public func cd_timeConsuming(_ name:String = " 👻👉👉耗时：", call:(()->Void)? = nil) {
    //let startTime = CFAbsoluteTimeGetCurrent()
    //let endTime = CACurrentMediaTime()
    let start = CACurrentMediaTime()
    call?()
    let end = CACurrentMediaTime()
    print_yk(name, String(format: "%.7f", (end - start)*1000))
}


extension YuK {
    public enum DeviceFit {
        case iPhone320
        case iPhone375
        case iPhone414
        case iPad
        case iTV
        case iCarPlay
        case iUnspecified
        
        public static var mode:YuK.DeviceFit {
            func iPhoneToWidth() -> YuK.DeviceFit {
                if YuK.screenW<=320.0{return iPhone320}
                if YuK.screenW>320.0 && YuK.screenW<=375.0
                {return iPhone375}
                return iPhone414
            }
            switch UIDevice.current.userInterfaceIdiom {
            case .pad:
                return .iPad
            case .phone:
                return iPhoneToWidth()
            case .tv:
                return .iTV
            case .carPlay:
                return .iCarPlay
            default:
                return iPhoneToWidth()
            }
        }
    }
    
    /// 设备类型
    public enum Device {
        /// 4及4一下系列
        case iPhone4
        /// 5及se pod 系列
        case iPhoneSE
        /// 6.7.8...及系列
        case iPhoneA
        /// plus...及系列
        case iPhoneP
        /// X...及系列
        case iPhoneX
        case iPad
        case iTV
        case iCarPlay
        case iUnspecified
        
        public static var mode:YuK.Device {
            func iPhoneToSize() -> YuK.Device {
                if YuK.screenH<=480.0 {return .iPhone4}
                if (YuK.screenW==320.0 && YuK.screenH==568.0)
                    || (YuK.screenH==320.0 && YuK.screenW==568.0)
                {return .iPhoneSE}
                if (YuK.screenW==375.0 && YuK.screenH==667.0)
                    || (YuK.screenH==375.0 && YuK.screenW==667.0)
                {return .iPhoneA}
                if (YuK.screenW==414.0 && YuK.screenH==736.0)
                    || (YuK.screenH==414.0 && YuK.screenW==736.0)
                {return .iPhoneP}
                return .iPhoneX
            }
            func iphone() -> YuK.Device {
                if #available(iOS 11.0, *) {
                    if let b = YuK.window?.safeAreaInsets.bottom, b > 0 {
                        return .iPhoneX
                    }else{
                        return iPhoneToSize()
                    }
                } else {
                    return iPhoneToSize()
                }
            }
            
            switch UIDevice.current.userInterfaceIdiom {
            case .pad:
                return .iPad
            case .phone:
                return iphone()
            case .tv:
                return .iTV
            case .carPlay:
                return .iCarPlay
            default:
                return iphone()
            }
        }
        
        
        static var modeSys:YuK.Device {
            return YuK.Device.mode
        }
    }
}




public struct YuK {
    public static var window:UIWindow? {
        return UIApplication.shared.delegate?.window ?? UIApplication.shared.keyWindow ?? nil
    }
    
    public static var screenSize:CGSize {
        return UIScreen.main.bounds.size
    }
    
    public static var screenW:CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    public static var screenH:CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    public static var sysNavigationH:CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.statusBarFrame.size.height + (YuK.visibleVC?.navigationController?.navigationBar.frame.size.height ?? 44)
        } else {
            return 20.0 + (YuK.visibleVC?.navigationController?.navigationBar.frame.size.height ?? 44)
        }
    }
    
    public static var sysTabBarH:CGFloat {
        return YuK.visibleVC?.tabBarController?.tabBar.frame.size.height ?? 59
    }
    
    public static var sectionMinH:CGFloat {
        return 0.001
    }
    
    public static var sysVersion:String {
        return UIDevice.current.systemVersion
    }
    
    public static var isSimulator:Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    public static var notice:NotificationCenter {
        return NotificationCenter.default
    }
    
    public static var userde:UserDefaults {
        return UserDefaults.standard
    }
    
    public static var timestampNow:TimeInterval {
        return Date().timeIntervalSince1970
    }
    
    public static var appVersion:String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    }
    public static var appBundleId:String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    public static func atoz(_ capitalized:Bool = false) -> [String] {
        let az = (97...122).compactMap{String(UnicodeScalar($0))}
        return capitalized ? az.compactMap{$0.capitalized} : az
    }
    
    public static func appUrlScheme(_ match:String) -> String {
        guard let info = Bundle.main.infoDictionary else { return match }
        let urlTypes = info.arrayValue("CFBundleURLTypes")
        for item in urlTypes {
            guard let j = item as? [String:Any] else { continue }
            guard let s = j.arrayValue("CFBundleURLSchemes").first as? String else { continue }
            guard s.hasPrefix(match) else { continue }
            return s
        }
        return match
    }
    
    /// app 安装日期
    public static var appCreatDate:Date? {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            return nil
        }
        guard let dates = try? FileManager.default.attributesOfItem(atPath: url.path) else {
            return nil
        }
        return dates[FileAttributeKey.creationDate] as? Date ?? nil
    }
    /// app 更新日期
    public static var appUpdateDate:Date? {
        guard let info = Bundle.main.path(forResource: "Info", ofType: "plist") else {
            return nil
        }
        let url = URL(fileURLWithPath: info, isDirectory: true)
        let path = url.deletingLastPathComponent().relativePath
        guard let dates = try? FileManager.default.attributesOfItem(atPath: path) else {
            return nil
        }
        return dates[FileAttributeKey.modificationDate] as? Date ?? nil
    }
    
    
    public static var visibleVC:UIViewController? {
        func visibleVC(_ vc: UIViewController? = nil) -> UIViewController? {
            if let nv = vc as? UINavigationController
            {
                return visibleVC(nv.visibleViewController)
            } else if let tb = vc as? UITabBarController,
                let select = tb.selectedViewController
            {
                return visibleVC(select)
            } else if let presented = vc?.presentedViewController {
                return visibleVC(presented)
            }
            return vc
        }
        let vc = YuK.window?.rootViewController
        return visibleVC(vc)
    }
    
    public static var topVC:UIViewController? {
        func topVC(_ vc: UIViewController? = nil) -> UIViewController? {
            let vc = vc ?? YuK.window?.rootViewController
            if let nv = vc as? UINavigationController,
                !nv.viewControllers.isEmpty
            {
                return topVC(nv.topViewController)
            }
            if let tb = vc as? UITabBarController,
                let select = tb.selectedViewController
            {
                return topVC(select)
            }
            if let _ = vc?.presentedViewController, let nvc = YuK.visibleVC?.navigationController {
                
                return topVC(nvc)
            }
            return vc
        }
        let vc = YuK.window?.rootViewController
        return topVC(vc)
    }
    
    
    public static func iOSAdjustmentBehavior() {
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
            UICollectionView.appearance().contentInsetAdjustmentBehavior = .never
            /// 高度自适应会失效，需要高度自适应的tableView 需重新设置
            UITableView.appearance().contentInsetAdjustmentBehavior = .never
            UITableView.appearance().estimatedRowHeight = 0
            UITableView.appearance().estimatedSectionHeaderHeight = 0
            UITableView.appearance().estimatedSectionFooterHeight = 0
        } else {
            
        }
    }
    
    public static func present(_ vc:UIViewController, animated: Bool = true, from:UIViewController? = YuK.visibleVC, completion: (() -> Void)? = nil) {
        from?.present(vc, animated: animated, completion: completion)
    }
    
    public static func dismiss(_ animated: Bool = true, from:UIViewController? = YuK.visibleVC, completion: (() -> Void)? = nil) {
        from?.dismiss(animated: animated, completion: nil)
    }
    
    public static func push(_ vc:UIViewController, animated: Bool = true, from:UIViewController? = YuK.visibleVC) {
        if let nvc = from?.navigationController {
            vc.hidesBottomBarWhenPushed = true
            nvc.pushViewController(vc, animated: animated)
        }else{
            from?.present(vc, animated: animated, completion: nil)
        }
    }
    
    public static func pop(_ animated: Bool = true, from:UIViewController? = YuK.visibleVC) {
        if let nvc = from?.navigationController, let _ = nvc.popViewController(animated: animated) {
        }else{
            from?.dismiss(animated: animated, completion: nil)
        }
    }
    
    public static func classFrom(string name: String, forClass: AnyClass? = nil) -> AnyClass? {
        let bundle = forClass == nil ? Bundle.main : Bundle(for: forClass!)
        guard let app:String = bundle.infoDictionary!["CFBundleExecutable"] as? String else {
            // 命名空间不存在
            return NSClassFromString(name)
        }
        // 2.通过命名空间和类名转换成类
        let str = "_TtC\(app.count)\(app)\(name.count)\(name)"
        let cla:AnyClass? = NSClassFromString(str)
        return cla
    }
}
