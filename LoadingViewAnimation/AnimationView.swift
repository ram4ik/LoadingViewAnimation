//
//  AnimationView.swift
//  LoadingViewAnimation
//
//  Created by admin on 04.10.2023.
//

import SwiftUI

struct AnimationView: View {
    @State private var start = false
    
    var body: some View {
        ZStack {
            Text("Loading...")
                .bold()
                .font(.title)
            Text("Loading...")
                .bold()
                .font(.title)
                .frame(width: 200, height: 50)
                .background(.black.opacity(0.9))
                .mask {
                    Circle()
                        .frame(width: 40, height: 40)
                        .offset(x: start ? -50 : 50)
                }
            Circle()
                .stroke(lineWidth: 3)
                .frame(width: 40, height: 40)
                .offset(x: start ? -50 : 50)
                .opacity(0.2)
        }
        .frame(width: 250, height: 150)
        .background(Color.green, in: RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        .onAppear() {
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                start = true
            }
        }
    }
}

#Preview {
    AnimationView()
}
