//
//  editPudelko.swift
//  test
//
//  Created by Mateusz Bartoszek on 18/06/2023.
//

import SwiftUI

struct editPudelko: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Smak.name, ascending: true)], animation: .default)
    private var smaki: FetchedResults<Smak>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Pudelko.name, ascending: true)], animation:.default)
    private var pudelka: FetchedResults<Pudelko>
    
    @State var title: String
    @State var ileSmakow: Int
    @State var photoName: String
    @State var capacity: Int32
    @State var cena: Double
    @State private var pickedSmak1: Smak = Smak()
    @State private var pickedSmak2: Smak = Smak()
    @State private var pickedSmak3: Smak = Smak()
    @State private var dodano: Bool = false
    
    func dodajDoKoszyka(){
        let newPudelko = Pudelko(context: viewContext)
        newPudelko.name = title
        newPudelko.capacity = capacity
        newPudelko.cena = cena
        newPudelko.smakCount = Int16(ileSmakow)
        if ileSmakow == 1 {
            newPudelko.toSmak = [self.pickedSmak1]
        }else if ileSmakow == 2{
            newPudelko.toSmak = [self.pickedSmak1, self.pickedSmak2]
        }
        else {
            newPudelko.toSmak = [self.pickedSmak1, self.pickedSmak2, self.pickedSmak3]
        }
        
        do{
            try viewContext.save()
            dodano = true
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
    
    
    
    func addSmaki(){
        let smaki: [String] = [
            "Bananowy","Waniliowy","Truskawkowy","Mietowy","Smietankowy"
        ]
        
        for i in 0..<smaki.count{
            let newSmak = Smak(context: viewContext)
            newSmak.name = smaki[i]
            
            do{
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    var body: some View {
        if(smaki.count == 0){
            Button(action:{addSmaki()}){
                Text("Wczytaj smaki")
            }
        }else{
            VStack{
                Image(photoName)
                Text(title)
                Text("Pojemnosc: \(capacity)ml")
                Text("Cena" + String(format:"%.2f",cena))
                Text("Wybierz smaki")
                if self.ileSmakow == 1{
                    HStack{
                        Text("Smak \(1)")
                        Picker("",selection:$pickedSmak1){
                            ForEach(smaki, id:\.self){smak in
                                Text(smak.name!).tag(smak as Smak)
                            }
                        }
                        
                    }
                }else if self.ileSmakow == 2{
                    HStack{
                        Text("Smak \(1)")
                        Picker("",selection:$pickedSmak1){
                            ForEach(smaki, id:\.self){smak in
                                Text(smak.name!).tag(smak as Smak)
                            }
                        }
                        
                    }
                    HStack{
                        Text("Smak \(2)")
                        Picker("",selection:$pickedSmak2){
                            ForEach(smaki, id:\.self){smak in
                                Text(smak.name!).tag(smak as Smak)
                            }
                        }
                        
                    }
                }else {
                    HStack{
                        Text("Smak \(1)")
                        Picker("",selection:$pickedSmak1){
                            ForEach(smaki, id:\.self){smak in
                                Text(smak.name!).tag(smak as Smak)
                            }
                        }
                        
                    }
                    HStack{
                        Text("Smak \(2)")
                        Picker("",selection:$pickedSmak2){
                            ForEach(smaki, id:\.self){smak in
                                Text(smak.name!).tag(smak as Smak)
                            }
                        }
                        
                    }
                    HStack{
                        Text("Smak \(3)")
                        Picker("",selection:$pickedSmak3){
                            ForEach(smaki, id:\.self){smak in
                                Text(smak.name!).tag(smak as Smak)
                            }
                        }
                        
                    }
                }
                Button(action:{dodajDoKoszyka()}){
                    if (!dodano){
                        Text("Dodaj do koszyka")
                    } else if (dodano){
                        Text("Dodano pomyślnie")
                    }
                }.disabled(dodano)
                .padding()
                
            }
        }
    }
}

