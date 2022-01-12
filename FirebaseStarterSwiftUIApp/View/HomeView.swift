//
//  HomeView.swift
//  FirebaseStarterSwiftUIApp
//
//  Created by Duy Bui on 8/18/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//
import UIKit
import SwiftUI

struct HomeView: View {
    @State var isDrawerOpen: Bool = false
    @ObservedObject var state: AppState
    @ObservedObject private var viewModel = BookViewModel()
    var body: some View {
        ZStack {
            NavigationView {
//                Text("Welcome \(state.currentUser?.email ?? "Not found")")
                List(viewModel.books) { book in
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.headline)
                    }
                }
                    .navigationBarItems(leading: Button(action: {
                        self.isDrawerOpen.toggle()
                    }) {
                        Image(systemName: "sidebar.left")
                    })
            }
            DrawerView(isOpen: self.$isDrawerOpen)
        }.navigationBarTitle("Books", displayMode: .inline)
        .navigationBarHidden(true)
        .onAppear(){
            self.viewModel.fetchData()
        }
    }
}


