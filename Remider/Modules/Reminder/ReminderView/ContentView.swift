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
    @State var newItem = Item(title: "new title", bodyTile: " new body", status: false, date: Date.now)
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    ItemView(title: item.title, subTitle: item.bodyTile, date: Date.now, isOn: true, item: item)
                            .scaledToFill()
                    
                            
                    
                }
                .onDelete(perform: deleteItems)
                //.onMove(perform: onMove)
            }
            .toolbar {

                ToolbarItem {
                    
                    Button(action: {self.isDetailViewPresented = true}) {
                        Label("Add Item", systemImage: "plus")
                    }.sheet(isPresented: $isDetailViewPresented) {
                        DetailViewNew(item: $newItem, isDetailViewPresented: $isDetailViewPresented)
                        
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("Items")
        }
    }

    public func addItem(item : Item) {
        withAnimation {
            
            let newItem = item
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
    @Binding var item: Item
    @Binding var isDetailViewPresented: Bool
    @Environment(\.modelContext) private var modelContext
    @State private var wakeUp = Date.now
    var body: some View {
        VStack {
            Text("Title")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.trailing)
                .font(.title)
                .bold()
            TextField("", text: $item.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Body")
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.trailing)
                .bold()
            TextField("", text: $item.bodyTile)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
                .padding()
            Spacer()
            Text("Please select:")
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.trailing)
                .bold()
            DatePicker("", selection: $wakeUp)
            Text("Status")
                .bold()
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.trailing)
            
            Toggle(isOn: $item.status) {
                
            }
        }
        HStack{
            Button(action: { self.isDetailViewPresented = false }, label: {
                Image(systemName: "minus.circle.fill")
            }).padding()
                .font(.system(size: 40))
                .foregroundColor(.red)
            Spacer()
            Button(action: {
                self.isDetailViewPresented = false
            }, label: {
                Image(systemName: "checkmark.seal.fill")
            }).padding()
                .font(.system(size: 40))
                .foregroundColor(.green)
        }
        .navigationTitle(item.title)
    }
}

struct DetailViewNew: View {
    @Binding var item: Item
    @Binding var isDetailViewPresented: Bool
    @Environment(\.modelContext) private var modelContext
    @State private var wakeUp = Date.now
    var body: some View {
        VStack {
            Text("Title")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.trailing)
                .font(.title)
                .bold()
            TextField("", text: $item.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Body")
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.trailing)
                .bold()
            TextField("", text: $item.bodyTile)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
                .padding()
            Spacer()
            Text("Please select:")
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.trailing)
                .bold()
            DatePicker("", selection: $wakeUp)
            Text("Status")
                .bold()
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.trailing)
            
            Toggle(isOn: $item.status) {
                
            }
        }
        HStack{
            Button(action: { self.isDetailViewPresented = false }, label: {
                Image(systemName: "minus.circle.fill")
            }).padding()
                .font(.system(size: 40))
                .foregroundColor(.red)
            Spacer()
            Button(action: {
                withAnimation {
                    // Tạo một đối tượng Item mới từ dữ liệu của item hiện tại
                    let newItem =  Item(title: "new title", bodyTile: " new body", status: false, date: Date.now)
                       newItem.title = item.title
                       newItem.bodyTile = item.bodyTile
                       newItem.status = item.status
                    newItem.date = item.date
                       // Lưu đối tượng mới vào modelContext
                       modelContext.insert(newItem)
                       // Lưu các thay đổi vào modelContext
                    item.title  = "new title"
                    item.bodyTile = "new body"
                    item.status = false
                    item.date = Date.now
                       try? modelContext.save()
                    
                }
                self.isDetailViewPresented = false
            }, label: {
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
