//
//  TodoListView.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                // delete
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To-Do List")
            .toolbar {
                Button {
                    //action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewitemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
        
    }
}

#Preview {
    TodoListView(userId: "Ki4mLVsmvFWGHb1jrksrJ2qZrEF2")
}
  
