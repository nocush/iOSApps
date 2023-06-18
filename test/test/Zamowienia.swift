//
//  Zamowienia.swift
//  test
//
//  Created by Mateusz Bartoszek on 18/06/2023.
//

import SwiftUI

struct Zamowienia: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Zamowienie.imie,ascending: true)],animation:.default)
    private var zamowienia: FetchedResults<Zamowienie>
    
    private func deleteZamowienie(offsets: IndexSet){
        withAnimation{
            offsets.map{zamowienia[$0]}.forEach(viewContext.delete)
            do{
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError),\(nsError.userInfo)")
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if (zamowienia.count == 0){
                    Text("Brak wcześniejszych zamówień")
                }else {
                    List{
                        ForEach(zamowienia){zamowienie in
                            HStack{
                                Text(zamowienie.imie! + " " + zamowienie.nazwisko!)
                                Text("Kwota: " + String(format:"%.2f",zamowienie.kwota))
                            }
                        }.onDelete(perform:deleteZamowienie)
                    }
                }
                
            }
        }.navigationTitle("Poprzednie Zamówienia")
    }
}

struct Zamowienia_Previews: PreviewProvider {
    static var previews: some View {
        Zamowienia()
    }
}
