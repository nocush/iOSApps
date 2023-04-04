//
//  BooksManager.swift
//  Lab6_3
//
//  Created by Mateusz Bartoszek on 04/04/2023.
//

import Foundation

struct BooksManager{
    var Books: [Book]
    
    init() {
        self.Books = [
            Book(imie: "Remigiusz", nazwisko: "Mróz", tytul: "Przepaść", dostepnosc: 10),
            Book(imie: "Remigiusz", nazwisko: "Mróz", tytul: "Behawiorysta", dostepnosc: 5),
            Book(imie: "Remigiusz", nazwisko: "Mróz", tytul: "Halny", dostepnosc: 7),
            Book(imie: "Stephen", nazwisko: "King", tytul: "IT", dostepnosc: 8),
            Book(imie: "Adam", nazwisko: "Mickiewicz", tytul: "Kordian", dostepnosc: 2)
        ]
    }
        
        func checkAvaiability(autor: String)->Bool{
            guard (Books.first{book in book.nazwisko == autor}) != nil else{
                return false
            }
            return true
        }
        
        func getAllBooks(autor:String)->[String]{
            var books: Set<String> = Set()
            if (checkAvaiability(autor: autor)==true){
                for book in Books {
                    if(book.nazwisko == autor){
                        books.insert(book.imie+" "+book.nazwisko+" "+book.tytul+" -  \(book.dostepnosc)")
                    }
                }
            }else{books.insert("")}
            return Array(books).sorted()
        }
        
        
}
