//
//  ContentView.swift
//  Lab4_1
//
//  Created by Mateusz Bartoszek on 12/03/2023.
//

import SwiftUI

struct ContentView: View {
    private var currencies: [String: Double] = ["PLN": 1, "USD": 4.4, "EUR": 4.68, "GBO": 5.29]
    @State private var sourceCurrency:String = "PLN"
    @State private var destinationCurrency: String = "PLN"
    @State private var amount: Int = 1
    @State private var showHours: Bool = false
    @State private var showContact: Bool = false
    @State var isHidden: Bool = false
    var body: some View {
        VStack {
            Text("Kantor")
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .font(.largeTitle)
            Spacer()
            
            Group{
                Text("Kupowana waluta")
                
                TextField("Wartość kupowanej waluty",text: Binding(get: {String(self.amount)}, set: {self.amount = abs(Int($0) ?? self.amount)}))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Picker("Kupowana waluta", selection: $sourceCurrency){
                    ForEach(Array(currencies.keys),id: \.self){
                        key in Text(key)
                    }
                }.labelsHidden()
                
            }
            Divider().padding()
            Group{
                Text("Płatność za pomocą")
                
                Picker("Płatność za pomocą",selection: $destinationCurrency){
                    ForEach(Array(currencies.keys),id: \.self){ key in Text(key)}
                }.labelsHidden()
                
                Text("Do zapłaty: \(self.currencies[self.sourceCurrency]! / self.currencies[self.destinationCurrency]! * Double(self.amount),specifier: "%.2f") \(self.destinationCurrency)")
            }
            Spacer()
            if(!isHidden){
                ZStack{
                    Link(destination: URL(string: "http://empik.com")!){
                        Image("unnamed")
                            .resizable()
                            .frame(width: 300, height:60)
                    }
                    Button(action: {isHidden = true}, label:{
                        Text("X")
                    }).background(Color.white)
                        .font(.title2)
                        .frame(width: 50, height:50)
                        .offset(x: CGFloat(144),y: CGFloat(-20))
                }
            }
            HStack{
                Button(action:{self.showHours = true}){
                    Image(systemName: "clock").resizable().frame(width:40,height:40)
                }
                .alert(isPresented:$showHours){
                    Alert(title: Text("Godziny otwarcia"),message: Text("Pn-Pt: 9:00-21:00"))
                }
                
                Button(action:{ self.showContact = true}){
                    Image(systemName: "person.circle").resizable()
                        .frame(width:40,height:40)
                }
                .alert(isPresented:$showContact){
                    Alert(title: Text("Kontakt"),message:
                        Text("kantor@gmail.com")
                    )
                }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
