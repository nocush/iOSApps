//
//  ToyotaView.swift
//  Lab5_2
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct ToyotaView: View {
    var models = ["Supra","Corolla","Altezza","Cellica"]
    var body: some View {
        VStack{
            ForEach(models,id:\.self){Text($0).padding().font(.title)}
        }
    }
}

struct ToyotaView_Previews: PreviewProvider {
    static var previews: some View {
        ToyotaView()
    }
}
