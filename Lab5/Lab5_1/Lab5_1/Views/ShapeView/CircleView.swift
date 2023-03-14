//
//  CircleView.swift
//  Lab5_1
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct CircleView: View {
    var color: Color
    var number: Int
    var body: some View {
        ZStack{
            Circle()
                .frame(width:200,height:200)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.black)
                .font(.largeTitle)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red, number: 1)
    }
}
