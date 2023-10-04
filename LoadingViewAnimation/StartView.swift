//
//  StartView.swift
//  LoadingViewAnimation
//
//  Created by admin on 04.10.2023.
//

import SwiftUI

struct StartView: View {
    @State private var show = false
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                if show {
                    AnimationView()
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        show = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            show = true
                            navigateToHome = true
                        }
                    }
                }) {
                    Text("Start")
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.gray, in: RoundedRectangle(cornerRadius: 15))
                }
                .opacity(show ? 0.3 : 1)
                .disabled(show)
            }
            .navigationDestination(isPresented: $navigateToHome) {
                ContentView()
            }
        }
    }
}

#Preview {
    StartView()
}
