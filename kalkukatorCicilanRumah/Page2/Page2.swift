//
//  Page2.swift
//  kalkukatorCicilanRumah
//
//  Created by Rizkydwiputra on 17/03/25.
//

import SwiftUI



struct Page2: View {
    
    @State var showSearch: Bool = false
    @EnvironmentObject var viewModel : ViewModel
    @State private var showDetailFixRate = false
    @State private var showDetailFloatingRate = false
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        
        let monthcalculation = Int((Float(viewModel.inputLamaFixRate ?? 0.0)) * 12 )
        let rumusLamaFloatingRate = Int(viewModel.lamaCicilan - Float(viewModel.inputLamaFixRate ?? 0.0))
        @State var lamaFloatingRate = rumusLamaFloatingRate
        
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    Text(" Step 2 of 3")
                        .frame(maxWidth: .infinity, alignment: .leading )
                        .font(.subheadline)
                        .foregroundStyle(Color("blueAI"))
                    
                    ZStack{
                        
                        HStack{
                            
                            ProgressBar(initialProgress: $viewModel.progressNumber1, color: Color("blue"))
                                .frame(width: 180, height: 5)
                            
                            ProgressBar(initialProgress: $viewModel.progressNumber2, color: Color("blue"))
                                .frame(width:180, height: 5)
                            
                            
                            
                        }
                        
                        HStack{
                            Image(
                                systemName:"circle.fill")
                            .foregroundStyle(Color("blue"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            
                            
                            Image(
                                systemName:"circle.fill")
                            .foregroundStyle(Color("blueAI"))
                            .frame(maxWidth: 20 , alignment: .leading)
                            
                            
                            Image(
                                systemName:"circle.fill")
                            .foregroundStyle(Color(.gray))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            
                            
                        }
                        HStack{
                            Image(
                                systemName:"checkmark.circle")
                            .foregroundStyle(Color(.white))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                    }
                    Text("Data Lama Pinjaman")
                        .font(.largeTitle.bold())
                        .padding(.leading)
                    VStack(spacing: 10){
                        
                        
                        
                        
                        
                        
                        VStack(alignment: .leading){
                            Text("4.  Berapa lama waktu cicilan yang ingin kamu pilih? ")
                                .font(.headline)
                                .padding()
                                .cornerRadius(16)
    
                                Text(String(format:"%.0f Tahun", viewModel.lamaCicilan))
                                    .font(.title2.bold())
                                    .padding(.leading)
                           
                            
                            HStack{
                                Slider(
                                    value: $viewModel.lamaCicilan,
                                    in: 0...30,
                                    step: 5,
                                    minimumValueLabel: Text("0"),
                                    maximumValueLabel: Text("30"),
                                    label: {
                                        Text("Title")
                                    })
                                Stepper("", value: $viewModel.lamaCicilan, in: 0...30, step: 1).labelsHidden()
                            }
                            .padding(.leading)
                        }
                        
                        
                        
                        
                        
                        
                        VStack{
                            HStack{
                                Text("5.  Berapa bunga fix rate yang kamu inginkan?")
                                    .font(.headline)
                                    .padding()
                                    .cornerRadius(16)
                                Spacer()
                                Button {
                                    withAnimation {
                                        showDetailFixRate.toggle()
                                    }
                                } label: {
                                    Label("Graph", systemImage: "questionmark.circle")
                                        .labelStyle(.iconOnly)
                                        .imageScale(.large)
    //                                    .rotationEffect(.degrees(showDetail ? 90 : 0))
                                        .foregroundColor(showDetailFixRate ?  Color("blue") : Color.primary) // atau pakai .foregroundColor
                                        .scaleEffect(showDetailFixRate ? 1 : 1)
                                        .padding()
                                }
                            }
                            
                            if showDetailFixRate {
                                Text("Fixed rate berarti suku bunga yang kamu bayar tidak berubah selama periode tertentu, atau bahkan selama masa pinjaman.")
                                    .transition(.moveAndFade)
                                    .font(.caption.italic())
                            }
                            HStack{
                                TextField("0.000 %", value: $viewModel.inputFixRate, format: .number)
                                    .padding()
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .stroke(Color("blueAI"), lineWidth: 1)
                                    }
                                    .keyboardType(.decimalPad)
                                    .font(.headline)
                                Text("%")
                                    .font(.headline)
                            }    .padding(.leading)
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        VStack(alignment: .leading){
                            
                            Text("6.  Berapa lama fix rate yang kamu ingin hitung?")
                                .font(.headline)
                                .padding()
                                .cornerRadius(16)
                  
                            HStack{
                                TextField("0", value: $viewModel.inputLamaFixRate, formatter: NumberFormatter())
                                    .font(.headline)
                                    .padding()
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .stroke(Color("blueAI"), lineWidth: 1)
                                    }
                                    .keyboardType(.decimalPad)
                                Text("Tahun / \(monthcalculation) Bulan")
                                    .font(.headline)
                            }
                            .padding(.leading)
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        VStack(alignment: .leading){
                            Text("7.  Waktu cicilan floating rate kamu adalah \(Text("\(lamaFloatingRate) Tahun").font(.title2.bold()))")
                                .font(.headline)
                                .padding()
                                .cornerRadius(16)
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("8.  Berapa bunga periode floating rate yang ingin dihitung?")
                                    .font(.headline)
                                    .padding()
                                    .cornerRadius(16)
                                Button {
                                    withAnimation {
                                        showDetailFloatingRate.toggle()
                                    }
                                } label: {
                                    Label("Graph", systemImage: "questionmark.circle")
                                        .labelStyle(.iconOnly)
                                        .imageScale(.large)
    //                                    .rotationEffect(.degrees(showDetail ? 90 : 0))
                                        .foregroundColor(showDetailFloatingRate ?  Color("blue") : Color.primary) // atau pakai .foregroundColor
                                        .scaleEffect(showDetailFloatingRate ? 1 : 1)
                                        .padding()
                                }
                            }
                            
                            if showDetailFloatingRate {
                                Text("Suku bunga yang bisa berubah-ubah sesuai dengan kondisi pasar atau acuan tertentu")
                                    .transition(.moveAndFade)
                                    .font(.caption.italic())
                                    .transition(.moveAndFade)
                                    .padding(.leading)
                            }
                            
                            
                            
                            HStack(){
                                TextField("0.000", value: $viewModel.inputBungaFloatingRate, format: .number) .keyboardType(.decimalPad)
                                    .font(.headline)
                                    .padding()
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .stroke(Color("blueAI"), lineWidth: 1)
                                    }
                                Text("%")
                            }      .padding(.leading)
                        }
                        
                        Spacer()
                        Spacer()
                        
                        if viewModel.inputLamaFixRate ?? 0.0 > 5 {
                            Text("Melebihi batas lama fix rate")
                        }else{
                            HStack{
                                NavigationLink(destination: Page1()){
                                    Text("Back")
                                        .padding()
                                        .colorScheme(.dark)
                                        .cornerRadius(16)
                                        .font(.headline.bold())
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    
                                }
                                NavigationLink(destination: Page4()){
                                    Text("Next")
                                        .padding()
                                        .background(Color("blue"))
                                        .colorScheme(.dark)
                                        .cornerRadius(30)
                                        .font(.headline.bold())
                                        .foregroundColor(.primary)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    
                                }
                            }
                        }
                        
                    }
                }
                .onAppear{
                    while viewModel.progressNumber1 <= 35 {
                        viewModel.progressNumber1 += 0.8
                    }
                }
                .onDisappear(){
                    viewModel.progressNumber1 = 0
                }
                .padding(.horizontal,15 )
                Spacer()
                
            }
        }.navigationBarHidden(true)
    }
}


#Preview {
    Page2().environmentObject(ViewModel())
}
