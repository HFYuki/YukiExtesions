//Created  on 2018/12/13  by LCD :https://github.com/liucaide .

import Foundation
import UIKit

public extension Yuki where Base: UITableView {
    
    @discardableResult
    func estimatedAll(_ height:CGFloat = CGFloat.leastNormalMagnitude) -> Yuki {
        if #available(iOS 11.0, *) {
            base.contentInsetAdjustmentBehavior = .never
            base.estimatedRowHeight = height
            base.estimatedSectionHeaderHeight = height
            base.estimatedSectionFooterHeight = height
        }else{
            let height = height >= 2 ? height : 2
            base.estimatedRowHeight = height
            base.estimatedSectionHeaderHeight = height
            base.estimatedSectionFooterHeight = height
        }
        base.rowHeight = UITableView.automaticDimension
        base.sectionHeaderHeight = UITableView.automaticDimension
        base.sectionFooterHeight = UITableView.automaticDimension
        return self
    }
    
    @discardableResult
    func dataSource(_ d: UITableViewDataSource?) -> Yuki {
        base.dataSource = d
        return self
    }
    
    @discardableResult
    func delegate(_ d: UITableViewDelegate?) -> Yuki {
        base.delegate = d
        return self
    }
    
    @available(iOS 10.0, *)
    @discardableResult
    func prefetch(dataSource d: UITableViewDataSourcePrefetching?) -> Yuki {
        base.prefetchDataSource = d
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func drag(delegate d: UITableViewDragDelegate?) -> Yuki {
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func drop(delegate d: UITableViewDropDelegate?) -> Yuki {
        base.dropDelegate = d
        return self
    }
    
    @discardableResult
    func background(view v: UIView?) -> Yuki {
        base.backgroundView = v
        return self
    }
    
    @discardableResult
    func table(headerView v: UIView?) -> Yuki {
        base.tableHeaderView = v
        return self
    }
    
    @discardableResult
    func table(footerView v: UIView?) -> Yuki {
        base.tableFooterView = v
        return self
    }
    
    @discardableResult
    func row(height h: CGFloat) -> Yuki {
        base.rowHeight = h
        return self
    }
    
    @discardableResult
    func section(headerHeight h: CGFloat) -> Yuki {
        base.sectionHeaderHeight = h
        return self
    }
    
    @discardableResult
    func section(footerHeight h: CGFloat) -> Yuki {
        base.sectionFooterHeight = h
        return self
    }
    
    @discardableResult
    func estimated(rowHeight h: CGFloat) -> Yuki {
        base.estimatedRowHeight = h
        return self
    }
    
    @discardableResult
    func estimated(sectionHeaderHeight h: CGFloat) -> Yuki {
        base.estimatedSectionHeaderHeight = h
        return self
    }
    
    @discardableResult
    func estimated(sectionFooterHeight h: CGFloat) -> Yuki {
        base.estimatedSectionFooterHeight = h
        return self
    }
    
    @discardableResult
    func section(indexColor c: UIColor?) -> Yuki {
        base.sectionIndexColor = c
        return self
    }
    
    @discardableResult
    func section(indexBackgroundColor c: UIColor?) -> Yuki {
        base.sectionIndexBackgroundColor = c
        return self
    }
    
    @discardableResult
    func section(indexTrackingBackgroundColor c: UIColor?) -> Yuki {
        base.sectionIndexTrackingBackgroundColor = c
        return self
    }
    
    @discardableResult
    func section(indexMinimumDisplayRowCount c: Int) -> Yuki {
        base.sectionIndexMinimumDisplayRowCount = c
        return self
    }
    
    @discardableResult
    func separator(style s: UITableViewCell.SeparatorStyle) -> Yuki {
        base.separatorStyle = s
        return self
    }
    
    @discardableResult
    func separator(color c: UIColor?) -> Yuki {
        base.separatorColor = c
        return self
    }
    
    @discardableResult
    func separator(inset i: UIEdgeInsets) -> Yuki {
        base.separatorInset = i
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func separator(insetReference i: UITableView.SeparatorInsetReference) -> Yuki {
        base.separatorInsetReference = i
        return self
    }
}



public extension Yuki where Base: UITableView {
    func cell(_ cellClass:AnyClass, id:String = "", bundleFrom:String = "") -> UITableViewCell? {
        let identifier = id=="" ? String(describing: cellClass) : id
        var cell = base.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil  {
            if bundleFrom.isEmpty {
                let bundle = Bundle.main.path(forResource:identifier, ofType: "nib")
                if bundle == nil{
                    base.register(cellClass, forCellReuseIdentifier: identifier)
                }else{
                    let nib = UINib(nibName:identifier, bundle: nil)
                    base.register(nib, forCellReuseIdentifier: identifier)
                }
            }else{
                let nib = UINib(nibName:identifier, bundle: Bundle.yk_bundle(cellClass, bundleFrom))
                base.register(nib, forCellReuseIdentifier: identifier)
            }
            cell = base.dequeueReusableCell(withIdentifier: identifier)
        }
        guard let ce = cell else {
            assertionFailure("👉👉👉dequeueReusableCell 失败，请检查你的cell  👻")
            return nil
        }
        return ce
    }
    
    func view(_ viewClass:AnyClass, id:String = "", bundleFrom:String = "") -> UITableViewHeaderFooterView? {
        let identifier = id=="" ? String(describing: viewClass) : id
        var cell = base.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        if cell == nil  {
            if bundleFrom.isEmpty {
                let bundle = Bundle.main.path(forResource:identifier, ofType: "nib")
                if bundle == nil{
                    base.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
                }else{
                    let nib = UINib(nibName:identifier, bundle: nil)
                    base.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
                }
            }else{
                let nib = UINib(nibName:identifier, bundle: Bundle.yk_bundle(viewClass, bundleFrom))
                base.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
            }
            cell = base.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        }
        guard let ce = cell else {
            assertionFailure("👉👉👉dequeueReusableHeaderFooterView 失败，请检查你的View  👻")
            return nil
        }
        return ce
    }
}


public extension UITableView {
    
}
