//
//  WeirdView.swift
//  Lab5_1
//
//  Created by Mateusz Bartoszek on 28/03/2023.
//

import SwiftUI

struct WeirdView: View {
    var color: Color
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:350,height:303)
                .foregroundColor(.white)
                .border(Color.blue,width:3)
            RoundedRectangle(cornerRadius: 60)
                .frame(width:300,height: 300)
                .foregroundColor(color)
            Capsule()
                .frame(width:300,height:150)
                .foregroundColor(.green)
            Circle()
                .frame(width:100)
                .foregroundColor(.red)
            
        }
    }
}

struct WeirdView_Previews: PreviewProvider {
    static var previews: some View {
        WeirdView(color: .red)
    }
}
