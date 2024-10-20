//
//  CustomGridView.swift
//  CreateAnimationUI
//
//  Created by user246073 on 10/20/24.
//

import SwiftUI

struct CustomGridView<Content: View, T>: View {
    let items: [T]
    let columns: Int
    
    let content: (T) -> Content
    
    private var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sideLength = geometry.size.width / Double(columns)
            
            ScrollView {
                ForEach(0...rows, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<columns, id: \.self) { columnIndex in
                            if let index = getIndexFor(row: rowIndex, andColumn: columnIndex) {
                                content(items[index])
                                    .frame(width: sideLength, height: sideLength)
                            }  else {
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func getIndexFor(row: Int, andColumn column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

#Preview {
    CustomGridView(items: [0, 1, 2, 3, 4, 5, 6], columns: 3) { item in
        Text(item.formatted())
    }
}

//                        Text(items[rowIndex * columns + columnIndex].formatted())
