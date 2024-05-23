//
//  DrawerSize.swift
//  SwiftyDrawer
//
//  Created by Keith Vandagriff on 5/22/24.
//

import Foundation

enum DrawerSize {
    case regular, large
    
    var factor: CGFloat {
        switch self {
        case .regular:
            return 0.5
        case .large:
            return 0.7
        }
    }
}
