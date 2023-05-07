//
//  Menu2.swift
//  lab8_2
//
//  Created by Mateusz Bartoszek on 29/04/2023.
//

import SwiftUI

struct Menu2: View {
    @Binding var color: Color
    var body: some View {
                HStack{
                    Button(action:{self.color = Color.orange}){
                        Text("")
                            .frame(width:50,height:50)
                            .background(Color.orange)
                            .border(Color.black, width: 2)
                    }
                    Button(action:{self.color = Color.green}){
                        Text("")
                            .frame(width:50,height:50)
                            .background(Color.green)
                            .border(Color.black, width: 2)
                    }
                    Button(action:{self.color = Color.pink}){
                        Text("")
                            .frame(width:50,height:50)
                            .background(Color.pink)
                            .border(Color.black, width: 2)
                    }
                    Button(action:{self.color = Color.yellow}){
                        Text("")
                            .frame(width:50,height:50)
                            .background(Color.yellow)
                            .border(Color.black, width: 2)
                    }
                }.offset(y:300)
                .padding()
            
    }
}

struct Menu2_Previews: PreviewProvider {
    static var previews: some View {
        Menu2(color: .constant(Color.white))
    }
}
