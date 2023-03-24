import SwiftUI

struct ControlView: View {
  @Binding var comicSelected: Bool
  @Binding var monoSelected: Bool
  @Binding var crystalSelected: Bool

  var body: some View {
      HStack(spacing: 12) {
        ToggleButton(selected: $comicSelected, label: "globe")
        ToggleButton(selected: $monoSelected, label: "globe")
        ToggleButton(selected: $crystalSelected, label: "globe")
      }
  }
}

struct ControlView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.clear
        .edgesIgnoringSafeArea(.all)

      ControlView(
        comicSelected: .constant(false),
        monoSelected: .constant(true),
        crystalSelected: .constant(true))
    }
  }
}
