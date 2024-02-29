//
//  ContentView.swift
//  Remider
//
//  Created by Tran Viet Anh on 25/02/2024.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var isDetailViewPresented = false
    @State private var selectedItem: Item?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    ItemView(title: item.title, subTitle: item.bodyTile, isOn: true, item: item)
                            .scaledToFill()
                    
                            
                    
                }
                .onDelete(perform: deleteItems)
                //.onMove(perform: onMove)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Items")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(title: "new", bodyTile: "new body", status: true)
            modelContext.insert(newItem)
            
            
        }
    }
//    private mutating func onMove(source: IndexSet, destination: Int) {
//        withAnimation {
//            modelContext.(fromOffsets: source, toOffset: destination)
//        }
//    }




    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}
struct DetailView: View {
    let item: Item
    @State var title: String
    @State var status: Bool
    init(item: Item) {
        self.item = item
        self._title = State(initialValue: item.title)
        self._status = State(initialValue: item.status)
    }
    
    var body: some View {
        VStack {
            Text("Title")
                .font(.title)
                .bold()
            TextField("", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Body")
                .padding()
            TextField("", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
                .padding()
            Spacer()
            Text("Status")
            Toggle(isOn: $status) {
            
            }
        }
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "minus.circle.fill")
            }).padding()
                .font(.system(size: 40))
                .foregroundColor(.red)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "checkmark.seal.fill")
            }).padding()
                .font(.system(size: 40))
                .foregroundColor(.green)
        }
        .navigationTitle(item.title)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: Item.self, inMemory: true)
    }
}
