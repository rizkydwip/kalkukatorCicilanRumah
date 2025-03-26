//
//  ResultsPage.swift
//  kalkukatorCicilanRumah
//
//  Created by Rizkydwiputra on 19/03/25.
//

import SwiftUI

struct ResultsPage: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    var body: some View {
        // coba
        
        let downPayment = Double( ((viewModel.hargaProperty ?? 0.0)  * Float(viewModel.downPayment ?? 0.0 ) * 0.01))
        
        let totalPinjamanPokok = Int( Double(viewModel.hargaProperty ?? 0.0) - downPayment )
        
        let angsuranPokok = Double(
            (Double(totalPinjamanPokok) / (Double(viewModel.lamaCicilan) * 12))
        )
        
        let bungaFixRate = Double((Float(totalPinjamanPokok) * Float(viewModel.inputFixRate ?? 0.0)*0.01) / 12)
        
        
        let angsuranFixRatePerBulan = angsuranPokok + bungaFixRate
        
        let bungaFloatingRate = Double((Float(totalPinjamanPokok) * Float(viewModel.inputBungaFloatingRate ?? 0.0)*0.01) / 12)
        
        let angsuranBungaFloatingRate = angsuranPokok + bungaFloatingRate
        
        let totalBungaPeriodeFixRate =  angsuranFixRatePerBulan * Double(viewModel.inputLamaFixRate ?? 0.0 ) * 12
        
        let rumusLamaFloatingRate = Double(viewModel.lamaCicilan - Float(viewModel.inputLamaFixRate ?? 0.0))
        
        let totalBungaFloatingRate =  angsuranBungaFloatingRate * Double(rumusLamaFloatingRate) * 12
        
        let pembayaranKprHinggaLunas = totalBungaPeriodeFixRate + totalBungaFloatingRate
        
        NavigationStack{
            ScrollView{
                
                VStack(alignment: .leading, spacing: 10){
                    Text(" Complete ")
                        .frame(maxWidth: .infinity, alignment: .leading )
                        .font(.subheadline)
                        .foregroundStyle(Color("blueAI"))
                    ZStack{
                        HStack{
                            ProgressBar(initialProgress: $viewModel.progressNumber3, color: Color("blue"))
                                .frame(width: 180, height: 5)
                            
                            ProgressBar(initialProgress: $viewModel.progressNumber4, color: Color("blue"))
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
                            .foregroundStyle(Color("blue"))
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
                                systemName:"checkmark.circle")
                            .foregroundStyle(Color(.white))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            
                        }
                    }
                    
                    Text("Results")
                        .font(.largeTitle.bold())
                        .padding(.leading)
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("total pinjaman pokok  ")
                            .font(.title3.bold())
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
                    }.padding(.leading)
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("Angsuran pokok  ")
                            .font(.title3.bold())
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        Text(String(format: "%.2f", angsuranPokok))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 2)
                            }
                            .keyboardType(.numberPad)
                    }.padding(.leading)
                    
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading){
                        Text("bunga fixrate ")
                            .font(.title3.bold())
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        //                        Text("\(bungaFixRate)")
                        Text(String(format: "%.2f", bungaFixRate))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 2)
                            }
                            .keyboardType(.numberPad)
                    }.padding(.leading)
                    
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading){
                        Text("Angsuran pokok + bunga fixrate ")
                            .font(.title3.bold())
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        //                        Text("\(angsuranFixRatePerBulan)")
                        Text(String(format: "%.2f", angsuranFixRatePerBulan))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 2)
                            }
                            .keyboardType(.numberPad)
                    }.padding(.leading)
                    
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading){
                        Text("Angsuran pokok + bunga floatingrate ")
                            .font(.title3.bold())
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        //                        Text("\(angsuranBungaFloatingRate)")
                        Text(String(format: "%.2f", angsuranBungaFloatingRate))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 2)
                            }
                            .keyboardType(.numberPad)
                    }.padding(.leading)
                    
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading){
                        Text(" Total periode fixrate ")
                            .font(.title3.bold())
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        //                        Text("\(totalBungaPeriodeFixRate)")
                        Text(String(format: "%.2f", totalBungaPeriodeFixRate))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 2)
                            }
                            .keyboardType(.numberPad)
                    }.padding(.leading)
                    
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading){
                        Text("Total periode floatingrate  ")
                            .font(.title3.bold())
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        //                        Text("\(totalBungaFloatingRate)")
                        Text(String(format: "%.2f", totalBungaFloatingRate))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 2)
                            }
                            .keyboardType(.numberPad)
                    }.padding(.leading)
                    
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading){
                        Text("Total KPR hingga lunas ")
                            .font(.title3.bold())
                            .cornerRadius(16)
                            .frame(width: .infinity)
                        //                        Text("\(pembayaranKprHinggaLunas)")
                        Text(String(format: "%.2f", pembayaranKprHinggaLunas))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color("blueAI"), lineWidth: 2)
                            }
                            .keyboardType(.numberPad)
                    }.padding(.leading)
                    
                    
                    Spacer()
                    NavigationLink(destination: Page1()){
                        Text("Recalculate")
                            .padding()
                            .background(Color("blue"))
                            .colorScheme(.dark)
                            .cornerRadius(30)
                            .font(.headline.bold())
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    Spacer()
                }
                .onAppear{
                    viewModel.progressNumber3 = 35
                    viewModel.progressNumber4 = 35
                    while viewModel.progressNumber2 <= 35 {
                        viewModel.progressNumber2 += 0.8
                    }
                }.onDisappear{
                    viewModel.hargaProperty = 0
                    viewModel.downPayment = 0
                    viewModel.lamaCicilan = 0
                    viewModel.inputFixRate = 0
                    viewModel.inputLamaFixRate = 0
                    viewModel.inputBungaFloatingRate = 0
                    viewModel.progressNumber1 = 0
                    viewModel.progressNumber2 = 0
                    viewModel.progressNumber3 = 0
                    viewModel.progressNumber4 = 0
                }
                
                .padding(.horizontal, 10)
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    ResultsPage().environmentObject(ViewModel())
}
