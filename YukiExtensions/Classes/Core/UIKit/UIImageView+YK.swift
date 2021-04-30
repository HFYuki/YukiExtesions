//Created  on 2018/12/11  by LCD :https://github.com/liucaide .

import Foundation
import UIKit


public extension Yuki where Base: UIImageView {
    @discardableResult
    func image(_ a:UIImage?) -> Yuki {
        base.image = a
        return self
    }
    @discardableResult
    func highlighted(_ image:UIImage?) -> Yuki {
        base.highlightedImage = image
        return self
    }
    @discardableResult
    func isHighlighted(_ a:Bool) -> Yuki {
        base.isHighlighted = a
        return self
    }
    @discardableResult
    func animation(_ images:[UIImage]?) -> Yuki {
        base.animationImages = images
        return self
    }
    
    @discardableResult
    func highlighted(_ animationImages:[UIImage]?) -> Yuki {
        base.highlightedAnimationImages = animationImages
        return self
    }
    
    @discardableResult
    func animation(_ duration:TimeInterval) -> Yuki {
        base.animationDuration = duration
        return self
    }
    @discardableResult
    func animation(_ repeatCount:Int) -> Yuki {
        base.animationRepeatCount = repeatCount
        return self
    }
    @discardableResult
    func startAnimating() -> Yuki {
        base.startAnimating()
        return self
    }
    @discardableResult
    func stopAnimating() -> Yuki {
        base.stopAnimating()
        return self
    }
    
    @discardableResult
    func animation(_ images:[UIImage], duration:TimeInterval = 1, repeatCount:Int = 1) -> Yuki {
        base.animationImages = images
        base.animationDuration = duration
        base.animationRepeatCount = repeatCount
        base.startAnimating()
        return self
    }
    @discardableResult
    func animation(_ names:[String], duration:TimeInterval = 1, repeatCount:Int = 1) -> Yuki {
        //let images:[UIImage] = try names.map{ UIImage(named: $0)}
        var images:[UIImage] = []
        for item in names {
            guard let img = UIImage(named: item) else{
                assertionFailure("👉👉👉 UIImage(named: \(item))错误，请检查 names")
                continue
            }
            images.append(img)
        }
        guard images.count > 0 else {
            return self
        }
        base.animationImages = images
        base.animationDuration = duration
        base.animationRepeatCount = repeatCount
        base.startAnimating()
        return self
    }
}
