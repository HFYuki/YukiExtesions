//Created  on 2018/12/11  by LCD :https://github.com/liucaide .

import Foundation
import UIKit

public protocol YukiViewProtocol {
    /// T: UIView、UIGestureRecognizer、NSLayoutConstraint、[NSLayoutConstraint]、、
    func addT<T>(_ t: T?)
    
    func appendView<T:UIView>(_ type:T.Type, _ handler:((T)->Void)?)
    
    
}
extension YukiViewProtocol {
    public func addT<T>(_ t: T?){
        guard let vv = self as? UIView else { return }
        switch t {
        case let subview as UIView where vv is UIStackView:
            (vv as? UIStackView)?.addArrangedSubview(subview)
        case let subview as UIView :
            vv.addSubview(subview)
        case let ges as UIGestureRecognizer :
            vv.addGestureRecognizer(ges)
        case let lay as NSLayoutConstraint :
            vv.addConstraint(lay)
        case let lays as [NSLayoutConstraint] :
            vv.addConstraints(lays)
        default:
            break
        }
        
    }
    
    public func appendView<T>(_ type: T.Type, _ handler: ((T) -> Void)? = nil) where T : UIView {
        switch self {
        case let stack as UIStackView:
            let v = T()
            handler?(v)
            stack.addArrangedSubview(v)
        case let vv as UIView:
            let v = T()
            handler?(v)
            vv.addSubview(v)
        default:
            break
        }
    }
    
}



public extension Yuki where Base: UIView {
    @discardableResult
    func add<T>(_ t: T?) -> Yuki {
        base.addT(t)
        return self
    }
    
    @discardableResult
    func append<T:UIView>(_ type:T.Type, _ handler:((T)->Void)?) -> Yuki {
        base.appendView(type, handler)
        return self
    }
}


extension UIView: YukiViewProtocol {
    /*
    public func appendView<T>(_ type: T.Type, _ handler: ((T) -> Void)?) where T : UIView {
        self.cd.append(type, handler)
    }*/
    /*
    public func addT<T>(_ t: T?) {
        switch t {
        case let subview as UIView :
            self.addSubview(subview)
        case let ges as UIGestureRecognizer :
            self.addGestureRecognizer(ges)
        case let lay as NSLayoutConstraint :
            self.addConstraint(lay)
        case let lays as [NSLayoutConstraint] :
            self.addConstraints(lays)
        default:
            break
        }
    }*/
}


public extension Yuki where Base: UIView {
    @discardableResult
    func frame(_ a: CGRect) -> Yuki {
        base.frame = a
        return self
    }
    @discardableResult
    func frame(x: CGFloat = 0, y: CGFloat = 0, w: CGFloat = 0, h: CGFloat = 0) -> Yuki {
        base.frame = CGRect(x: x, y: y, width: w, height: h)
        return self
    }
    @discardableResult
    func bounds(_ a: CGRect) -> Yuki {
        base.bounds = a
        return self
    }
    @discardableResult
    func bounds(w: CGFloat = 0, h: CGFloat = 0) -> Yuki {
        base.bounds = CGRect(x: 0, y: 0, width: w, height: h)
        return self
    }
    
    @discardableResult
    func center(_ a: CGPoint) -> Yuki {
        base.center = a
        return self
    }
    
    @discardableResult
    func center(x: CGFloat = 0, y: CGFloat = 0) -> Yuki {
        base.center = CGPoint(x: x, y: y)
        return self
    }
    @discardableResult
    func tag(_ a: Int) -> Yuki {
        base.tag = a
        return self
    }
    @discardableResult
    func background(_ color: UIColor?) -> Yuki {
        base.backgroundColor = color
        return self
    }
    
    @discardableResult
    func alpha(_ a: CGFloat) -> Yuki {
        base.alpha = a
        return self
    }
    
    @discardableResult
    func content(_ mode: UIView.ContentMode) -> Yuki {
        base.contentMode = mode
        return self
    }
    
    @discardableResult
    func isHidden(_ a: Bool) -> Yuki {
        base.isHidden = a
        return self
    }
    
    @discardableResult
    func isOpaque(_ a: Bool) -> Yuki {
        base.isOpaque = a
        return self
    }
    
    @discardableResult
    func isUser(_ interactionEnabled: Bool) -> Yuki {
        base.isUserInteractionEnabled = interactionEnabled
        return self
    }
    
    @discardableResult
    func tint(_ color: UIColor) -> Yuki {
        base.tintColor = color
        return self
    }
    
    @discardableResult
    func corner(_ radius: CGFloat) -> Yuki {
        base.layer.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func clips(_ toBounds: Bool) -> Yuki {
        base.clipsToBounds = toBounds
        return self
    }
    
    @discardableResult
    func corner(_ radius:CGFloat, clips: Bool = true) -> Yuki {
        base.layer.cornerRadius = radius
        base.clipsToBounds = clips
        return self
    }
    
    @discardableResult
    func masks(_ toBounds: Bool) -> Yuki {
        base.layer.masksToBounds = toBounds
        return self
    }
    
    @discardableResult
    func border(_ width: CGFloat) -> Yuki {
        base.layer.borderWidth = width
        return self
    }
    
    @discardableResult
    func border(_ color: UIColor) -> Yuki {
        base.layer.borderColor = color.cgColor
        return self
    }
    
    @discardableResult
    func border(_ width:CGFloat, color: UIColor) -> Yuki {
        base.layer.borderWidth = width
        base.layer.borderColor = color.cgColor
        return self
    }
    
    @discardableResult
    func shadow(_ path: CGPath) -> Yuki {
        base.layer.shadowPath = path
        return self
    }
    
    @discardableResult
    func shadow(_ color: UIColor) -> Yuki {
        base.layer.shadowColor = color.cgColor
        return self
    }
    
    @discardableResult
    func shadow(_ opacity: Float) -> Yuki {
        base.layer.shadowOpacity = opacity
        return self
    }
    
    @discardableResult
    func shadow(_ offset: CGSize) -> Yuki {
        base.layer.shadowOffset = offset
        return self
    }
    
    @discardableResult
    func shadow( w:CGFloat = 0, h:CGFloat = 0) -> Yuki {
        base.layer.shadowOffset = CGSize(width: w, height: h)
        return self
    }
    
    @discardableResult
    func shadow(_ radius: CGFloat) -> Yuki {
        base.layer.shadowRadius = radius
        return self
    }
    
    @discardableResult
    func shadow(_ path: CGPath?) -> Yuki {
        base.layer.shadowPath = path
        return self
    }
    /// 阴影
    @discardableResult
    func shadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) -> Yuki {
        base.layer.shadowColor = color.cgColor
        base.layer.shadowOffset = offset
        base.layer.shadowOpacity = opacity
        base.layer.shadowRadius = radius
        return self
    }
    /// 变形属性(平移\缩放\旋转)
    @discardableResult
    func transform(_ a: CGAffineTransform) -> Yuki {
        base.transform = a
        return self
    }
    /// 自动调整子视图尺寸，默认YES则会根据autoresizingMask属性自动调整子视图尺寸
    @discardableResult
    func autoresizes(_ subviews: Bool) -> Yuki {
        base.autoresizesSubviews = subviews
        return self
    }
    /// 自动调整子视图与父视图的位置，默认UIViewAutoresizingNone
    @discardableResult
    func autoresizing(_ mask: UIView.AutoresizingMask) -> Yuki {
        base.autoresizingMask = mask
        return self
    }
    
    /// 圆角
    @discardableResult
    func rounded(_ corners:UIRectCorner, _ radii:CGSize) -> Yuki {
        return self.rounded(base.bounds, corners, radii)
    }
    
    /// 圆角
    @discardableResult
    func rounded(_ rect:CGRect, _ corners:UIRectCorner, _ radii:CGSize) -> Yuki {
        let rounded = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: radii)
        let shape = CAShapeLayer()
        shape.path = rounded.cgPath
        base.layer.mask = shape
        return self
    }
    
    /// 背景线性渐变 默认横向渐变 point -> 0 - 1
    /// let gradients:[(UIColor,Float)] = [(UIColor.red,0),(UIColor.yellow,1)]
    /// view.cd.gradient(layer: gradients)
    /// 文字渐变 view.gradient(layerAxial: ..., then:{ layer in layer.mask = label.layer })
    @discardableResult
    func gradient(layerAxial gradients:[(color:UIColor,location:Float)], point:(start:CGPoint, end:CGPoint) = (start:CGPoint(x: 0, y: 0), end:CGPoint(x: 1, y: 0)), at: UInt32 = 0, updateIndex:Int? = nil, then:((CAGradientLayer)->Void)? = nil) -> Yuki {
        
        func gradient(_ layer:CAGradientLayer) {
            base.layoutIfNeeded()
            layer.colors = gradients.map{$0.color.cgColor}
            layer.locations = gradients.map{NSNumber(value:$0.location)}
            layer.startPoint = point.start
            layer.endPoint = point.end
            layer.frame = base.bounds
        }
        
        let layers:[CAGradientLayer] = base.layer.sublayers?.filter{$0.isKind(of: CAGradientLayer.self)}.map{$0} as? [CAGradientLayer] ?? []
        if layers.count <= at {
            let layer = CAGradientLayer()
            gradient(layer)
            base.layer.insertSublayer(layer, at: at)
            then?(layer)
        }else{
            let layer = layers[updateIndex ?? 0]
            gradient(layers[updateIndex ?? 0])
            then?(layer)
        }
        return self
    }
    /// 放射性渐变
    class GradientLayer:CALayer {
        open var point: CGPoint = CGPoint.zero
        open var colorSpace = CGColorSpaceCreateDeviceRGB()
        open var locations:[CGFloat] = [0.0, 1.0]
        open var colors:[CGFloat] = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0]
        open lazy var radius: CGFloat = {
            return Swift.max(self.bounds.size.width, self.bounds.size.height)
        }()
        override open func draw(in ctx: CGContext) {
            guard let gradient = CGGradient(colorSpace: colorSpace, colorComponents: colors, locations: locations, count: locations.count) else {
                return
            }
            ctx.drawRadialGradient(gradient, startCenter: point, startRadius: 0, endCenter: point, endRadius: radius, options: .drawsAfterEndLocation)
        }
    }
    /// 背景放射性渐变
    @discardableResult
    func gradient(layerRadial gradients:[(color:UIColor,location:CGFloat)], point:CGPoint = CGPoint(x: 0, y: 0), radius:CGFloat? = nil, at: UInt32 = 0, updateIndex:Int? = nil, then:((GradientLayer)->Void)? = nil) -> Yuki {
        
        func gradient(_ layer:GradientLayer) {
            base.layoutIfNeeded()
            layer.locations = gradients.map{$0.location}
            layer.colors =  Array(gradients.map({ (c) -> [CGFloat] in
                let cc = c.color.yk_rgba
                return [cc.0,cc.1,cc.2,cc.3]
            }).joined())
            layer.frame = base.bounds
            layer.point = point
            layer.radius = radius ?? Swift.max(base.bounds.size.width, base.bounds.size.height)
            layer.setNeedsDisplay()
        }
        
        let layers:[GradientLayer] = base.layer.sublayers?.filter{$0.isKind(of: GradientLayer.self)}.map{$0} as? [GradientLayer] ?? []
        if layers.count <= at {
            let layer = GradientLayer()
            gradient(layer)
            base.layer.insertSublayer(layer, at: at)
            then?(layer)
        }else{
            let layer = layers[updateIndex ?? 0]
            gradient(layer)
            then?(layer)
        }
        return self
    }
    
    /// 毛玻璃效果 view.blurEffect(UIColor.red.withAlphaComponent(0.5))
    @discardableResult
    func blurEffect(_ color:UIColor = UIColor.clear,  style:UIBlurEffect.Style = .light, block:((UIVisualEffectView) -> Void)? = nil) -> Yuki {
        base.layoutIfNeeded()
        base.backgroundColor = UIColor.clear
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.backgroundColor = color
        blurEffectView.frame = base.bounds
        base.addSubview(blurEffectView)
        base.sendSubviewToBack(blurEffectView)
        block?(blurEffectView)
        return self
    }
    
    ///
    @discardableResult
    func then(_ block:(Base) -> Void) -> Yuki {
        block(base)
        return self
    }
    
    
    
    @discardableResult
    func insert(_ subview:UIView, at index:Int = 0) -> Yuki {
        base.insertSubview(subview, at: index)
        return self
    }
    
    @discardableResult
    func insert(_ subview:UIView, below view:UIView) -> Yuki {
        base.insertSubview(subview, belowSubview: view)
        return self
    }
    @discardableResult
    func insert(_ subview:UIView, above view:UIView) -> Yuki {
        base.insertSubview(subview, aboveSubview: view)
        return self
    }
    
    @discardableResult
    func exchange(_ subview1:Int, _ subview2:Int) -> Yuki {
        base.exchangeSubview(at: subview1, withSubviewAt: subview2)
        return self
    }
    
    @discardableResult
    func bring(subviewToFront view:UIView) -> Yuki {
        base.bringSubviewToFront(view)
        return self
    }
    
    @discardableResult
    func send(subviewToBack view:UIView) -> Yuki {
        base.sendSubviewToBack(view)
        return self
    }
    
    @discardableResult
    func add(toSuperview view:UIView) -> Yuki {
        view.addSubview(base)
        return self
    }
    
    @discardableResult
    func insert(toSuperview view:UIView, at index:Int) -> Yuki {
        view.insertSubview(base, at: index)
        return self
    }
    
    @discardableResult
    func insert(toSuperview superview:UIView, below view:UIView) -> Yuki {
        superview.insertSubview(base, belowSubview: view)
        return self
    }
    @discardableResult
    func insert(toSuperview superview:UIView, above view:UIView) -> Yuki {
        superview.insertSubview(base, aboveSubview: view)
        return self
    }
    
    @discardableResult
    func exchange(_ view:UIView) -> Yuki {
        guard let idx1 = base.superview?.subviews.firstIndex(of: base),
            let idx2 = base.superview?.subviews.firstIndex(of: view) else {
            return self
        }
        base.superview?.exchangeSubview(at: idx1, withSubviewAt: idx2)
        return self
    }
    
    @discardableResult
    func bringToFront() -> Yuki {
        base.superview?.bringSubviewToFront(base)
        return self
    }
    
    @discardableResult
    func sendToBack() -> Yuki {
        base.superview?.sendSubviewToBack(base)
        return self
    }
    
    @discardableResult
    func add(toSuperstack stack:UIStackView) -> Yuki {
        stack.addArrangedSubview(base)
        return self
    }
    @discardableResult
    func insert(toSuperstack stack:UIStackView, at index:Int) -> Yuki {
        stack.insertArrangedSubview(base, at: index)
        return self
    }
    
    @discardableResult
    func removeFromSuperview() -> Yuki {
        base.removeFromSuperview()
        return self
    }
    
    @discardableResult
    func remove(subview view:UIView) -> Yuki {
        base.subviews
            .filter{ $0 == view }
            .forEach{ $0.removeFromSuperview() }
        return self
    }
    
    @discardableResult
    func remove(subviews views:[UIView]) -> Yuki {
        base.subviews
            .filter{ views.contains($0)}
            .forEach{ $0.removeFromSuperview() }
        return self
    }
}

//MARK:--- 返回非 self 将中断链式 ----------
public extension Yuki where Base: UIView{
    func vc() -> UIViewController? {
        var next:UIResponder? = base
        repeat {
            next = next?.next
            if let vc = next as? UIViewController {
                return vc
            }
        }while next != nil
        return nil
    }
    
    /// 截图
    var cutImage:UIImage? {
        base.layoutIfNeeded()
        UIGraphicsBeginImageContextWithOptions(base.frame.size, true, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        base.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return image
    }
}


public extension Yuki where Base: UIScrollView {
    /// 截长图
    var cutImageLong:UIImage? {
        base.layoutIfNeeded()
        let savedContentOffset = base.contentOffset
        let savedFrame = base.frame
        base.contentOffset = .zero
        base.frame = CGRect(x: 0, y: 0, width: base.contentSize.width, height: base.contentSize.height)
        guard let image = base.YK.cutImage else {
            base.contentOffset = savedContentOffset
            base.frame = savedFrame
            return nil
        }
        base.contentOffset = savedContentOffset
        base.frame = savedFrame
        return image
    }
}




extension UIView{
    public static func cd_loadNib(_ name:String? = nil, from:String? = nil, owner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> [Any]? {
        let bundle = Bundle.yk_bundle(self, from) ?? Bundle.main
        return bundle.loadNibNamed(name ?? String(describing: self), owner: owner, options: options)
    }
}

