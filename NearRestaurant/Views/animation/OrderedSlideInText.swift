//
//  OrderedSlideInText.swift
//  NearRestaurant
//
//  Created by Salmdo on 7/11/23.
//

import SwiftUI

struct OrderedSlideInText: View {
    @State private var isAnimating: Bool = true
    var body: some View {
        VStack {
            OrderedSlideInWord("Cho hoi nek m oi", isAnimating: $isAnimating)
            Button {
                withAnimation {
                    isAnimating.toggle()
                }
            } label: {
                Text("Click me")
            }
        }
       
    }
}

struct OrderedSlideInWord: View {
    @Binding var isAnimating: Bool
    let text: String
    
    private var words: [String] {
        text.split(separator: " ").map { String($0) }
    }
    
    init(_ text: String, isAnimating: Binding<Bool>) {
        self._isAnimating = isAnimating
        self.text = text
    }
    
    var body: some View {
        HStack {
            ForEach(words.indices, id: \.self) { index in
                let fraction = CGFloat(index) / CGFloat(words.count)
                Text(words[index])
                    .opacity(isAnimating ? 1.0 : 0.0)
                    .modifier(VerticalOffsetModifier(isAnimating: isAnimating, fraction: fraction))
            }
        }
    }
    
    
   
}


struct VerticalOffsetModifier: GeometryEffect {
    private var percentage: CGFloat
    private var fraction: CGFloat
    
    var aninatableData: CGFloat {
        get { percentage }
        set { percentage = newValue }
    }
    
    init(isAnimating: Bool, fraction: CGFloat) {
        self.percentage = isAnimating ? 1.0 : 0.0
        self.fraction = fraction
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        guard percentage <= fraction else {
            return ProjectionTransform(.identity)
        }
        
        let offset = size.height * 50
        return ProjectionTransform(CGAffineTransform(translationX: 0.0, y: offset * (fraction - percentage)))
    }
}
struct OrderedSlideInText_Previews: PreviewProvider {
    static var previews: some View {
        OrderedSlideInText()
    }
}
