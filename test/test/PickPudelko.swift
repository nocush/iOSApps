//
//  PickPudelko.swift
//  test
//
//  Created by Mateusz Bartoszek on 16/06/2023.
//

import SwiftUI

struct PickPudelko: View {
    @State var test: String = ""
    @State private var showAlert1 = false
    @State private var showAlert2 = false
    @State private var showAlert3 = false
    var body: some View {
        VStack{
            
                ZStack{
                    Image("lodym").resizable().frame(width: 200,height:200)
                    Text("Małe pudełko").foregroundColor(Color.black)
                        .offset(y:70)
                }
            .overlay(
                RoundedRectangle(cornerRadius:20, style: .continuous).stroke(Color.gray, lineWidth: 4)).padding()
                .gesture(TapGesture().onEnded{test = "test"})
                .gesture(LongPressGesture().onEnded{_ in showAlert1 = true})
                
                .alert(isPresented: $showAlert1){
                    Alert(title:Text("Małe Pudelko"),message: Text("Pojemność 500ml, 2 smaki"),dismissButton: .cancel())}
            
                ZStack{
                    Image("lodyl").resizable().frame(width: 200,height:200)
                    Text("Średnie pudełko").foregroundColor(Color.black)
                        .offset(y:70)
                }
            .overlay(
                RoundedRectangle(cornerRadius:20, style: .continuous).stroke(Color.gray, lineWidth: 4)).padding()
                .gesture(TapGesture().onEnded{test = "test"})
                .gesture(LongPressGesture().onEnded{_ in showAlert2 = true})
                
                .alert(isPresented: $showAlert2){
                    Alert(title:Text("Średnie Pudelko"),message: Text("Pojemność 750ml, 4 smaki"),dismissButton: .default(Text("Got it")))
                }
            
                ZStack{
                    Image("lodyxl").resizable().frame(width: 200,height:200)
                    Text("Duże pudełko").foregroundColor(Color.black)
                        .offset(y:70)
                }
            .overlay(
                RoundedRectangle(cornerRadius:20, style: .continuous).stroke(Color.gray, lineWidth: 4))
            .padding()
            .gesture(TapGesture().onEnded{test = "test"})
            .gesture(LongPressGesture().onEnded{_ in showAlert3 = true})
            
            .alert(isPresented: $showAlert3){
                Alert(title:Text("Duże Pudelko"),message: Text("Pojemność 1000ml, 6 smaków"),dismissButton: .cancel())}
            Text(test)
        }
    }
}

struct PickPudelko_Previews: PreviewProvider {
    static var previews: some View {
        PickPudelko()
    }
}
