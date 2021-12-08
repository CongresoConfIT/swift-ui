//
//  LoadingSpinnerView.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import SwiftUI

struct LoadingSpinnerView: View {
    @State var isFirstCircleAnimating = false
    
    @State var showSecondCircle = false
    @State var isSecondCircleAnimating = false

    var body: some View {
        ZStack {
            if showSecondCircle {
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(Color("mainGold"))
                    .scaleEffect(self.isSecondCircleAnimating ? 1 : 0)
                    .opacity(self.isSecondCircleAnimating ? 0 : 1)
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                    .onAppear {
                        isSecondCircleAnimating.toggle()
                    }
            }
            
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(Color("mainBlue"))
                .scaleEffect(self.isFirstCircleAnimating ? 1 : 0)
                .opacity(self.isFirstCircleAnimating ? 0 : 1)
                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                .onAppear {
                    self.isFirstCircleAnimating.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                        self.showSecondCircle.toggle()
                    }
                }
        }
    }
}

struct LoadingSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinnerView()
    }
}
