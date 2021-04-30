//Created  on 2018/12/11  by LCD :https://github.com/liucaide .

import Foundation
import UIKit

public extension Yuki where Base: UIStackView {
    @discardableResult
    func addArranged(subview view: UIView) -> Yuki {
        base.addArrangedSubview(view)
        return self
    }
    
    @discardableResult
    func removeArranged(subview view: UIView) -> Yuki {
        base.removeArrangedSubview(view)
        return self
    }
    
    @discardableResult
    func insertArranged(subview view: UIView, at:Int) -> Yuki {
        base.insertArrangedSubview(view, at: at)
        return self
    }
    
    @discardableResult
    func axis(_ a: NSLayoutConstraint.Axis) -> Yuki {
        base.axis = a
        return self
    }
    
    @discardableResult
    func distribution(_ a: UIStackView.Distribution) -> Yuki {
        base.distribution = a
        return self
    }
    
    @discardableResult
    func alignment(_ a: UIStackView.Alignment) -> Yuki {
        base.alignment = a
        return self
    }

    @discardableResult
    func spacing(_ a: CGFloat) -> Yuki {
        base.spacing = a
        return self
    }
    
    @discardableResult
    @available(iOS 11.0, *)
    func custom(_ spacing: CGFloat, after arrangedSubview: UIView) -> Yuki {
        base.setCustomSpacing(spacing, after: arrangedSubview)
        return self
    }
    
    @discardableResult
    func isBaselineRelativeArrangement(_ a: Bool) -> Yuki {
        base.isBaselineRelativeArrangement = a
        return self
    }
    
    @discardableResult
    func isLayoutMarginsRelativeArrangement(_ a: Bool) -> Yuki {
        base.isLayoutMarginsRelativeArrangement = a
        return self
    }
}
