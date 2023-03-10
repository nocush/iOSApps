//
//  ContentView.swift
//  Lab2_4
//
//  Created by Mateusz Bartoszek on 10/03/2023.
//

import SwiftUI

func dodaj(a:Int,b:Int)->String{
    return String(a+b)
}
func odejmij(a:Int,b:Int)->String{
    return String(a-b)
}
func mnozenie(a:Int,b:Int)->String{
    return String(a * b)
}
func dzielenie(a:Int,b:Int)->String{
    if(b==0){
        return "Dzielenie przez zero"
    }else{
        return String(format:"%.2f",Double(a)/(Double(b)))
    }
}

struct ContentView: View {
    @State var liczba1:Int = 0
    @State var liczba2:Int = 0
    @State var result: String = ""
    
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            Color.black.opacity(0.8).ignoresSafeArea()
            VStack(alignment: .center) {
                Text("Operacje arytmetyczne")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("Podaj liczby")
                    .padding()
                    .foregroundColor(.white)
                    .font(.title)
                HStack(alignment: .center){
                    TextField("Liczba1",text:Binding(get: {String(self.liczba1)}, set: {self.liczba1 = Int($0) ?? self.liczba1}))
                        .overlay(
                            RoundedRectangle(cornerRadius:10).stroke(.blue, lineWidth: 4))
                        .frame(width:70)
                        .padding()
                    TextField("Liczba2",text:Binding(get: {String(self.liczba2)}, set: {self.liczba2 = Int($0) ?? self.liczba2}))
                        .overlay(
                            RoundedRectangle(cornerRadius:10).stroke(.blue, lineWidth: 4))
                        .frame(width:70)
                        .padding()
                }.padding()
                    .foregroundColor(.white)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                HStack(alignment:.center){
                    
                    Button(action:{
                        self.result=dodaj(a:self.liczba1,b:self.liczba2)
                    }){
                        Image(systemName: "plus.square")
                    }
                    .frame(width:25)
                    .padding()
                    Button(action:{
                        self.result=odejmij(a:self.liczba1,b:self.liczba2)
                    }){
                        Image(systemName: "minus.square")
                    }
                    .frame(width:50)
                    Button(action:{
                        self.result=mnozenie(a:self.liczba1,b:self.liczba2)
                    }){
                        Image(systemName: "multiply.square")
                    }
                    .frame(width:75)
                    Button(action:{
                        self.result=dzielenie(a:self.liczba1,b:self.liczba2)
                    }){
                        Image(systemName: "divide.square")
                    }
                    .frame(width:50)
                }.font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(result)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
