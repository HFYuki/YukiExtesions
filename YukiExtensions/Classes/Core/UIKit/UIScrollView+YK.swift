//Created  on 2019/2/28 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */

import Foundation
import UIKit

public extension Yuki where Base: UIScrollView {
    
    @discardableResult
    func delegate(_ d: UIScrollViewDelegate?) -> Yuki {
        base.delegate = d
        return self
    }
    
    @discardableResult
    func content(offset p: CGPoint) -> Yuki {
        base.contentOffset = p
        return self
    }
    
    @discardableResult
    func content(size s: CGSize) -> Yuki {
        base.contentSize = s
        return self
    }
    
    @discardableResult
    func content(inset i: UIEdgeInsets) -> Yuki {
        base.contentInset = i
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func content(insetAdjustmentBehavior i: UIScrollView.ContentInsetAdjustmentBehavior) -> Yuki {
        base.contentInsetAdjustmentBehavior = i
        return self
    }
    
    @discardableResult
    func isDirectional(lockEnabled l: Bool) -> Yuki {
        base.isDirectionalLockEnabled = l
        return self
    }
    
    @discardableResult
    func bounces(_ b: Bool) -> Yuki {
        base.bounces = b
        return self
    }
    
    @discardableResult
    func always(bounceVertical b: Bool) -> Yuki {
        base.alwaysBounceVertical = b
        return self
    }
    
    @discardableResult
    func always(bounceHorizontal b: Bool) -> Yuki {
        base.alwaysBounceHorizontal = b
        return self
    }
    
    @discardableResult
    func isPaging(enabled e: Bool) -> Yuki {
        base.isPagingEnabled = e
        return self
    }
    
    @discardableResult
    func isScroll(enabled e: Bool) -> Yuki {
        base.isScrollEnabled = e
        return self
    }
    
    @discardableResult
    func shows(horizontalScrollIndicator b: Bool) -> Yuki {
        base.showsHorizontalScrollIndicator = b
        return self
    }
    
    @discardableResult
    func shows(verticalScrollIndicator b: Bool) -> Yuki {
        base.showsVerticalScrollIndicator = b
        return self
    }
    
    @discardableResult
    func scroll(indicatorInsets i: UIEdgeInsets) -> Yuki {
        base.scrollIndicatorInsets = i
        return self
    }
    
    @discardableResult
    func indicator(style s: UIScrollView.IndicatorStyle) -> Yuki {
        base.indicatorStyle = s
        return self
    }
    
    @discardableResult
    func deceleration(rate r: UIScrollView.DecelerationRate) -> Yuki {
        base.decelerationRate = r
        return self
    }
    
    @discardableResult
    func index(displayMode m: UIScrollView.IndexDisplayMode) -> Yuki {
        base.indexDisplayMode = m
        return self
    }
    
    @discardableResult
    func set(contentOffset p:CGPoint, _ animated:Bool = true) -> Yuki {
        base.setContentOffset(p, animated: animated)
        return self
    }
    
    @discardableResult
    func scroll(rectToVisible r:CGRect, _ animated:Bool = true) -> Yuki {
        base.scrollRectToVisible(r, animated: animated)
        return self
    }
    
    @discardableResult
    func flashScrollIndicators() -> Yuki {
        base.flashScrollIndicators()
        return self
    }
    
    @discardableResult
    func delays(contentTouches b:Bool) -> Yuki {
        base.delaysContentTouches = b
        return self
    }
    
    @discardableResult
    func canCancel(contentTouches b:Bool) -> Yuki {
        base.canCancelContentTouches = b
        return self
    }
    @discardableResult
    func bounces(zoom b:Bool) -> Yuki {
        base.bouncesZoom = b
        return self
    }
    @discardableResult
    func scrollsToTop(_ b:Bool = true) -> Yuki {
        base.scrollsToTop = b
        return self
    }
    
    @discardableResult
    func min(imumZoomScale a:CGFloat) -> Yuki {
        base.minimumZoomScale = a
        return self
    }
    @discardableResult
    func max(imumZoomScale a:CGFloat) -> Yuki {
        base.maximumZoomScale = a
        return self
    }
    @discardableResult
    func zoom(scale a:CGFloat) -> Yuki {
        base.maximumZoomScale = a
        return self
    }
    
    @discardableResult
    func set(zoomScale a:CGFloat, _ animated:Bool = true) -> Yuki {
        base.setZoomScale(a, animated: animated)
        return self
    }
    
    @discardableResult
    func zoom(toRect a:CGRect, _ animated:Bool = true) -> Yuki {
        base.zoom(to: a, animated: animated)
        return self
    }
    
    @discardableResult
    func keyboard(dismissMode a:UIScrollView.KeyboardDismissMode) -> Yuki {
        base.keyboardDismissMode = a
        return self
    }
    
    @available(iOS 10.0, *)
    @discardableResult
    func refresh(control a:UIRefreshControl?) -> Yuki {
        base.refreshControl = a
        return self
    }
    
    /// 右滑返回
    @discardableResult
    func panBack(_ gesture: UIGestureRecognizer, otherGesture:UIGestureRecognizer) -> Bool {
        if base.contentOffset.x <= 0,
            let delegate = otherGesture.delegate,
            let fdFulls = NSClassFromString("_FDFullscreenPopGestureRecognizerDelegate").self,
            delegate.isKind(of: fdFulls) {
            return true
        }
        else if gesture == base.panGestureRecognizer,
            let pan:UIPanGestureRecognizer = gesture as? UIPanGestureRecognizer {
            let point = pan.translation(in: base)
            let state = pan.state
            if state == .began || state == .possible {
                let location = pan.location(in: base)
                if point.x >= 0 && location.x < 60 && base.contentOffset.x <= 0 {
                    return true
                }
            }
        }
        return false
    }
    
}
