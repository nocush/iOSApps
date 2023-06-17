//
//  EditDogView.swift
//  Lab11
//
//  Created by Mateusz Bartoszek on 27/05/2023.
//

import SwiftUI

struct EditDogView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Dog.name,ascending:true)],animation: .default)
    private var dogs: FetchedResults<Dog>
    
    var dog:Dog
    
    @State var editName: String = ""
    @State var editYear: String = ""
    
    var body: some View {
        VStack{
            TextField("Podaj nowe imie",text:$editName)
            TextField("Podaj nowy rok urodzenia",text:$editYear)
            Button(action:({
                dog.name = self.editName
                dog.yearBirth = Int16(self.editYear) ?? 0
                //dog.toBreed = self.dog.toBreed
                do{
                    try self.viewContext.save()
                }catch{
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                //self.presentationMode.wrappedValue.dismiss()
            })){
                Text("Edytuj")
            }
        }
    }
}


