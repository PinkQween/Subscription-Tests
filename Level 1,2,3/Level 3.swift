//
//  Level 3.swift
//  Level 1,2,3
//
//  Created by Boone, Hanna - Student on 1/19/24.
//

import SwiftUI
import StoreKit

struct Level3: View {
    var body: some View {
        VStack {
            Spacer()
            
            HeaderView3()
            
            HStack(spacing: 15) {
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                
                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 87)
                }
            }
            .padding(.horizontal)
            
            ZStack {
                PricingView(icon: "wand.and.rays", title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255))
                
                Text("Best for teams with 20 members")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 120)
            }
            .padding(.horizontal)
            
            Spacer()
            Spacer()
        }
    }
}

struct HeaderView3: View {
    var body: some View {
        HStack {
            VStack(spacing: 2){
                Text("Choose")
                    .font(.system(size: 76, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.black)
                
                Text("Your Plan")
                    .font(.system(size: 76, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.black)
            }
            .padding()
        }
        .padding()
    }
}

struct PricingView3: View {
    var icon: String?
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var cornerRadius: CGFloat
    
    var body: some View {
        Button(action: {
            print("Pressed button")
            
            Task {
                do {
                    try await self.purchase()
                } catch {
                    print(error)
                }
            }
        }, label: {
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
        })
    }
    
    private func purchase() async throws -> Void {
        let result = try await Product.products(for: (title == "Basic" ? ["basic.plan"] : title == "Pro" ? ["pro.plan"] : ["team.plan"]))[0].purchase()
        
        print(result)
        
        switch result {
        case let .success(.verified(transaction)):
            await transaction.finish()
            print("Done")
        case let .success(.unverified(_, error)):
            print(error)
        case .pending:
            break
        case .userCancelled:
            break
        @unknown default:
            break
        }
    }
}

#Preview {
    Level3()
}
