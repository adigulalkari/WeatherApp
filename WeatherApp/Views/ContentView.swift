//
//  ContentView.swift
//  WeatherApp
//
//  Created by Adi Gulalkari on 30/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    
    @State var weather:ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                }
                else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude:location.latitude, longitude:location.longitude)
                            }
                            catch{
                                print("Error getting the weather : \(error)")
                            }
                        }
                }
            }
            else{
                if locationManager.isLoading{
                    LoadingView()
                  }
                else{
                    WelocomeView()
                        .environmentObject(locationManager)
                }
            }
            
            
        }
        .background(Color(hue: 0.675, saturation: 0.984, brightness: 0.311))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
