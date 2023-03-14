//
//  ThirdView.swift
//  Lab5_1
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        TriangleView(color:.indigo,number:3)
            .navigationBarTitle("Trójkąt indygo")
            .offset(y:-40)
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
