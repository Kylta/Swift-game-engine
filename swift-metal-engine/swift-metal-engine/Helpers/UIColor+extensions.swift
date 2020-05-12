//
//  UIColor+extensions.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import UIKit

extension UIColor {
    var toFloat4: float4 {
        let c = self.cgColor.components!
        return float4(Float(c[0]), Float(c[1]), Float(c[2]), Float(c[3]))
    }
    
    static var randomColor: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1)
    }
}
