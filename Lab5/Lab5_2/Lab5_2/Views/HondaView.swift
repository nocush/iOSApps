//
//  HondaView.swift
//  Lab5_2
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct HondaView: View {
    var models = ["Civic", "Integra","Accord"]
    var body: some View {
        VStack{
            ForEach(models,id:\.self){Text($0).padding().font(.title)}
        }
    }
}

struct HondaView_Previews: PreviewProvider {
    static var previews: some View {
        HondaView()
    }
}
