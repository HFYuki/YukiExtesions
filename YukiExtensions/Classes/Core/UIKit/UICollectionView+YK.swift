
/***** 模块文档 *****
 *
 */

import Foundation
import UIKit

public extension Yuki where Base: UICollectionView {
    
    @discardableResult
    func background(view v: UIView?) -> Yuki {
        base.backgroundView = v
        return self
    }
    
    @discardableResult
    func layout(_ l: UICollectionViewLayout) -> Yuki {
        base.collectionViewLayout = l
        return self
    }
    
    @discardableResult
    func dataSource(_ d: UICollectionViewDataSource?) -> Yuki {
        base.dataSource = d
        return self
    }
    
    @discardableResult
    func delegate(_ d: UICollectionViewDelegate?) -> Yuki {
        base.delegate = d
        return self
    }
    
    @discardableResult
    func prefetch(dataSource d: UICollectionViewDataSourcePrefetching?) -> Yuki {
        if #available(iOS 10.0, *) {
            base.prefetchDataSource = d
        } else {
            // Fallback on earlier versions
        }
        return self
    }
    
    @discardableResult
    func isPrefetching(enabled e: Bool) -> Yuki {
        if #available(iOS 10.0, *) {
            base.isPrefetchingEnabled = e
        } else {
            // Fallback on earlier versions
        }
        return self
    }
    
}


public extension Yuki where Base: UICollectionView {
    enum Kind:Int {
        case tHeader = 0
        case tFooter = 1
        
        public var stringValue:String{
            switch self {
            case .tHeader:
                return UICollectionView.elementKindSectionHeader
            default:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
    enum View {
        case tCell(_ cellClass:AnyClass, _ id:String?, _ bundleFrom:String?)
        case tView(_ viewClass:AnyClass, _ id:String?, _ kind:Kind, _ bundleFrom:String?)
        
    }
    
    @discardableResult
    func register(_ model:[View]) -> Yuki {
        for (_, item) in model.enumerated() {
            switch item {
            case .tCell(let cellClass, let id, let from):
                let identifier = id ?? String(describing: cellClass)
                let bundleFrom = from ?? ""
                if bundleFrom.isEmpty {
                    let bundle = Bundle.main.path(forResource:identifier, ofType: "nib")
                    if bundle == nil{
                        base.register(cellClass, forCellWithReuseIdentifier: identifier)
                    }else{
                        let nib = UINib(nibName:identifier, bundle: nil)
                        base.register(nib, forCellWithReuseIdentifier: identifier)
                    }
                }else{
                    let nib = UINib(nibName:identifier, bundle: Bundle.yk_bundle(cellClass, bundleFrom))
                    base.register(nib, forCellWithReuseIdentifier: identifier)
                }
            case .tView(let viewClass, let id, let kind, let from):
                let identifier = id ?? String(describing: viewClass)
                let bundleFrom = from ?? ""
                if bundleFrom.isEmpty {
                    let bundle = Bundle.main.path(forResource:identifier, ofType: "nib")
                    if bundle == nil{
                        base.register(viewClass, forSupplementaryViewOfKind: kind.stringValue, withReuseIdentifier: identifier)
                    }else{
                        let nib = UINib(nibName:identifier, bundle: nil)
                        base.register(nib, forSupplementaryViewOfKind: kind.stringValue, withReuseIdentifier: identifier)
                    }
                }else{
                    let nib = UINib(nibName:identifier, bundle: Bundle.yk_bundle(viewClass, bundleFrom))
                    base.register(nib, forSupplementaryViewOfKind: kind.stringValue, withReuseIdentifier: identifier)
                }
            }
        }
        return self
    }
    
    func cell(_ id:String, _ index:IndexPath) -> UICollectionViewCell{
        return base.dequeueReusableCell(withReuseIdentifier: id, for: index)
    }
    func view(_ id:String,_ kind:Kind, _ index:IndexPath) -> UICollectionReusableView{
        return base.dequeueReusableSupplementaryView(ofKind: kind.stringValue, withReuseIdentifier: id, for: index)
    }
    func view(_ id:String,_ kind:String, _ index:IndexPath) -> UICollectionReusableView{
        return base.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: id, for: index)
    }
}
