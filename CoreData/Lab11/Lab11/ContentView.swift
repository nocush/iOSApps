//
//  ContentView.swift
//  Lab11
//
//  Created by Mateusz Bartoszek on 23/05/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
   @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Dog.name, ascending: true)],animation: .default)
    private var dogs: FetchedResults<Dog>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Breed.name, ascending: true)],animation: .default)
    private var breeds: FetchedResults<Breed>
    
    private func addBreed(){
        var newBreed = Breed(context: viewContext)
        newBreed.name = "owczarek niemiecki"
        do{
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        newBreed = Breed(context: viewContext)
        newBreed.name = "Husky"
        do{
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
    
    
    private func deleteDog(offsets: IndexSet){
        withAnimation{
            offsets.map{ dogs[$0] }.forEach(viewContext.delete)
            do{
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved Error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
    private func addDog(){
        let newDog = Dog(context: viewContext)
        newDog.name = dogName
        newDog.yearBirth = Int16(dogYear)!
        newDog.toBreed = pickedRasa
        
        do{
            try viewContext.save()
        } catch{
            let nsError = error as NSError
            fatalError("Unresolved Error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
    @State var dogName: String = ""
    @State var dogYear: String = ""
    @State var pickedRasa: Breed?
    var body: some View {
        NavigationView{
            VStack{
                if(breeds.count == 0){
                    Button("Dodaj rasy", action: addBreed)
                }else{
                    Text("Pieski")
                    TextField("Podaj imie pupila", text:$dogName)
                    TextField("Podaj rok urodzenia pupila",text:$dogYear)
                    Text("Wybierz rasę")
                    Picker("Rasa",selection: $pickedRasa){
                        ForEach(breeds, id:\.self){breed in
                            Text("\(breed.name!)").tag(breed as Breed?)
                        }
                    }
                    Button("Dodaj dane psa",action:addDog)
                    List{
                        ForEach(breeds) {breed in
                            Section(header: Text("\(breed.name!)")){
                                ForEach(breed.dogArray){dog in
                                    NavigationLink(destination: EditDogView(dog: dog)){
                                        Text("\(dog.name!) - urodzony w \(dog.yearBirth)")}
                                }.onDelete(perform: deleteDog)
                            }
                        }
                    }
                }
            }
        }
        
    }

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
