//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ikbal Demirdoven on 2023-03-05.
//

import SwiftUI

struct Response : Codable
{
    var results = [Result]()
}

struct Result : Codable
{
    var trackID : Int
    var trackName : String
    var collectionName : String
}

struct ContentView: View {
    @State private var results = [Result]()
    var body: some View {
        List(results, id: \.trackID)
        {
            result in
            Text(result.trackName)
                .font(.headline)
            Text(result.collectionName)
                .font(.title3)
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async
    {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else
        {
            print("Invalid URL.")
            return
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
