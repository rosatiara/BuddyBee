import SwiftUI

struct ToggleButton: View {
  @Binding var selected: Bool

  var label: String

  var body: some View {
    ZStack {
        Circle()
            .frame(width: 45, height: 45)
        Button(action: {
          selected.toggle()
        }, label: {
          Image(systemName: label)
        })
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .foregroundColor(.black)
        .background(selected ? Color(0xFFF36D) : .yellow)
        .animation(.easeInOut, value: 0.25)
        .cornerRadius(50)
      }
  }
}

struct ToggleButton_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
        Color.yellow.edgesIgnoringSafeArea(.all)
      ToggleButton(selected: .constant(true), label: "camera.filters")
    }
  }
}
