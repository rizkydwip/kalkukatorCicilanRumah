//
//  Page1.swift
//  kalkukatorCicilanRumah
//
//  Created by Rizkydwiputra on 17/03/25.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

class ViewModel: ObservableObject {
    
     @Published var hargaProperty: Float?
     @Published var downPayment: Float?
     @Published var lamaCicilan : Float = 0
     @Published var inputFixRate: Float?
     @Published var inputLamaFixRate: Float?
     @Published var inputBungaFloatingRate: Float = 0
     @Published var progressNumber1: CGFloat = 0
     @Published var progressNumber2: CGFloat = 0
     @Published var progressNumber3: CGFloat = 0
     @Published var progressNumber4: CGFloat = 0

    
}


struct ProgressBar: View {
    @EnvironmentObject var viewModel : ViewModel
    @Binding var progress: CGFloat
    
    private var barColor: Color
    private var animationTime: TimeInterval = 5
    
    public init(initialProgress: Binding<CGFloat>, color: Color){
        self._progress = initialProgress
        self.barColor = color
    }
    
    var body: some View {
       
        GeometryReader{ geo in
            ZStack(alignment: .leading){
                Rectangle()
                    .fill(Color(.gray).opacity(0.3))
                
                Rectangle()
                    .fill(barColor)
                    .frame(width: min(geo.size.width,
                                      geo.size.height * progress))
                    .animation(.linear)
            }.cornerRadius(25.0)
        }
    }
}





struct Page1: View {
    @EnvironmentObject var viewModel : ViewModel
    @State private var showDetail = false
    @State var lamaCicilanFloatingRate: [Double] = []
    @State private var isValid = true
    @State var progress: CGFloat = 0.0
    
    
    
    func totalPinjamanPokok(hargaProperty: Float, downPayment:Float) -> Int{
        Int (hargaProperty - ((downPayment/100) * hargaProperty))

    }

    var body: some View {
                
        NavigationView{
            ScrollView{
                
                VStack(alignment: .leading, spacing: 50){
                    VStack(alignment: .leading, spacing: 10){
                        Text(" Step 1 of 3")
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
                                .foregroundStyle(Color("blueAI"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.trailing, 90)
                                
                            
                                
                                Image(
                                    systemName:"circle.fill")
                                .foregroundStyle(Color(.gray))
                                .frame(maxWidth: 20 , alignment: .leading)
                                
                                
                                Image(
                                    systemName:"circle.fill")
                                .foregroundStyle(Color(.gray))
                                .frame(maxWidth: .infinity, alignment: .trailing)
       
                                
                         
                            }
                        }
                            
                        
                        Spacer()
                        Text("1.  Berapa harga properti yang kamu inginkan ? ")
                            .font(.headline)
                            .padding()
                            .cornerRadius(16)
                            .frame(width: .infinity, height: 80)
                        
                        
                        VStack(alignment:.trailing){
                            TextField("0.000", value: $viewModel.hargaProperty, formatter: NumberFormatter())
                                .padding()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("blueAI"), lineWidth: 4)
                                }
                                .keyboardType(.numberPad)
                                .cornerRadius(16)
                                .frame(maxWidth: .infinity,alignment: .trailing)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10){
                        HStack{
                            Text("2.  Berapa persen Down payment yang ingin kamu setor ? ")
                                .font(.headline)
                                .padding()
                                .cornerRadius(16)
                                .frame(width: .infinity, height: 80)
                            Button {
                                withAnimation {
                                    showDetail.toggle()
                                }
                            } label: {
                                Label("Graph", systemImage: "chevron.right.circle")
                                    .labelStyle(.iconOnly)
                                    .imageScale(.large)
                                    .rotationEffect(.degrees(showDetail ? 90 : 0))
                                    .scaleEffect(showDetail ? 1 : 1)
                                    .padding()
                            }
                        }
                        if showDetail {
                            Text("Down Payment artinya adalah uang muka. Ini adalah pembayaran awal yang dibayarkan di muka sebelum cicilan dilakukan.")
                                .transition(.moveAndFade)
                                .font(.caption.italic())
                        }
                        TextField("0.000", value: $viewModel.downPayment, formatter: NumberFormatter())
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 4)
                            }
                            .keyboardType(.numberPad)
                            .cornerRadius(16)
                    }
                    
                    
                    if viewModel.downPayment ?? 0.0 >= 50 {
                        Text("melebihi batas downpayment")
                    } else {
                        VStack(alignment: .leading, spacing: 10){
                            Text("3. Dari data yang telah kamu isi maka pinjaman pokok mu akan sebesar ")
                                .font(.headline)
                                .padding()
                                .cornerRadius(16)
                                .frame(width: .infinity, height: 80)
                            Text("\(totalPinjamanPokok(hargaProperty: viewModel.hargaProperty ?? 0.0, downPayment: viewModel.downPayment ?? 0.0))")
                                .padding()
                                .font(.largeTitle.bold())
                                .keyboardType(.numberPad)
                                .cornerRadius(16)
                            
                            Spacer()
                            HStack{

                                NavigationLink(destination: FrontPage()){
                                    Text("Back")
                                        .padding()
                                        .colorScheme(.dark)
                                        .cornerRadius(16)
                                        .font(.headline.bold())
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    
                                }
                                
                                NavigationLink(destination: Page2()){
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
                    Spacer()
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}



#Preview {
    Page1().environmentObject(ViewModel())

}


