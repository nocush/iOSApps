//
//  TriangleView.swift
//  Lab5_1
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct TriangleView: View {
    var color: Color
    var number: Int
    var body: some View {
        ZStack{
            Triangle()
                .frame(width:200,height:200)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.black)
                .font(.largeTitle)
        }
    }
}

struct TriangleView_Previews: PreviewProvider {
    static var previews: some View {
        TriangleView(color:.cyan, number:3)
    }
}
