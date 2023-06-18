//
//  ContentView.swift
//  test
//
//  Created by Mateusz Bartoszek on 13/06/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var offset: CGSize = .zero

    var body: some View {
            NavigationView{
                VStack{
                    Image("logo").resizable().frame(width:300,height:300)
                        .offset(offset)
                        .gesture(DragGesture().onChanged{
                            value in withAnimation(.spring()){
                                offset = value.translation
                            }
                        }
                            .onEnded{value in
                                withAnimation(.spring()){
                                    offset = .zero
                                }
                            }
                        )
                    NavigationLink(destination:PickPudelko()){
                        Text("ZŁÓŻ ZAMÓWIENIE").font(.title)}
                    NavigationLink(destination: About()){
                        Image(systemName: "questionmark.circle").resizable().frame(width:40, height: 40)
                        
                    }.offset(x:150,y:-500)
                    NavigationLink(destination: Zamowienia()){
                        Text("POPRZEDNIE ZAMÓWIENIA").font(.title)
                    }
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
