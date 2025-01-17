//
//  GradientRectangles.swift
//  CreateAnimationUI
//
//  Created by user246073 on 10/19/24.
//

import SwiftUI

struct GradientRectangles: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                ForEach(0 ..< 3) { iteration in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .blue]),
                                startPoint: UnitPoint(x: 0, y: 1),
                                endPoint: .topTrailing
                            )
                        )
                        .frame(width: width * 0.7, height: height * 0.7)
                        .rotationEffect(.degrees(Double(iteration) * 60))
                }
                
                Image(systemName: "airplane")
                    .resizable()
                    .rotationEffect(.degrees(-90))
                    .opacity(0.5)
                    .scaleEffect(0.7)
                
            }
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    GradientRectangles()
        .frame(width: 200, height: 200)
}
