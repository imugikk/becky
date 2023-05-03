//
//  beckyApp.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 28/04/23.
//

import SwiftUI

extension Font {
    static var poppinsRegular: Font {
        return Font.custom("Poppins-Regular", size: 18.0)
    }
    
    static var poppinsBold: Font {
        return Font.custom("Poppins-Bold", size: 18.0)
    }
    
    static var poppinsRegularLarge: Font {
        return Font.custom("Poppins-Regular", size: 35.0)
    }
    
    static var poppinsBoldLarge: Font {
        return Font.custom("Poppins-Bold", size: 35.0)
    }
    
    static var poppinsSemiBoldLarge: Font {
        return Font.custom("Poppins-SemiBold", size: 35.0)
    }
    
    static var poppinsItalicLarge: Font {
        return Font.custom("Poppins-Italic", size: 35.0)
    }
    
    static var poppinsLight: Font {
        return Font.custom("Poppins-Light", size: 18.0)
    }
    static var poppinsLightLarge: Font {
        return Font.custom("Poppins-Light", size: 35.0)
    }
}

@main
struct beckyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().font(.poppinsRegular)
        }
    }
}
