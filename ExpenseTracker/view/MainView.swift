//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2023-12-31.
//

import SwiftUI
import SwiftUICharts

struct MainView: View {
    
     @StateObject private var recentListViewModel = RecentListViewModel()
    
    //flag for the menuButton
    @State var openMenu = false
    @State var isTransactionListClicked = false
    @State var isAddTransactionClicked = false
    @State var totalAmountString: String = ""
    
    var amountArray: [Double]  {
        recentListViewModel.getAmounts()
    }
    
    
    var totalAmountGraph: Double {
        recentListViewModel.getTotalAmount()
    }
     
     
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    
    var body: some View {
        
        
        NavigationView {
            
            ZStack{
                Color.backgroundAsset.ignoresSafeArea()
                
                ScrollView{
                    //Vertical layout
                    VStack{
                        
                        HStack{
                            Text("Overview")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            Spacer()
                        }
                        
                        CardView {
                            ChartLabel(totalAmountString, type: .title)
                            LineChart()
                        }
                        .data(amountArray)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground,
                                              foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                        .id(UUID())

                        
                        HStack{
                            Text("Recent transactions")
                                .font(.title2)
                                .padding(.top)
                                .bold()
                            Spacer()
                        }
                        
                        VStack{
                            CardView{
                                RecentList()
                            }
                        }.frame(height: 400)
                        
                        
                    }
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                .navigationBarTitleDisplayMode(.inline)
                
                
                ZStack{
                    Button(action: {
                        self.openMenu.toggle()
                        
                    }){
                        Image(systemName: "text.justify")
                            .rotationEffect(.degrees(openMenu ? 90 : 0))
                            .foregroundColor(.white)
                            .font(.system(size: 38, weight: .bold))
                            .animation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0))
                        
                    }
                }.padding(24)
                    .background(Color.teal)
                    .mask(Circle())
                    .shadow(color: Color.teal ,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .offset(x: UIScreen.main.bounds.width * 0.3, y: UIScreen.main.bounds.height * 0.4)
                
                
                ButtonDisplay(isButtonClicked: $openMenu, icon: "list.bullet", color: Color.icon,
                              offsetX: Int(UIScreen.main.bounds.width * 0.35), offsetY: Int(UIScreen.main.bounds.height * 0.3)){
                    // .toogle() inverts the state of the bool
                    isTransactionListClicked.toggle()
                }.background(NavigationLink(destination: TransactionList(), isActive: $isTransactionListClicked) {
                    EmptyView()
                })
                
                
                ButtonDisplay(isButtonClicked: $openMenu, icon: "plus", color: Color.blue,
                              offsetX: Int(UIScreen.main.bounds.width * 0.15), offsetY: Int(UIScreen.main.bounds.height * 0.32), delay: 0.2){
                    // .toogle() inverts the state of the bool
                    isAddTransactionClicked.toggle()
                    self.openMenu.toggle()
                }
                
                AddTransaction(isShowing: $isAddTransactionClicked, addTransactionViewModel: AddTransactionViewModel())
                
                
                
            }.onAppear() {
                recentListViewModel.getAllTransactions()
                
                
            }.onReceive(recentListViewModel.$totalAmountGraph) { newValue in
                // Este bloque se ejecutará cuando totalAmountGraph cambie
                totalAmountString = MainView.currencyFormatter.string(from: NSNumber(value: newValue)) ?? ""
                print("totalAmountGraph ha cambiado a \(newValue)")
            }
            
        }
        .navigationViewStyle(.stack)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        //watch activity in dark mode
        MainView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
