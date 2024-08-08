# WaveEffect
### WaveEffect is a SwiftUI application that provides a customizable wave effect view modifier. This app animates wave shapes within SwiftUI views, creating visually appealing and dynamic UI elements.


https://github.com/user-attachments/assets/dbd6dfd9-8080-44ec-a882-e401ea664f27



## Usage
#### To use the wave effect, simply apply the waveEffect modifier to any View or Shape.


```
import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0.3
    @State private var animationDuration: TimeInterval = 3
    @State private var flexibility: CGFloat = 1
    
    var body: some View {
        
        VStack(spacing: 60) {
            measurementSection
            
            ZStack {
                Image("glass")
                    .resizable()
                    .shadow(color: .gray.opacity(0.3) ,radius: 3, x: 0, y: 20)
                Image("ice1")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .offset(y: 150)
            }
            .waveEffect(progress: progress, animationDuration: animationDuration, flexibility: flexibility)
            .mask {
                Image("glass")
                    .resizable()
            }
            .frame(width: 300, height: 480)
        }
        .padding()
    }
}
```
