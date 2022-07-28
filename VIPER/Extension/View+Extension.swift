//
//  View+Extension.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 27/07/22.
//

import UIKit

extension UIView {
    
    func configureView(superView:UIView,constant:CGFloat = 0 ){
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: constant).isActive = true
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: constant).isActive = true
    }
    func configureViewFromTopMargin(superView:UIView,topMargin:CGFloat = 0 ){
        let margins = superView.layoutMarginsGuide
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    func configureWithTopMargin(superView:UIView,corespondingView:UIView,margin:Margin ){
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: margin.leading).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -(margin.trailing)).isActive = true
        self.topAnchor.constraint(equalTo: corespondingView.bottomAnchor, constant: margin.top).isActive = true
        self.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: superView.bottomAnchor, multiplier: 1).isActive = true
    }
    func configureViewWithStaticHeight(superView:UIView,constant:CGFloat = 0 , height:CGFloat = 0 ){
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: constant),
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}

struct Margin {
    let top: CGFloat
    let leading: CGFloat
    let bottom: CGFloat
    let trailing: CGFloat
}
