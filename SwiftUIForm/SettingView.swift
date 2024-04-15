//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    //private var displayOrders = [ "Alfabética", "Primero restorant favorito", "Primero los visitados"]
    
    @State private var selectedOrder = DisplayOrderType.alphabetical
    //@State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Su bar favorito")) {
                    Picker(selection: $selectedOrder, label: Text("Ordenar alfabéticamente")) {
                        ForEach(DisplayOrderType.allCases, id: \.self) {
                            orderType in
                            Text(orderType.text)
                        }
                    }
                }
                
                Section(header: Text("Seleccione su bar preferido")) {
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Sólo los visitados")
                    }
                    
                    Stepper(onIncrement: {
                        self.maxPriceLevel += 1
                        
                        if self.maxPriceLevel > 5 {
                            self.maxPriceLevel = 5
                        }
                    }, onDecrement: {
                        self.maxPriceLevel -= 1
                        
                        if self.maxPriceLevel < 1 {
                            self.maxPriceLevel = 1
                        }
                    }) {
                        Text("Mostrar \(String(repeating: "$", count: maxPriceLevel)) o menos")
                    }
                }
            }
            
            
            .navigationBarTitle("Seleccionar")
            
            .navigationBarItems(leading:
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Salir")
                        .foregroundColor(.black)
                })
                
                , trailing:

                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Guardar")
                        .foregroundColor(.black)
                })
            )
            
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
