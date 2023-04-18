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
        
        ZStack {
          Capsule()
            .fill(Color.white.opacity(0.2))
          Capsule()
            .fill(Color.white.opacity(0.2))
            .padding(16)
          Text("Get Started")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .offset(x: 20)
          HStack {
            Capsule()
              .fill(Color("ColorRed"))
              .frame(width: 90)
            Spacer()
          }
          HStack {
            ZStack {
              Circle()
                .fill(Color("ColorRed"))
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              Image(systemName: "chevron.right.2")
                .font(.system(size: 24, weight: .bold))
            }.foregroundColor(.white)
            .frame(width: 90, height: 90, alignment: .center)
            .onTapGesture {
              isOnboardingViewActive = false
            }
            Spacer()
          }
        }.frame(height: 90, alignment: .center)
          .padding()
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
