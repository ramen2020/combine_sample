//
//   Indicator.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/22.
//

import SwiftUI
import UIKit

// Indicator
struct Indicator: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    @State var isAnimating: Bool = true
    let style: UIActivityIndicatorView.Style = .medium
    
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> Indicator.UIViewType {
        UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
