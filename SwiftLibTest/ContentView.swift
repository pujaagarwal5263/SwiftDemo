//
//  ContentView.swift
//  SwiftLibTest
//
//  Created by Puja Agarwal on 23/12/22.
//

import SwiftUI
import CustomButton

struct ContentView: View {
    @State var text: String = "Button"
    @State var color: Color = Color.pink
    @State var isLoading:Bool = false
    @State var isdisabled:Bool = false
    @State var btnPadding: Double = 10
    @State var variant: Double = 1
    @State private var selection: Int = 0
    @State private var labelsel: Int = 0
    @State private var labeldis: Int = 0
    @State private var sizesel: Int = 0
    @State private var variantsel: Int = 0
    
    var body: some View {
        //this CustomButton is our library which accepts the props and returns a button as per the props passed
       CustomButton.MyButton(btnsize: "Medium", variant: "Solid",
       isLoading:false, disabled: false, colorscheme: "primary")

        Button(action:{
            //any action
        }, label: {
            HStack(spacing: 10){
                isLoading ? ProgressView() : nil
                Text(text).foregroundColor(Color.black)
                    .opacity((isdisabled) ? 0.3 : 1)
            }
        }).padding(btnPadding)
            .background(color.opacity(variant))
        .clipShape(Capsule())
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            HStack(spacing: 10){
                Text("Kind")
                Picker(selection: $selection, label: Text("Segments")) {
                    Text("PRIMARY").tag(0)
                    Text("SECONDARY").tag(1)
                    Text("TERTIARY").tag(2)
                    }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: selection) { value in
            switch value {
            case 0:
                self.color = Color.blue
            case 1:
                self.color = Color.green
            case 2:
                self.color = Color.gray
            default:
                self.text = "Button"
            }}
            .padding(30)
            }
            
            
            HStack(spacing: 10){
                Text("Loading")
                Picker(selection: $labelsel, label: Text("Segments")) {
                    Text("FALSE").tag(0)
                    Text("TRUE").tag(1)
                    }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: labelsel) { value in
            switch value {
            case 0:
                self.isLoading = false
                self.text = "Button"
            case 1:
                self.isLoading = true
                self.text = "Loading..."
            default:
                self.isLoading = false
                self.text = "Button"
            }}
            .padding(10)
            }
            
            HStack(spacing: 10){
                Text("Disabled")
                Picker(selection: $labeldis, label: Text("Segments")) {
                    Text("FALSE").tag(0)
                    Text("TRUE").tag(1)
                    }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: labeldis) { value in
            switch value {
            case 0:
                self.isdisabled = false
            case 1:
                self.variant = 0.4
                self.isdisabled = true
            default:
                self.isdisabled = false
            }}
            .padding(10)
            }
            
            HStack(spacing: 10){
                Text("Size")
                Picker(selection: $sizesel, label: Text("Segments")) {
                    Text("Small").tag(0)
                    Text("Medium").tag(1)
                    Text("Large").tag(2)
                    }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: sizesel) { value in
            switch value {
            case 0:
                self.btnPadding = 5
            case 1:
                self.btnPadding = 10
            case 2:
                self.btnPadding = 15
            default:
                self.btnPadding = 10
            }}
            .padding(30)
            }
            
            HStack(spacing: 10){
                Text("Variant")
                Picker(selection: $variantsel, label: Text("Segments")) {
                    Text("Solid").tag(0)
                    Text("Subtle").tag(1)
                    Text("Ghost").tag(2)
                    }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: variantsel) { value in
            switch value {
            case 0:
                self.variant = 1
            case 1:
                self.variant = 0.4
            case 2:
                self.variant = 0
            default:
                self.variant = 1
            }}
            .padding(30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
