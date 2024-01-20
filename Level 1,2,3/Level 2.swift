//
//  Level 2.swift
//  Level 1,2,3
//
//  Created by Boone, Hanna - Student on 1/19/24.
//

import SwiftUI

struct Level2: View {
    var body: some View {
        VStack {
            Spacer()
            
            PricingView2(icon: "wand.and.rays", title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255), cornerRadius: 5)
                .padding(40)
                .padding(.top, 200)
            
            PricingView2(icon: "dial.low", title: "Team", price: "$19", textColor: .white, bgColor: Color(red: 255/255, green: 183/255, blue: 37/255), cornerRadius: 5)
                .padding(40)
                .offset(x: 0, y: -100)
                .zIndex(-1)
                .padding(.horizontal, 10)
            
            PricingView2(icon: "star.fill", title: "Team", price: "$9", textColor: .white, bgColor: .purple, cornerRadius: 5)
                .padding(40)
                .zIndex(-2)
                .offset(x: 0, y: -200)
                .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

struct PricingView2: View {
    var icon: String?
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {
            if let icon2 = icon {
                Image(systemName: icon2)
                    .foregroundStyle(textColor)
                    .font(.largeTitle)
                    .padding(3)
            }
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(textColor)
            
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundStyle(textColor)
            
            Text("Per month")
                .font(.headline)
                .foregroundStyle(textColor)
        }
        .frame(height: 200)
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(40)
        .background(bgColor)
        .cornerRadius(cornerRadius)
    }
}

#Preview {
    Level2()
}

