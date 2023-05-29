//
//  UIView+.swift
//  BookReview
//
//  Created by 김민 on 2023/05/28.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
