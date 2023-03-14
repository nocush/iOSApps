//
//  SecondView.swift
//  Lab5_1
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack{
            SquareView(color:.red,number: 2)
                .navigationBarTitle("Czerwony kwadrat")
                .offset(y:-40)
            NavigationLink(destination: ThirdView(), label:{
                Text("Następny ekran")
            })
        }
}
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
