//
//  MyButton.swift
//  Lab3_1
//
//  Created by Mateusz Bartoszek on 12/03/2023.
//

import SwiftUI

struct MyButton: View {
    @Binding var clicks: Int
    
    init(clicks: Binding<Int>) {
        self._clicks = clicks
    }
    var body: some View {
        Button(action:{
            self.clicks += 1
        }){
            Text("Wciśnij")
                .padding()
                .background(Color.gray)
                .foregroundColor(.green)
                .cornerRadius(30)
        }
    }
}
