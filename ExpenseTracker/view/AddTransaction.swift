//
//  AddTransaction.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-03.
//

import SwiftUI
import SwiftUIFontIcon


struct AddTransaction: View {
    
    
    
    @Binding var isShowing: Bool
    @State private var curHeight : CGFloat = UIScreen.main.bounds.height * 0.75
    @State private var transactionName: String = ""
    
    @State private var showCategoryMessage = true
    @State private var buttonSign : String = "plus"
    @State private var categoryImage: String = "tray.and.arrow.up"
    @State private var transactionValue : String = ""
    @State private var buttonsColor : Color = Color.green
    @State private var colorFlag: Bool = true
    @State private var numericValue: String = ""
    
    @State var openCategory = false
    
    @State var isGroseriesClicked = false
    @State private var showAlertMessage = false
    
    
    let addTransactionViewModel: AddTransactionViewModel
    
    
    @State private var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.usesGroupingSeparator = true
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing{
                Color.black
                    .opacity(0.51)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                ViewContent
                    .transition(.move(edge:.bottom))
                
            }
            
        }
        
    }
    
    var ViewContent: some View {
        
        
        VStack{
            
            ZStack{
                Capsule()
                    .frame(width: 40, height: 4)
            }.frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.00001))
            
            ZStack{
                
                VStack{
                    
                    HStack{
                        Text("Add Transaction:").font(.title).foregroundColor(Color.fontColor).bold().padding(.leading)
                        Spacer()
                        
                        
                    }
                    
                    ZStack{
                        
                        if showCategoryMessage {
                            Text("Tap here to choose \n a category")
                                .font(.system(size: 20, weight: .black))
                                .padding()
                                .background(.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                                .offset(x: -22, y: -60)
                                .zIndex(5)
                                .overlay(alignment: .bottomTrailing) {
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.title)
                                        .rotationEffect(.degrees(-45))
                                        .offset(x: -10, y: -50)
                                        .foregroundColor(.blue)
                                }
                                .opacity(0.9)
                                .onAppear {
                                    Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
                                        withAnimation {
                                            showCategoryMessage = false
                                        }
                                    }
                                }
                        }
                        
                        
                        ZStack{
                            HStack{
                                TextField("Transaction Name", text: $transactionName)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 16)
                                    .background(Color.white)
                                    .cornerRadius (10)
                                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 20))
                                    .foregroundColor(Color.fontColor)
                                    .font(.system(size: 28))
                                    .shadow(color: buttonsColor ,radius: 10)
                                
                                
                                
                                ZStack{
                                    
                                    Button(action: {
                                        
                                        
                                        if colorFlag == false{
                                            self.openCategory.toggle()
                                        }
                                        
                                    }){
                                        Image(systemName: categoryImage)
                                            .rotationEffect(.degrees(openCategory ? 360 : 0))
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .bold))
                                            .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 4))
                                        
                                    }
                                }.padding(24)
                                    .background(buttonsColor)
                                    .opacity(0.7)
                                    .mask(Circle())
                                    .shadow(color: Color.teal ,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .offset(CGSize(width: -10, height: -10))
                                
                                
                            }
                            
                            
                            
                            Group{
                                ButtonDisplay(isButtonClicked: $openCategory, icon: "fork.knife", color: Color.teal,
                                              offsetX: 150, offsetY: -100){
                                    openCategory.toggle()
                                    categoryImage = "fork.knife"
                                    isGroseriesClicked.toggle()
                                }.zIndex(50)
                                
                                
                                ButtonDisplay(isButtonClicked: $openCategory, icon: "cart", color: Color.teal,
                                              offsetX: 80, offsetY: -70){
                                    openCategory.toggle()
                                    categoryImage = "cart"
                                    isGroseriesClicked.toggle()
                                }.zIndex(50)
                                
                                
                                ButtonDisplay(isButtonClicked: $openCategory, icon: "fuelpump", color: Color.teal,
                                              offsetX: 50, offsetY: 0){
                                    openCategory.toggle()
                                    categoryImage = "fuelpump"
                                    isGroseriesClicked.toggle()
                                }.zIndex(50)
                                
                                
                                ButtonDisplay(isButtonClicked: $openCategory, icon: "gamecontroller", color: Color.teal,
                                              offsetX: 80, offsetY: 70){
                                    openCategory.toggle()
                                    categoryImage = "gamecontroller"
                                    isGroseriesClicked.toggle()
                                }.zIndex(50)
                                
                                
                                ButtonDisplay(isButtonClicked: $openCategory, icon: "doc.text", color: Color.teal,
                                              offsetX: 150, offsetY: 100){
                                    openCategory.toggle()
                                    categoryImage = "doc.text"
                                    isGroseriesClicked.toggle()
                                }.zIndex(50)
                                
                            }
                            
                    
                        }
                        
                        
                    }.zIndex(10)
                    
                    
                    
                    HStack{
                        
                        
                        Button(action: {
                            self.colorFlag.toggle()
                            updateButtonProperties()
                        }, label: {
                            Image(systemName: buttonSign)
                                .rotationEffect(.degrees(colorFlag ? 360 : 0))
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                                .animation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0))
                        }).padding(24)
                            .frame(width: 60, height: 60)
                            .background(buttonsColor)
                            .opacity(0.9)
                            .mask(Circle())
                            .shadow(color: Color.teal ,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding(.leading,20)
                        
                        
                        
                        
                        Text(currencyFormatter.string(from: NSNumber(value: Double(numericValue) ?? 0)) ?? "")
                            .frame(width: 290, height: 70)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.trailing, 20)
                            .foregroundColor(Color.fontColor)
                            .font(.system(size: 28))
                            .shadow(color: buttonsColor, radius: 10)
                        
                    }
                    
                    
                    
                    
                    Spacer()
                    
                    
                    NumericPad(numericValue: $numericValue, enterColor: $buttonsColor, sendButtonAction: {
                        
                        
                        if(transactionName == "" ){
                            showAlertMessage = true
                        }else{
                            
                            if(colorFlag == true){
                                numericValue = numericValue
                            }else{
                                numericValue = "-" + numericValue
                            }
                            
                            addTransactionViewModel.addTransaction(amount: Double(numericValue) ?? 0.00, category: categoryImage, incomeOrExpenseVal: colorFlag , transactionName: transactionName)
                            
                            isShowing = false
                            numericValue = ""
                            transactionName = ""
                            
                        }
                        
                        
                    }).alert(isPresented: $showAlertMessage) {
                        Alert(
                            title: Text("Error"),
                            message: Text("Transaction name must not be empty."),
                            dismissButton: .default(Text("ok"))
                        )
                    }
                    
                    
                }
                
                
            }.frame(maxHeight: .infinity)
                .padding(.bottom, 30)
            
            
            
        }.frame(height: curHeight)
            .frame(maxWidth: .infinity)
            .background(
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                    Rectangle().frame(height: curHeight/2)
                }.foregroundColor(Color.backgroundAsset)
            )
            .animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        curHeight = max(gesture.location.y, curHeight)
                    }
                    .onEnded { gesture in
                        if gesture.predictedEndLocation.y > UIScreen.main.bounds.height * 0.5 {
                            isShowing = false
                        }
                    }
            )
    }
    
    
    func updateButtonProperties() {
        if colorFlag == false {
            buttonSign = "minus"
            buttonsColor = Color.red
            openCategory = false
            categoryImage = "square.grid.3x3.fill"
            
        } else {
            buttonSign = "plus"
            buttonsColor = Color.green
            categoryImage = "tray.and.arrow.up"
            openCategory = false
            
        }
    }
    
}

#Preview {
    AddTransaction(isShowing: .constant(true), addTransactionViewModel: AddTransactionViewModel())
}

