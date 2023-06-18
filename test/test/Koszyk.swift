//
//  Koszyk.swift
//  Projekt
//
//  Created by Mateusz Bartoszek on 27/05/2023.
//

import SwiftUI



struct Koszyk: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Pudelko.name, ascending: true)],predicate: NSPredicate(format: "toZamowienie == nil"), animation:.default)
    private var pudelka: FetchedResults<Pudelko>
    
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Zamowienie.imie,ascending: true)],animation:.default)
    private var zamowienia: FetchedResults<Zamowienie>
    var totalValue: Double{
        pudelka.reduce(0){$0 + $1.cena}
    }

    @State private var imie: String = ""
    @State private var nazwisko: String = ""
    @State private var adres: String = ""
    @State private var telefon: String = ""
    @State private var zamowiono: Bool = false
    @State private var errorText: String = ""
    
    
    
    func checkValues()->Bool{
        guard totalValue != 0 && totalValue > 0 else{
            errorText = "Koszyk jest pusty"
            return true
        }
        guard imie != "" else{
            errorText = "Błędne imie"
            return true
        }
        guard nazwisko != ""  else{
            errorText = "Błędne nazwisko"
            return true
        }
        guard adres != "" else{
            errorText = "Błędny adres"
            return true
        }
        guard (telefon.count == 9 && (Int(telefon) != nil)) else{
            errorText = "Błędny numer telefonu"
            return true
        }
        return false
    }
    
    func dodajZamowienie(){
        let anyErrors = checkValues()
        if(anyErrors) {
            
        }else {
            let newZamowienie = Zamowienie(context: viewContext)
            newZamowienie.imie = imie
            newZamowienie.nazwisko = nazwisko
            newZamowienie.adres = adres
            newZamowienie.kwota = totalValue
            newZamowienie.telefon = Int32(telefon)!
            var pickedpudelka: [Pudelko] = Array()
            for pudelko in pudelka{
                pickedpudelka.append(pudelko)
            }
            newZamowienie.toPudelko = NSSet(array: pickedpudelka)
            
            for pudelko in pudelka {
                pudelko.toZamowienie = newZamowienie
            }
            
            do{
                try viewContext.save()
                errorText = ""
                zamowiono = true
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    private func deletePudelko(offsets: IndexSet){
        withAnimation{
            offsets.map{pudelka[$0]}.forEach(viewContext.delete)
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
                Text("Koszyk").font(.largeTitle).padding()
            List{
                ForEach(pudelka){pudelko in
                    HStack{
                        Text(pudelko.name!+": ")
                        Text(String(format:"%.2f",pudelko.cena)+"zł")
                    }
                }.onDelete(perform: deletePudelko)
                }
                Spacer()
                
                HStack{
                    Text("Łączna kwota: ")
                    Text(String(format:"%.2f",totalValue)+"zł")
                }
                Text(errorText).foregroundColor(Color.red)
                HStack{
                    Text("Imie: ")
                    TextField("",text:$imie).frame(width:120)
                }
                HStack{
                    Text("Nazwisko: ")
                    TextField("",text:$nazwisko).frame(width:120)
                }
                HStack{
                    Text("Adres: ")
                    TextField("",text:$adres).frame(width:120)
                }
                HStack{
                    Text("Telefon: ")
                    TextField("",text:$telefon).frame(width:120)
                }
                Button(action:{dodajZamowienie()}){
                    if(!zamowiono){
                        Text("Złóż zamówienie")
                    }else if (zamowiono){
                        Text("Złożono zamówienie")
                    }
                }.disabled(zamowiono)
            }
        }.navigationTitle("Koszyk")
    }
}

struct Koszyk_Previews: PreviewProvider {
    static var previews: some View {
        Koszyk()
    }
}
