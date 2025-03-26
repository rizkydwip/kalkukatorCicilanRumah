//
//  Page4.swift
//  kalkukatorCicilanRumah
//
//  Created by Rizkydwiputra on 17/03/25.
//

import SwiftUI



struct Page4: View {
    
    @State private var input2 = ""
    @EnvironmentObject var viewModel : ViewModel
    
    var body: some View {
        
        
        let downPayment = Double( ((viewModel.hargaProperty ?? 0.0)  * Float(viewModel.downPayment ?? 0.0 ) * 0.01))
        
        let totalPinjamanPokok = Int( Double(viewModel.hargaProperty ?? 0.0) - downPayment )
        
        let monthcalculation = Int((Float(viewModel.inputLamaFixRate ?? 0.0)) * 12 )
        
        let rumusLamaFloatingRate = Int(viewModel.lamaCicilan - Float(viewModel.inputLamaFixRate ?? 0.0))
        NavigationStack{
            ScrollView{
                
                VStack(alignment: .leading, spacing: 10){
                    Text(" Step 3 of 3")
                        .frame(maxWidth: .infinity, alignment: .leading )
                        .font(.subheadline)
                        .foregroundStyle(Color("blueAI"))
                    ZStack{
                        
                        HStack{
                            
                            ProgressBar(initialProgress: $viewModel.progressNumber3, color: Color("blue"))
                                .frame(width: 180, height: 5)
                            
                            ProgressBar(initialProgress: $viewModel.progressNumber2, color: Color("blue"))
                                .frame(width:180, height: 5)
                            
                            
                            
                        }
                        
                        HStack{
                            Image(
                                systemName:"circle.fill")
                            .foregroundStyle(Color("blue"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 90)
                            
                            
                            
                            Image(
                                systemName:"circle.fill")
                            .foregroundStyle(Color("blue"))
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
                            .padding(.trailing, 90)
                            
                            
                            Image(
                                systemName:"checkmark.circle")
                            .foregroundStyle(Color(.white))
                            .frame(maxWidth: 19, alignment: .leading)
                            .padding(.trailing, 1)
                            
                            
                            Image(
                                systemName:"circle.fill")
                            .foregroundStyle(Color("blueAI"))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            
                        }
                    }
                    
                    Text("Summary")
                        .font(.largeTitle.bold())
                        .padding(.leading)
                    
                    
                    VStack(alignment: .leading){
                        Text("1.  Harga Property :")
                            .font(.headline)
                            .padding()
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        
                        TextField("0.000", value: $viewModel.hargaProperty, formatter: NumberFormatter())
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 4)
                            }
                            .keyboardType(.numberPad)
                            .cornerRadius(16)
                            .frame(maxWidth: .infinity,alignment: .trailing)
                            .padding(.leading)
                        
                        
                        
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("2.  Down Payment :  ")
                            .font(.headline)
                            .padding()
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        
                        HStack{
                            TextField("0.000", value: $viewModel.downPayment, formatter: NumberFormatter())
                                .padding()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("blueAI"), lineWidth: 4)
                                }
                                .keyboardType(.numberPad)
                                .cornerRadius(16)
                                .font(.headline)
                            Text("%")
                                .font(.headline)
                        }.padding(.leading)
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("3.  Pinjaman Pokok : ")
                            .font(.headline)
                            .padding()
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        
                        Text("\(totalPinjamanPokok)")
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 2)
                            }
                            .keyboardType(.numberPad)
                            .padding(.leading)
                    }
                    
                    VStack(alignment: .leading){
                        Text("4.  Jangka waktu :  ")
                            .font(.headline)
                            .padding()
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        
                        TextField("0.000", value: $viewModel.lamaCicilan, formatter: NumberFormatter())
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 4)
                            }
                            .keyboardType(.numberPad)
                            .cornerRadius(16)
                            .padding(.leading)
                        if viewModel.lamaCicilan > 30 {
                            Text("Melebihi batas lamanya cicilan")
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("5. Bunga Fixrate ")
                            .font(.title3.bold())
                            .padding()
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        HStack{
                            TextField("0.000 %", value: $viewModel.inputFixRate, format: .number)
                                .padding()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("blueAI"), lineWidth: 2)
                                }
                                .keyboardType(.decimalPad)
                                .font(.headline)
                                .padding(.leading)
                            Text("%")
                                .font(.headline)
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("6. Lama Fixrate")
                            .font(.title3.bold())
                            .padding()
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        HStack{
                            TextField("0", value: $viewModel.inputLamaFixRate, formatter: NumberFormatter())
                                .font(.headline)
                                .padding()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("blueAI"), lineWidth: 2)
                                }
                                .keyboardType(.decimalPad)
                            Text("Tahun / \(monthcalculation) Bulan")
                                .font(.headline)
                        }.padding(.leading)
                    }
                    if viewModel.inputLamaFixRate ?? 0.0 > 5 {
                        Text("Melebihi batas lama fix rate")
                    }
                    
                    VStack(alignment: .leading){
                        Text("7.  Bunga Floatingrate")
                            .font(.title3.bold())
                            .padding()
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        HStack(){
                            TextField("0.000", value: $viewModel.inputBungaFloatingRate, format: .number) .keyboardType(.decimalPad)
                                .font(.headline)
                                .padding()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("blueAI"), lineWidth: 2)
                                }
                            Text("%")
                        }.padding(.leading)
                    }
                    
                    VStack(alignment: .leading){
                        Text("8. Lama bunga floatingrate")
                            .font(.title3.bold())
                            .padding()
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        HStack(){
                            Text("\(rumusLamaFloatingRate)")
                                .keyboardType(.decimalPad)
                                .frame(maxWidth:.infinity, alignment: .leading)
                                .font(.headline)
                                .padding()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color("blueAI"), lineWidth: 2)
                                }
                        }.padding(.leading)
                    }
                    
                    
                    Spacer()
                    Spacer()
                    HStack{
                        NavigationLink(destination: Page2()){
                            Text("Back")
                                .padding()
                                .colorScheme(.dark)
                                .cornerRadius(16)
                                .font(.headline.bold())
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                        }
                        NavigationLink(destination: ResultsPage()){
                            Text("Calculate")
                                .padding()
                                .background(Color("blue"))
                                .colorScheme(.dark)
                                .cornerRadius(30)
                                .font(.headline.bold())
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                        }
                    }
                    
                    Spacer()
                }
                .onAppear{
                    viewModel.progressNumber3 = 35
                    while viewModel.progressNumber2 <= 35 {
                        viewModel.progressNumber2 += 0.8
                    }
                }
                .onDisappear(){
                    viewModel.progressNumber2 = 0
                }
                
                .padding(.horizontal, 10)
            }
        } .navigationBarHidden(true)
    }
}



#Preview {
    Page4().environmentObject(ViewModel())
}
