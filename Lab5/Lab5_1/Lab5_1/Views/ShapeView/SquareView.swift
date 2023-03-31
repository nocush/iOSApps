//
//  SquareView.swift
//  Lab5_1
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct SquareView: View {
    var color: Color
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:200,height:200)
                .foregroundColor(color)
                
            Rectangle().frame(width:100,height:200)
                .offset(x:50)
                .foregroundColor(.gray)
            Rectangle()
                .frame(width:100,height:100)
                .offset(x:50,y:-50)
        }
        .border(Color.brown,width: 6)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(color:.brown)
    }
}
