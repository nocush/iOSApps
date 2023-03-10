//
//  ContentView.swift
//  Lab2_3
//
//  Created by Mateusz Bartoszek on 10/03/2023.
//

import SwiftUI

func isTriangle(a:Int,b:Int,c:Int)->Bool{
    if !(a>0 && b>0 && c>0){
        return false
    }
    if !(a+b>c && a+c>b && b+c>a){
        return false
    }
    return true
}

struct ContentView: View {
    @State var bok1: Int = 0
    @State var bok2: Int = 0
    @State var bok3: Int = 0
    @State var result: String = ""
    
    
    var body: some View {
        ZStack{
            Color(white: 0.21).ignoresSafeArea()
            VStack(alignment:.center) {
                
                Text("Podaj boki trójkąta")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                TextField("bok1",text:Binding(get: {String(self.bok1)}, set: {self.bok1 = Int($0) ?? self.bok1}))
                    .overlay(
                        RoundedRectangle(cornerRadius:10).stroke(.blue, lineWidth: 4))
                    .frame(width:50)
                    .font(.system(size: 30))
                    .foregroundColor(.yellow)
                    .multilineTextAlignment(.center)
                TextField("bok2",text:Binding(get: {String(self.bok2)}, set: {self.bok2 = Int($0) ?? self.bok2}))
                    .overlay(Ellipse().stroke(.gray,lineWidth: 4))
                    .frame(width:50)
                    .foregroundColor(.mint)
                    .font(.system(size: 30))
                    .padding()
                    .multilineTextAlignment(.center)
                TextField("bok3",text:Binding(get: {String(self.bok3)}, set: {self.bok3 = Int($0) ?? self.bok3}))
                    .border(Color.green,width:4)
                    .frame(width:50)
                    .foregroundColor(.red)
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                Text("Wpisano \(bok1), \(bok2), \(bok3)")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.cyan)
                Button("Sprawdź",action: {
                    if isTriangle(a:self.bok1,b:self.bok2,c:self.bok3){
                        self.result = "Trójkąt jest możliwy do zbudowania"
                    }
                    else{
                        self.result = "Nie da się zbudować trójkąta"
                    }
                })
                Text(result)
                    .padding(.vertical)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.brown)
                    .font(.title)
            }.padding(.horizontal, 5.0)
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
