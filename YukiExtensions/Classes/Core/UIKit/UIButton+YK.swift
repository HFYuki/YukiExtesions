
import Foundation
import UIKit

public extension Yuki where Base: UIButton {
    @discardableResult
    ///addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)
    func target(add target: Any?, action: Selector, event: UIControl.Event = .touchUpInside) -> Yuki {
        base.addTarget(target, action: action, for: event)
        return self
    }
    
    func target(remove target: Any?, action: Selector, event: UIControl.Event = .touchUpInside) -> Yuki {
        base.removeTarget(target, action: action, for: event)
        return self
    }
    
    @discardableResult
    func select(_ b: Bool) -> Yuki {
        base.isSelected = b
        return self
    }
    
    @discardableResult
    func line(breakMode mode: NSLineBreakMode) -> Yuki {
        base.titleLabel?.lineBreakMode = mode
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?, for state:UIControl.State = .normal) -> Yuki {
        base.setImage(image, for: state)
        return self
    }
    @discardableResult
    func background(_ image: UIImage?, for state:UIControl.State = .normal) -> Yuki {
        base.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func attributed(_ title: NSAttributedString, for state:UIControl.State = .normal) -> Yuki {
        base.setAttributedTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func title(_ edgeInsets: UIEdgeInsets) -> Yuki {
        base.titleEdgeInsets = edgeInsets
        return self
    }
    
    @discardableResult
    func title(edgeInsets top: CGFloat = 0, left:CGFloat = 0, bottom:CGFloat = 0, right:CGFloat = 0) -> Yuki {
        base.titleEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @discardableResult
    func image(_ edgeInsets: UIEdgeInsets) -> Yuki {
        base.imageEdgeInsets = edgeInsets
        return self
    }
    
    @discardableResult
    func image(edgeInsets top: CGFloat = 0, left:CGFloat = 0, bottom:CGFloat = 0, right:CGFloat = 0) -> Yuki {
        base.imageEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @discardableResult
    func contentAlignment(horizontal: UIControl.ContentHorizontalAlignment) -> Yuki {
        base.contentHorizontalAlignment = horizontal
        return self
    }
    @discardableResult
    func contentAlignment(vertical: UIControl.ContentVerticalAlignment) -> Yuki {
        base.contentVerticalAlignment = vertical
        return self
    }
    @discardableResult
    func imageViewContent(_ mode: UIView.ContentMode) -> Yuki {
        base.imageView?.contentMode = mode
        return self
    }
    @discardableResult
    func reverses(_ titleShadowWhenHighlighted: Bool) -> Yuki {
        base.reversesTitleShadowWhenHighlighted = titleShadowWhenHighlighted
        return self
    }
    
    @discardableResult
    func adjusts(imageWhenHighlighted a: Bool) -> Yuki {
        base.adjustsImageWhenHighlighted = a
        return self
    }
    
    @discardableResult
    func adjusts(imageWhenDisabled a: Bool) -> Yuki {
        base.adjustsImageWhenDisabled = a
        return self
    }
    @discardableResult
    func shows(_ touchWhenHighlighted: Bool) -> Yuki {
        base.showsTouchWhenHighlighted = touchWhenHighlighted
        return self
    }
    
    @discardableResult
    func loading(bgViewColor: UIColor = .clear,
                 bgViewFrame:CGRect = .zero,
                 style:UIActivityIndicatorView.Style = .gray,
                 activityColor:UIColor = .clear) -> Yuki {
        base.isEnabled = false
        let activity = UIActivityIndicatorView(style: style)
        activity.startAnimating()
        let view = UIView()
        view.tag = -8668
        if bgViewFrame == .zero {
            base.superview?.layoutIfNeeded()
            view.frame = base.bounds
        }else{
            view.frame = bgViewFrame
        }
        if bgViewColor == .clear {
            view.backgroundColor = bgViewColor
        }else{
            view.backgroundColor = base.backgroundColor
        }
        if activityColor != .clear {
            activity.color = activityColor
        }
        activity.frame = view.bounds
        
        base.addSubview(view)
        view.addSubview(activity)
        return self
    }
    
    @discardableResult
    func loading(_ custom:(()->Void)) -> Yuki {
        base.isEnabled = false
        custom()
        return self
    }
    
    @discardableResult
    func loadingHidden(_ tag:Int = -8668) -> Yuki {
        base.viewWithTag(tag)?.removeFromSuperview()
        base.isEnabled = true
        return self
    }
}
