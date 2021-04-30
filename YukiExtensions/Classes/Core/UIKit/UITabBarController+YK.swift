//Created  on 2019/7/1 by  Lyk:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */




import Foundation
import UIKit


public extension Yuki where Base: UITabBarController {
    @discardableResult
    func add(_ vc:UIViewController) -> Yuki {
        base.addChild(vc)
        return self
    }
    
    @discardableResult
    func viewControllers(_ vc:[UIViewController]) -> Yuki {
        base.viewControllers = vc
        return self
    }
}


public extension Yuki where Base: UITabBar {
    
    /// 去掉tabBar顶部线条
    @discardableResult
    func hideLine() -> Yuki {
       
        let rect = CGRect(x: 0, y: 0, width: base.bounds.size.width, height: 0.5)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.clear.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        base.backgroundImage = image
        base.shadowImage = image
        return self
    }
    
    /// 简单添加顶部阴影  background 默认使用 barTintColor，如果 barTintColor 为clear 的话，不会显示阴影，需要设置一个background
    @discardableResult
    func addShadowLine(_ color:UIColor = UIColor.yk_hex("d3", dark:"f0"), backgroundColor bgColor:UIColor? = nil, layout:((UIView)->Void)? = nil) -> Yuki {
        self.hideLine()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: base.frame.size.width, height: 0.5))
            .YK
            .background(bgColor ?? base.barTintColor)
            .shadow(color)
            .shadow(CGSize(width: 0, height: -2))
            .shadow(CGFloat(2.0))
            .shadow(Float(0.8))
            .clips(false)
            .build
        base.YK
            .add(view)
            .clips(false)
        layout?(view)
        return self
    }
    
    
    @discardableResult
    func isTranslucent(_ b:Bool) -> Yuki {
        base.isTranslucent = b
        return self
    }
    
    @discardableResult
    func barTintColor(_ b:UIColor) -> Yuki {
        base.barTintColor = b
        return self
    }
    
    
    @discardableResult
    func addTabBarItem(_ item:UITabBarItem) -> Yuki {
        base.items?.append(item)
        return self
    }
    
    @discardableResult
    func tabBarItems(_ items:[UITabBarItem]) -> Yuki {
        base.items = items
        return self
    }

    @discardableResult
    func imageInsets(_ t:[UIEdgeInsets]) -> Yuki {
        base.yk_imageInsets = t
        return self
    }
    
    @discardableResult
    func imageNormals(_ t:[UIImage?]) -> Yuki {
        base.yk_imageNormals = t
        return self
    }
    
    @discardableResult
    func imageSelects(_ t:[UIImage?]) -> Yuki {
        base.yk_imageSelects = t
        return self
    }
    @discardableResult
    func titles(_ t:[String?]) -> Yuki {
        base.yk_titles = t
        return self
    }
    @discardableResult
    func badges(_ t:[String?]) -> Yuki {
        base.yk_badges = t
        return self
    }
    
    @discardableResult @available(iOS 10.0, *)
    func badgeColors(_ t:[UIColor?]) -> Yuki {
        base.yk_badgeColors = t
        return self
    }
    
    @discardableResult
    func colorNormals(_ t:[UIColor?]) -> Yuki {
        base.yk_colorNormals = t
        return self
    }
    @discardableResult
    func colorSelecteds(_ t:[UIColor?]) -> Yuki {
        base.yk_colorSelecteds = t
        return self
    }
    
    
    @discardableResult
    func colorHighlighteds(_ t:[UIColor?]) -> Yuki {
        base.yk_colorHighlighteds = t
        return self
    }
    @discardableResult
    func fontNormals(_ t:[UIFont?]) -> Yuki {
        base.yk_fontNormals = t
        return self
    }
    @discardableResult
    func fontSelecteds(_ t:[UIFont?]) -> Yuki {
        base.yk_fontSelecteds = t
        return self
    }
    
    @discardableResult
    func fontHighlighteds(_ t:[UIFont?]) -> Yuki {
        base.yk_fontHighlighteds = t
        return self
    }
    @discardableResult @available(iOS 10.0, *)
    func badgeColorNormals(_ t:[UIColor?]) -> Yuki {
        base.yk_badgeColorNormals = t
        return self
    }
    @discardableResult @available(iOS 10.0, *)
    func badgeColorSelecteds(_ t:[UIColor?]) -> Yuki {
        base.yk_badgeColorSelecteds = t
        return self
    }
    @discardableResult @available(iOS 10.0, *)
    func badgeColorHighlighteds(_ t:[UIColor?]) -> Yuki {
        base.yk_badgeColorHighlighteds = t
        return self
    }
    
    @discardableResult @available(iOS 10.0, *)
    func badgeFontNormals(_ t:[UIFont?]) -> Yuki {
        base.yk_badgeFontNormals = t
        return self
    }
    
    
    @discardableResult @available(iOS 10.0, *)
    func badgeFontSelecteds(_ t:[UIFont?]) -> Yuki {
        base.yk_badgeFontSelecteds = t
        return self
    }
    
    
    @discardableResult @available(iOS 10.0, *)
    func badgeFontHighlighteds(_ t:[UIFont?]) -> Yuki {
        base.yk_badgeFontHighlighteds = t
        return self
    }
    
    @discardableResult
    func color(_ normals:[UIColor?] = [], selecteds:[UIColor?] = [], highlighteds:[UIColor?] = []) -> Yuki {
        base.yk_colorNormals = normals
        base.yk_colorSelecteds = selecteds
        base.yk_colorHighlighteds = highlighteds
        if #available(iOS 10.0, *) {
            base.yk_badgeColorNormals = normals
            base.yk_badgeColorSelecteds = selecteds
            base.yk_badgeColorHighlighteds = highlighteds
        } else {
            
        }
        return self
    }
    
    @discardableResult
    func font(_ normals:[UIFont?] = [], selecteds:[UIFont?] = [], highlighteds:[UIFont?] = []) -> Yuki {
        base.yk_fontNormals = normals
        base.yk_fontSelecteds = selecteds
        base.yk_fontHighlighteds = highlighteds
        if #available(iOS 10.0, *) {
            base.yk_badgeFontNormals = normals
            base.yk_badgeFontSelecteds = selecteds
            base.yk_badgeFontHighlighteds = highlighteds
        } else {
            
        }
        return self
    }
    
    //MARK:--- badge ----------
    @discardableResult
    func setTitle<T>(_ value:[T?], key:NSAttributedString.Key, for state: UIControl.State) -> Yuki {
        guard let items = base.items else { return self}
        for (i, item) in items.enumerated() where i < value.count && value[i] != nil {
            if var attributes = item.titleTextAttributes(for: state) {
                attributes[key] = value[i]
                item.setTitleTextAttributes(attributes, for:state)
            }else{
                item.setTitleTextAttributes([key:value[i]!], for:state)
            }
        }
        return self
    }
    
    func getTitle<T>(_ key:NSAttributedString.Key, for state: UIControl.State) -> [T?] {
        let fonts = base.items?.map({ (item) -> T? in
            guard let attributes = item.titleTextAttributes(for: state) else { return nil }
            guard let font = attributes[key] as? T else{ return nil }
            return font
        })
        return fonts ?? []
    }
    
    
    @discardableResult @available(iOS 10.0, *)
    func setBadge<T>(_ value:[T?], key:NSAttributedString.Key, for state: UIControl.State) -> Yuki {
        guard let items = base.items else { return self}
        for (i, item) in items.enumerated() where i < value.count && value[i] != nil {
            if var attributes = item.badgeTextAttributes(for: state) {
                attributes[key] = value[i]
                item.setBadgeTextAttributes(attributes, for:state)
            }else{
                item.setBadgeTextAttributes([key:value[i]!], for:state)
            }
        }
        return self
    }
    
    @available(iOS 10.0, *)
    func getBadge<T>(_ key:NSAttributedString.Key, for state: UIControl.State) -> [T?] {
        let fonts = base.items?.map({ (item) -> T? in
            guard let attributes = item.badgeTextAttributes(for: state) else { return nil }
            guard let font = attributes[key] as? T else{ return nil }
            return font
        })
        return fonts ?? []
    }
}

public extension UITabBar {
    var yk_imageNormals:[UIImage?] {
        set{
            guard let items = self.items else { return }
            for (i, item) in items.enumerated() where i < newValue.count {
                if let img = newValue[i] {
                    item.image = img.withRenderingMode(.alwaysOriginal)
                }
            }
        }
        get{
            return self.items?.map{$0.image} ?? []
        }
    }
    
    var yk_imageSelects:[UIImage?] {
        set{
            guard let items = self.items else { return }
            for (i, item) in items.enumerated() where i < newValue.count {
                if let img = newValue[i] {
                    item.selectedImage = img.withRenderingMode(.alwaysOriginal)
                }
            }
        }
        get{
            return self.items?.map{$0.selectedImage} ?? []
        }
    }
    
    /// 矫正TabBar图片位置
    var yk_imageInsets:[UIEdgeInsets] {
        set{
            guard let items = self.items else { return }
            for (i, item) in items.enumerated() where i < newValue.count {
                item.imageInsets = newValue[i]
            }
        }
        get{
            return self.items?.map{$0.imageInsets} ?? []
        }
    }
    
    var yk_titles:[String?] {
        set{
            guard let items = self.items else { return }
            for (i, item) in items.enumerated() where i < newValue.count {
                item.title = newValue[i]
            }
        }
        get{
            return self.items?.map{$0.title} ?? []
        }
    }
    
    var yk_badges:[String?] {
        set{
            guard let items = self.items else { return }
            for (i, item) in items.enumerated() where i < newValue.count {
                item.badgeValue = newValue[i]
            }
        }
        get{
            return self.items?.map{$0.badgeValue} ?? []
        }
    }
    
    @available(iOS 10.0, *)
    var yk_badgeColors:[UIColor?] {
        set{
            guard let items = self.items else { return }
            for (i, item) in items.enumerated() where i < newValue.count {
                item.badgeColor = newValue[i]
            }
        }
        get{
            return self.items?.map{$0.badgeColor} ?? []
        }
    }
    
    
    
    var yk_colorNormals:[UIColor?] {
        set{
            self.YK.setTitle(newValue, key: .foregroundColor, for: .normal)
        }
        get{
            return self.YK.getTitle(.foregroundColor, for: .normal)
        }
    }
    
    
    var yk_colorSelecteds:[UIColor?] {
        set{
            self.YK.setTitle(newValue, key: .foregroundColor, for: .selected)
        }
        get{
            return self.YK.getTitle(.foregroundColor, for: .selected)
        }
    }
    
    
    var yk_colorHighlighteds:[UIColor?] {
        set{
            self.YK.setTitle(newValue, key: .foregroundColor, for: .highlighted)
        }
        get{
            return self.YK.getTitle(.foregroundColor, for: .highlighted)
        }
    }
    
    var yk_fontNormals:[UIFont?] {
        set{
            self.YK.setTitle(newValue, key: .font, for: .normal)
        }
        get{
            return self.YK.getTitle(.font, for: .normal)
        }
    }
    
    
    var yk_fontSelecteds:[UIFont?] {
        set{
            self.YK.setTitle(newValue, key: .font, for: .selected)
        }
        get{
            return self.YK.getTitle(.font, for: .selected)
        }
    }
    
    
    var yk_fontHighlighteds:[UIFont?] {
        set{
            self.YK.setTitle(newValue, key: .font, for: .highlighted)
        }
        get{
            return self.YK.getTitle(.font, for: .highlighted)
        }
    }
    
    //MARK:--- badge ----------
    
    @available(iOS 10.0, *)
    var yk_badgeColorNormals:[UIColor?] {
        set{
            self.YK.setBadge(newValue, key: .foregroundColor, for: .normal)
        }
        get{
            return self.YK.getBadge(.foregroundColor, for: .normal)
        }
    }
    
    @available(iOS 10.0, *)
    var yk_badgeColorSelecteds:[UIColor?] {
        set{
            self.YK.setBadge(newValue, key: .foregroundColor, for: .selected)
        }
        get{
            return self.YK.getBadge(.foregroundColor, for: .selected)
        }
    }
    
    @available(iOS 10.0, *)
    var yk_badgeColorHighlighteds:[UIColor?] {
        set{
            self.YK.setBadge(newValue, key: .foregroundColor, for: .highlighted)
        }
        get{
            return self.YK.getBadge(.foregroundColor, for: .highlighted)
        }
    }
    
    @available(iOS 10.0, *)
    var yk_badgeFontNormals:[UIFont?] {
        set{
            self.YK.setBadge(newValue, key: .font, for: .normal)
        }
        get{
            return self.YK.getBadge(.font, for: .normal)
        }
    }
    @available(iOS 10.0, *)
    var yk_badgeFontSelecteds:[UIFont?] {
        set{
            self.YK.setBadge(newValue, key: .font, for: .selected)
        }
        get{
            return self.YK.getBadge(.font, for: .selected)
        }
    }
    @available(iOS 10.0, *)
    var yk_badgeFontHighlighteds:[UIFont?] {
        set{
            self.YK.setBadge(newValue, key: .font, for: .highlighted)
        }
        get{
            return self.YK.getBadge(.font, for: .highlighted)
        }
    }
    
    
}
