//
//  ContentView.swift
//  kalkukatorCicilanRumah
//
//  Created by Rizkydwiputra on 17/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : ViewModel
   
    var body: some View {
      
        FrontPage()
    }
}

#Preview {
    ContentView().environmentObject(ViewModel())
}
