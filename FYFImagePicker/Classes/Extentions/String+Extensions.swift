//
//  String+Extensions.swift
//  FYFImagePicker
//
//  Created by fuyoufang on 2018/5/19.
//  Copyright © 2018 fuyoufang. All rights reserved.
//

import Foundation

extension String {
    func fyf_localize(fallback: String) -> String {
//        let result = NSLocalizedString(self, tableName: nil, bundle:Bundle(for: Bundle.self), value: "", comment: "")
        let result = NSLocalizedString(self, comment: "")
        return result == self ? fallback : result
    }
}
