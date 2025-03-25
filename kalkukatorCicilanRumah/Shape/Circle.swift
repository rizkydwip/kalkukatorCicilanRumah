//
//  Circle.swift
//  kalkukatorCicilanRumah
//
//  Created by Rizkydwiputra on 19/03/25.
//

import SwiftUI

struct Circles: View {
    
    let gradient = Gradient(colors: [Color("blue"),
                                    Color("white")])
    
    var body: some View {
        Circle()
            .foregroundStyle(Color("blue"))
    }
}

#Preview {
    Circles()
}
