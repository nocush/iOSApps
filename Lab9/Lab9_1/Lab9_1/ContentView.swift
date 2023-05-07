//
//  ContentView.swift
//  Lab9_1
//
//  Created by Mateusz Bartoszek on 07/05/2023.
//

import SwiftUI

let images: [MyImage]=[
MyImage(title: "Psisko", path: "psisko"),
MyImage(title: "Rzeka", path: "river"),
MyImage(title: "Kot", path: "gato"),
MyImage(title: "Grape", path: "grep")]

struct ContentView: View {
    @State private var index: Int = 0
    @State private var showTitle: Bool = false
    @State private var offSet: CGSize = .zero
    var body: some View {
        let longPress = LongPressGesture()
            .onEnded{finished in self.showTitle = !self.showTitle}
        
        return VStack{
            Image(images[index].path)
                .resizable()
                .frame(width:400,height:300)
                .offset(x:self.offSet.width)
                .gesture(
                DragGesture()
                    .onEnded({value in
                        if value.translation.width < -(UIScreen.main.bounds.size.width * 0.4) && self.index < images.count - 1 {
                            //w lewo
                            self.index = self.index + 1
                        }
                        if value.translation.width > (UIScreen.main.bounds.size.width * 0.4) && self.index > 0 {
                            //w prawo
                            self.index = self.index - 1
                        }
                        self.offSet = .zero
                    })
                    .onChanged({value in
                        if value.translation.width < 0 && self.index < images.count - 1 {
                            //w lewo
                            self.offSet = value.translation
                        }
                        if value.translation.width > 0 && self.index > 0 {
                            //w prawo
                            self.offSet = value.translation
                        }
                    })
                ).gesture(longPress)
            Text(showTitle ? images[index].title: " ").padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
