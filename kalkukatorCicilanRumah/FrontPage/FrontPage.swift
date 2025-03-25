//
//  FrontPage.swift
//  kalkukatorCicilanRumah
//
//  Created by Rizkydwiputra on 23/03/25.
//

import SwiftUI



struct FrontPage: View {
    
    @State private var moveGradient = true
    
    @EnvironmentObject var viewModel : ViewModel
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.size.width
        NavigationStack{
            VStack{
                Image("logoapp")
                    .resizable()
                    .frame(width: 250, height: 140)
                    .padding(.top,150)
                    .padding(.bottom, 30)
                    
                
                Text("""
                     Quickly calculate your monthly mortgage payments with this app.
                     """)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth:250, alignment: .center)
                    .font(.title3.bold())
                Spacer()

                NavigationLink(destination: Page1()){
                    Rectangle()
                        .padding()
                        .colorScheme(.dark)
                        .cornerRadius(16)
                        .font(.title)
                        .foregroundStyle(Color("blueAI"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .overlay{
                            LinearGradient(colors: [.clear, .white, .clear], startPoint: .leading,
                                           endPoint: .trailing)
                            .frame(width: 50)
                            .offset(x: moveGradient ? -screenWidth/2 : screenWidth/2)
                        }
                        .animation(.linear(duration: 5).repeatForever(autoreverses: false),
                                   value: moveGradient)
                        .mask{
                            Text("Click here to start")
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        }
                        .onAppear{
                            self.moveGradient.toggle()
                        }
                }
                .navigationBarHidden(true)
             
                
//                NavigationLink(destination: Page4()){
//                    Text("Calculate")
//                        .padding()
//                        .background(Color("blue"))
//                        .colorScheme(.dark)
//                        .cornerRadius(16)
//                        .font(.largeTitle.bold())
//                        .foregroundColor(.primary)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                    
//                }
                Spacer()
            }
        }
    }
}

#Preview {
    FrontPage().environmentObject(ViewModel())
}
