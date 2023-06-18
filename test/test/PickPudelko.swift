//
//  PickPudelko.swift
//  test
//
//  Created by Mateusz Bartoszek on 16/06/2023.
//

import SwiftUI

struct PickPudelko: View {
    @FetchRequest(sortDescriptors: []) private var Pudelko:FetchedResults<Pudelko>
    
    @State var test: String = ""
    @State private var showAlert1 = false
    @State private var showAlert2 = false
    @State private var showAlert3 = false
    @State private var showSecond1: Bool = false
    @State private var showSecond2: Bool = false
    @State private var showSecond3: Bool = false
    @State private var showKoszyk: Bool = false
    

    var body: some View {
        NavigationView{
            VStack{
                
                    ZStack{
                        Image("lodym").resizable().frame(width: 200,height:200)
                        Text("Małe pudełko").foregroundColor(Color.black)
                            .offset(y:70)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius:20, style: .continuous).stroke(Color.gray, lineWidth: 4))
                    .gesture(TapGesture().onEnded{self.showSecond1 = true})
                  .gesture(LongPressGesture().onEnded{_ in showAlert1 = true})
                        .alert(isPresented: $showAlert1){
                            Alert(title:Text("Małe Pudelko"),message: Text("Pojemność 500ml, 1 smak"),dismissButton: .cancel())}
                        .sheet(isPresented: $showSecond1){
                            editPudelko(title: "Małe pudełko", ileSmakow: 1, photoName: "lodym", capacity: 500, cena: 15.00)
                        }
                
                
                ZStack{
                    Image("lodyl").resizable().frame(width: 200,height:200)
                    Text("Średnie pudełko").foregroundColor(Color.black)
                        .offset(y:70)
                }
                .overlay(
                    RoundedRectangle(cornerRadius:20, style: .continuous).stroke(Color.gray, lineWidth: 4))
                    .gesture(TapGesture().onEnded{self.showSecond2 = true})
                    .gesture(LongPressGesture().onEnded{_ in showAlert2 = true})
                
                    .alert(isPresented: $showAlert2){
                        Alert(title:Text("Średnie Pudelko"),message: Text("Pojemność 750ml, 2 smaki"),dismissButton: .default(Text("Got it")))
                    }
                    .sheet(isPresented: $showSecond2){
                        editPudelko(title: "Średnie pudełko", ileSmakow: 2, photoName: "lodyl", capacity: 750, cena: 18.00)
                    }
                
                ZStack{
                    Image("lodyxl").resizable().frame(width: 200,height:200)
                    Text("Duże pudełko").foregroundColor(Color.black)
                        .offset(y:70)
                }
                .overlay(
                    RoundedRectangle(cornerRadius:20, style: .continuous).stroke(Color.gray, lineWidth: 4))
                
                .gesture(TapGesture().onEnded{self.showSecond3 = true})
                .gesture(LongPressGesture().onEnded{_ in showAlert3 = true})
                
                .alert(isPresented: $showAlert3){
                    Alert(title:Text("Duże Pudelko"),message: Text("Pojemność 1000ml, 3 smaki"),dismissButton: .cancel())}
                .sheet(isPresented: $showSecond3){
                    editPudelko(title: "Duże pudełko", ileSmakow: 3, photoName: "lodyxl", capacity: 1000, cena: 20.00)
                }
                Button(action:{showKoszyk = true}){Image(systemName: "cart").resizable().frame(width:40,height:40)
                    Text("Koszyk").font(.title)
                }.padding()
                    .sheet(isPresented:$showKoszyk){
                        Koszyk()
                    }
                
            }
            
        }.navigationTitle("Wybierz Pudelko")
    }
}

struct PickPudelko_Previews: PreviewProvider {
    static var previews: some View {
        PickPudelko()
    }
}
