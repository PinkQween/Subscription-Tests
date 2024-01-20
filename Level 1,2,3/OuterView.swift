//
//  OuterView.swift
//  Level 1,2,3
//
//  Created by Boone, Hanna - Student on 1/19/24.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            TabView() {
                Level1()
                Level2()
                Level3()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .ignoresSafeArea()
        }
    }
}

#Preview {
    OuterView()
}
