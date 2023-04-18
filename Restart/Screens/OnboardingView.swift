//
//  OnboardingView.swift
//  Restart
//
//  Created by Giovanna Moeller on 18/04/23.
//

import SwiftUI

struct OnboardingView: View {
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  var body: some View {
    ZStack {
      Color("ColorBlue").ignoresSafeArea()
      VStack(spacing: 20) {
        Spacer()
        VStack(spacing: 0) {
          Text("Share.")
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
          Text("""
          It's not how much we give but
          how much love we put into giving.
          """)
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 10)
        }
        ZStack {
          ZStack {
            Circle()
              .stroke(.white.opacity(0.2), lineWidth: 40)
              .frame(width: 260)
            Circle()
              .stroke(.white.opacity(0.2), lineWidth: 80)
              .frame(width: 260)
          }
          Image("character-1")
            .resizable()
            .scaledToFit()
        }
        Spacer()
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
