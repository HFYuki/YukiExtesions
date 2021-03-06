//Created  on 2019/2/17 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */


import Foundation
import UIKit

public extension Yuki where Base: UIColor {
    @discardableResult
    func alpha(_ a:CGFloat) -> Yuki {
        base.withAlphaComponent(a)
        return self
    }
    
    var hex:String {
        let rgba = self.rgba
        let rs:String = String(Int(rgba.0*255), radix: 16)
        let gs:String = String(Int(rgba.1*255), radix: 16)
        let bs:String = String(Int(rgba.2*255), radix: 16)
        return "#" + rs + gs + bs
    }
    
    var rgba:(CGFloat,CGFloat,CGFloat,CGFloat) {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 1
        base.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r,g,b,a)
    }
    
    var alpha:CGFloat {
        return self.rgba.3
    }
}


public extension UIColor {
    convenience init(r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 1) {
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: a)
    }
    
    @discardableResult
    func yk_alpha(_ a:CGFloat) -> UIColor {
        return self.withAlphaComponent(a)
    }
    
    @discardableResult
    static func yk_hex(_ hex:String, dark:String? = nil) -> UIColor {
        
        func hexFit(_ hex:String) -> UIColor{
            var str: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
            if str.hasPrefix("#") {
                str = str[1..<7]
            }else if str.hasPrefix("0X") {
                str = str[2..<8]
            }
            // str[0..<6] 这是String的一个扩展需要在String扩展中找
            str = str[0..<6]
            let count = str.count
            if count%2 == 0 {
                for _ in 0..<(6-count)/2 {
                    str.append(str[count-2..<count])
                }
            }else{
                for _ in 0..<6-count {
                    str.append(str[count-1..<count])
                }
            }
            let sr = str[0..<2], sg = str[2..<4], sb = str[4..<6]
            var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
            Scanner(string: sr).scanHexInt32(&r)
            Scanner(string: sg).scanHexInt32(&g)
            Scanner(string: sb).scanHexInt32(&b)
            return UIColor(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b))
        }
        
        if #available(iOS 13.0, *) {
            return UIColor.init { (tr) -> UIColor in
                switch tr.userInterfaceStyle {
                case .light:
                    return hexFit(hex)
                case .dark:
                    return hexFit(dark ?? hex)
                default:
                    return hexFit(hex)
                }
            }
        } else {
            return hexFit(hex)
        }
    }
    
    
    var yk_hex:String {
        let rgba = self.yk_rgba
        let rs:String = String(Int(rgba.0*255), radix: 16)
        let gs:String = String(Int(rgba.1*255), radix: 16)
        let bs:String = String(Int(rgba.2*255), radix: 16)
        return "#" + rs + gs + bs
    }
    
    var yk_rgba:(CGFloat,CGFloat,CGFloat,CGFloat) {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 1
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r,g,b,a)
    }
    
    var yk_alpha:CGFloat {
        return self.yk_rgba.3
    }
}
