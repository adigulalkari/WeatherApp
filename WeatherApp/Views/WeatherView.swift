//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Adi Gulalkari on 30/08/24.
//

import SwiftUI

struct WeatherView: View {
    var weather : ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                                        Text(weather.name)
                        .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble()+"°")
                            .font(.system(size: 100))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) {image in image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()  
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "min temp", value: (weather.main.tempMin.roundDouble()+"°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "min temp", value: (weather.main.tempMax.roundDouble()+"°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble()+"m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble()+"%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.675, saturation: 0.984, brightness: 0.311))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft,.topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.675, saturation: 0.984, brightness: 0.311))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
