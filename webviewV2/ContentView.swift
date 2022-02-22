//
//  ContentView.swift
//  webviewV2
//
//  Created by Matthew on 2022/02/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WebViewModel()
    @State private var username: String = "http://192.168.203.13:8080"
    @State var status = false
    
    var body: some View {
        if !status {
            Text("WKWebView 테스터..").padding()
            TextField(
                "url (ex. http://192.168.203.13:8080)",
                text: $username
            )
            .onSubmit {
                self.status = true
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding()
            Button("열기") {
                self.status = true
            }
        }
        else {
            WebView(url: username, viewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
