//
//  SquareView.swift
//  Lab5_1
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct SquareView: View {
    var color: Color
    var number: Int
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:200,height:200)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.black)
                .font(.largeTitle)
        }
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(color:.brown, number: 2)
    }
}
