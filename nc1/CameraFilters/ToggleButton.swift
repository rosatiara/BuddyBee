import SwiftUI

struct ToggleButton: View {
  @Binding var selected: Bool

  var label: String

  var body: some View {
    ZStack {
        Circle()
            .frame(width: 35, height: 35)
        Button(action: {
          selected.toggle()
        }, label: {
          Image(systemName: label)
        })
        .padding(.vertical, 5)
        .padding(.horizontal, 5)
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
