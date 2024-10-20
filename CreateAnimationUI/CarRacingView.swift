//
//  CarRacingView.swift
//  CreateAnimationUI
//
//  Created by user246073 on 10/19/24.
//

import SwiftUI

struct CarRacingView: View {
    @State private var start = false
    
    var body: some View {
        HStack {
            VStack(spacing: 15) {
                CartView(
                    start: start,
                    title: "Default",
                    color: .red,
                    animation: .default
                )
                CartView(
                    start: start,
                    title: "easeOut",
                    color: .green,
                    animation: .easeOut(duration: 0.6)
                )
                CartView(
                    start: start,
                    title: "easeIn",
                    color: .yellow,
                    animation: .easeIn(duration: 0.6)
                )
            
                CartView(
                    start: start,
                    title: "easeInOut",
                    color: .blue,
                    animation: .easeInOut(duration: 0.6)
                )
                CartView(
                    start: start,
                    title: "Int-ing Spring",
                    color: .brown,
                    animation: .interpolatingSpring(
                        mass: 1,
                        stiffness: 100,
                        damping: 10,
                        initialVelocity: 0
                    )
                )
                CartView(
                    start: start,
                    title: "spring",
                    color: .cyan,
                    animation: .spring(
                        response: 0.55,
                        dampingFraction: 0.45,
                        blendDuration: 0
                    )
                )


                
            }
            Spacer()
        }
        .onTapGesture {
            start.toggle()
        }
//        .padding()
    }
}

#Preview {
    CarRacingView()
}

struct CartView: View {
    let start: Bool
    let title: String
    let color: Color
    let animation: Animation
    
    var body: some View {
        VStack {
            Image(systemName: "cart.fill")
                .font(.title)
                .foregroundColor(color)
                .offset(x: start ? UIScreen.main.bounds.width - 80 : 0)
                .animation(animation, value: start)
            Text(title)
        }
    }
}
