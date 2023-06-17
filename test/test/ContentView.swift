//
//  ContentView.swift
//  test
//
//  Created by Mateusz Bartoszek on 13/06/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Smak.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Smak>
    

    var body: some View {
            NavigationView{
                VStack{
                    Image("logo").resizable().frame(width:300,height:300)
                    NavigationLink(destination:Koszyk()){
                        Text("ZŁÓŻ ZAMÓWIENIE").font(.title)}
                    NavigationLink(destination: About()){
                        Image(systemName: "questionmark.circle").resizable().frame(width:40, height: 40)
                        
                    }.offset(x:150,y:-500)
                    Text("POPRZEDNIE ZAMÓWIENIA").font(.title)
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
