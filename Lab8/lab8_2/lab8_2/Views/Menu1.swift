//
//  Menu1.swift
//  lab8_2
//
//  Created by Mateusz Bartoszek on 29/04/2023.
//

import SwiftUI

struct Menu1: View {
    @Binding var option: String
    var body: some View {
        VStack{
            Menu(){
                Button(action: {self.option = "Opcja 1"},
                       label:{
                    Text("Opcja 1")
                })
                Menu("Opcja 2"){
                    Button(action: {self.option = "Opcja 2.1"},label:{
                        Text("Opcja 2.1")
                    })
                    Button(action: {self.option = "Opcja 2.2"},label:{
                        Text("Opcja 2.2")
                    })
                }
                Menu("Opcja 3"){
                    Button(action: {self.option = "Opcja 3.1"},label:{
                        Text("Opcja 3.1")
                    })
                    Button(action: {self.option = "Opcja 3.2"},label:{
                        Text("Opcja 3.2")
                    })
                }
            }
        label:{Image(systemName: "line.3.horizontal").resizable().frame(width:40,height:20)}.offset(x:-150,y:-250)
            Text("Wybrana opcja: \(option)")
        }
    }
}

struct Menu1_Previews: PreviewProvider {
    static var previews: some View {
        Menu1(option: .constant("Opcja 1"))
    }
}
