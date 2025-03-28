import SwiftUI

struct ContentView: View {
    @State private var brightness: Double = BrightnessController.getBrightness()

    var body: some View {
        VStack {
            Text("BRILLONINI App")
                .font(.headline)
                .foregroundColor(Color(hue: 0.146, saturation: 0.0, brightness: 0.786))
            //Text("")
            
            Slider(value: $brightness, in: 0...1, onEditingChanged: { editing in
                if !editing {
                    BrightnessController.setBrightness(brightness)
                }
            })
            //.padding()
            Text("Brillo: \(Int(brightness * 100))%")
            Text("")
            Text("")
            Text("")

            let xURL = URL(string: "https://x.com/binary0x41")!

            
            let xURLInvitame = URL(string: "https://gofund.me/07b51c35")!

            /*
            Image("X_logo_2023") // Asumiendo que ahora es PNG
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
             */
            
            
            Image("X_logo_2023") // Asumiendo que ahora es PNG
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            
            Button(action: {
                NSWorkspace.shared.open(xURL)
            }) {
                Text("Binary0x41")
            }

            Text("")
            
            Button(action: {
                NSWorkspace.shared.open(xURLInvitame)
            }) {
                Text("Invitame a un ☕️ 😉")
            }
            
                

            
        }
        .padding()
        .frame(width: 200)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                brightness = BrightnessController.getBrightness()
            }
        }
    }
}




