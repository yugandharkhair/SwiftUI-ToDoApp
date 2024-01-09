//
//  NewitemView.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//

import SwiftUI

struct NewitemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool

    var body: some View {
        VStack {
            Text("Add a New ToDo")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 40)
            
            Form {
                //title
                TextField("Title", text: $viewModel.title)
                
                //Due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //button
                TLButton(title: "Add ToDo", background: Color.blue) 
                {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all the fields and select a valid due date!"))
            })
        }
    }
}

#Preview {
    NewitemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
