//
//  NissanView.swift
//  Lab5_2
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct NissanView: View {
    var models = ["GTR","Skyline","Juke"]
    var body: some View {
        VStack{
            ForEach(models,id:\.self){Text($0).padding().font(.title)}
        }
    }
}

struct NissanView_Previews: PreviewProvider {
    static var previews: some View {
        NissanView()
    }
}
