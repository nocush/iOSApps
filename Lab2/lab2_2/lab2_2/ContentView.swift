//
//  ContentView.swift
//  lab2_2
//
//  Created by student on 07/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack{
                Image("dog")
                    .resizable()
                    .frame(width:400,height:400)
                    .foregroundColor(.accentColor)
                HStack{
                    VStack(alignment:.leading, spacing: 5){
                        Text("Psisko")
                        Text("Autor")
                    }
                    Spacer()
                    
                }.padding().background(Color.white.opacity(0.7)).offset(y:165)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
