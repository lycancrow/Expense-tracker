//
//  SplashScreen.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-01.
//

import SwiftUI
import SDWebImageSwiftUI


struct SplashScreen: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            MainView()
        } else {
            VStack {
                VStack {
                    AnimatedImage(name: "moneyPlant.gif")
                        .resizable()
                        .scaledToFit()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                withAnimation {
                                    self.isActive = true
                                }
                            }
                        }
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}



/*
 
 ZStack {
     if !isActive {
         AnimatedImage(name: "moneyPlant.gif")
             .resizable()
             .scaledToFit()
             .onAppear {
                 DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                     withAnimation {
                         self.isActive = true
                     }
                 }
             }
     }
 }
 
 */




