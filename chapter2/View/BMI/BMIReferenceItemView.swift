import SwiftUI

struct BMIReferenceItemView: View {
    var bmiColor: Color
    var bmiResult: String
    var bmiScope: String

    var body: some View {
        HStack(spacing: 20) {
            //色块
            Rectangle().fill(bmiColor).frame(width: 60, height: 20).cornerRadius(4)
            //参考结果
            Text(bmiResult).foregroundColor(bmiColor)
            Spacer()
            //Bmi范围
            Text(bmiScope)
        }
    }
}
