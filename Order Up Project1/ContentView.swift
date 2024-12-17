//
//  ContentView.swift
//  Order Up Project1
//
//  Created by Wood, Aiden - Student on 9/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var oneQuantity: Double = 0
    @State var twoQuantity: Double  = 0
    @State var threeQuantity: Double = 0
    @State var fourQuantity: Double = 0
    @State var fiveQuantity: Double = 0
    @State var userName: String = ""
    @State var userPhone: String = ""
    @State var applePay: Bool = false
    @State var menuTotal: Double = 0
    @State var promoCode: String = ""
    
    var body: some View {
        VStack {
           Text("Order Up")
                .font(.largeTitle)
                .fontDesign(.rounded)
            ScrollView {
                MenuCard(menuQuantity: $oneQuantity, menuName: "Large Cheese Pizza", price: "$11", menuImage: "fork.knife")
                MenuCard(menuQuantity: $twoQuantity, menuName: "Large Pepperoni Pizza", price: "$12", menuImage: "fork.knife")
                MenuCard(menuQuantity: $threeQuantity, menuName: "Gourmet Cheeseburger", price: "$9", menuImage: "fork.knife")
                MenuCard(menuQuantity: $fourQuantity, menuName: "Gourmet Double Cheesburger", price: "$11", menuImage: "fork.knife")
                MenuCard(menuQuantity: $fiveQuantity, menuName: "Fountain Drink (Fill up at location)", price: "$3", menuImage: "fork.knife")
            }
            GroupBox {
                TextField("Enter Name", text: $userName)
                TextField("Enter Phone Number", text: $userPhone)
                TextField("Promo Code", text: $promoCode)
                    .textInputAutocapitalization(.never)
                Toggle("Use Apple Pay (Pay Now)", isOn: $applePay)
                Text("Name: \(userName)")
                Text("Phone Number: \(userPhone)")
                Text ("Total: $\(menuTotal, specifier: "%.2f")")
                Button("Calculate total"){
                    menuTotal = (((oneQuantity * 11) + (twoQuantity * 12) + (threeQuantity * 9) + (fourQuantity * 11) + (fiveQuantity * 3))*1.0805)
                    if promoCode == "myLuckyDay" {menuTotal *= 0.75 }
                }
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.colorOne, .colorThree]), startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    ContentView()
}

struct MenuCard: View {
   
    @Binding var menuQuantity: Double
//    @Binding var menuTotal: Double?
    
    
    var menuName: String
    var price: String
    var menuImage: String
    
    
    var body: some View {
        VStack {
            HStack {
                Text(menuName)
                Text(price)
                Spacer()
                Image(systemName: menuImage)
                    .font(.system(size: 40))
                
            }
            TextField("Quantity of Item", value: $menuQuantity, format: .number)
                
        }
        .padding()
        .background(.colorTwo)
    }
}
