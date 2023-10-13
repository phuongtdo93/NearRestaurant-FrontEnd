//
//  Color.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/28/23.
//

import SwiftUI

enum CustomColor {
    static let gray: String = "9D9D9E"
    static let gray1: String = "EEEEEF"
    static let mainRed: String = "CD5939"
}

extension Color {
    init(hex: String){

        var rgbValue: UInt64 = 0
        let scanner = Scanner(string: hex)
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
