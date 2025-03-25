//
//  Page3.swift
//  kalkukatorCicilanRumah
//
//  Created by Rizkydwiputra on 17/03/25.
//

import SwiftUI

struct Page3: View {
    
    @EnvironmentObject var viewModel : ViewModel
    @Binding var lamaFloatingRate:Int
    
    var body: some View {
    
        VStack(){
            Spacer()
            Text("Berapa bunga periode floating rate yang ingin dihitung ?")
                .font(.title3.bold())
                .padding()
                .cornerRadius(16)
                .frame(width: .infinity, height: 100)
            
            HStack(){
                TextField("0.000", value: $viewModel.inputBungaFloatingRate, format: .number) .keyboardType(.decimalPad)
                Text("%")
            }
            .padding()
            Text("Waktu cicilan floating rate kamu \(Text("\(lamaFloatingRate)").font(.headline.bold())) Tahun")
            
            Spacer()
            NavigationLink(destination: Page4()){
                Text("Next")
                    .padding()
                    .background(Color("blue"))
                    .colorScheme(.dark)
                    .cornerRadius(16)
                    .font(.headline.bold())
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Spacer()
            Text("Step 3/4")
                
        }
        .padding(.horizontal,15 )
    }
}

#Preview {
    @State var lamaFloatingRate: Int = 0
    Page3(lamaFloatingRate: $lamaFloatingRate).environmentObject(ViewModel())
}
