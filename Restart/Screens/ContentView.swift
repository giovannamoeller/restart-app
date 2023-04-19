//
//  ContentView.swift
//  Restart
//
//  Created by Giovanna Moeller on 18/04/23.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  var body: some View {
    ZStack {
      if isOnboardingViewActive {
        OnboardingView()
      } else {
        HomeView()
      }
    }.animation(.easeIn(duration: 0.5), value: isOnboardingViewActive)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
