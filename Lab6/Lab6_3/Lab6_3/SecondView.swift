//
//  SecondView.swift
//  Lab6_3
//
//  Created by Mateusz Bartoszek on 04/04/2023.
//

import SwiftUI

struct SecondView: View {
    @Binding var pickedAuthor: String
    var body: some View {
        VStack{
            Text("Wpisz nazwisko autora")
            TextField("Nazwisko autora",text:$pickedAuthor)
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(pickedAuthor: .constant(""))
    }
}
