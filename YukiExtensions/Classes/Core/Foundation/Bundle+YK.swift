
/**** 模块说明文档 **
 * Bundle 扩展
 */

import Foundation
import UIKit

public extension Yuki where Base: Bundle {
    
}

public extension Bundle {
    //MARK:--- Pod Bundle 检索 ----------
    /// - from:bundle.url(forResource ‘(pod s.resource_bundles -> key)’
    static func yk_bundle(_ forClass:AnyClass, _ from:String? = nil) -> Bundle? {
        let bundle = Bundle(for: forClass)
        guard let bundleURL = bundle.url(forResource: from, withExtension: "bundle") else {
            //assertionFailure("👉👉👉\(from) - 无法找到 Bundle  👻")
            return nil
        }
        return Bundle(url: bundleURL)
    }
}
