//
//  AwardView.swift
//  CreateAnimationUI
//
//  Created by user246073 on 10/19/24.
//

import SwiftUI

struct AwardsView: View {
    private let awards = Award.awards.filter {$0.awarded }
    private let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(awards, id: \.title) { award in
                        VStack {
                            award.awardView
                            Text(award.title)
                        }
                    }
                }
            }
        }
    }
}

//        NavigationStack {
//            CustomGridView(items: awards, columns: 2) { award in
//                VStack(spacing: 10) {
//                    award.awardView
//                    Text(award.title)
//                }
//            }
//            .navigationBarTitle("Your awards: \(awards.count)")
//
//        }


#Preview {
    AwardsView()
}
