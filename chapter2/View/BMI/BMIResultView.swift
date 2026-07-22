import SwiftUI

struct BMIResultItemView: View {

    var body: some View {
        VStack {
            computeResultView
            Spacer()
            reComputeBtnView
        }.navigationBarBackButtonHidden(true)
    }

    var height: Float
    var weight: Float
    var bmiNum: Float
    var bmiResult: String
    var bmiColor: Color

    @Environment(\.presentationMode) var presentationMode

    //BMI 详情
    private var computeResultView: some View {
        VStack(spacing: 28) {
            Text("您的BMI是").font(.system(size: 17)).foregroundColor(.gray)

            Text(String(format: "%.2f", bmiNum)).font(.system(size: 48)).bold().foregroundColor(
                .green)

            Text(bmiResult).font(.system(size: 23)).foregroundColor(.white).padding(.vertical, 6)
                .padding(.horizontal, 30).background(bmiColor).cornerRadius(32)

            HStack {
                Text(String(format: "%.0f", height) + "cm")
                Text("|")
                Text(String(format: "%.0f", weight) + "kg")
            }.font(.system(size: 17)).foregroundColor(.gray)
        }.padding().frame(maxWidth: .infinity).background(Color(.systemGray6)).cornerRadius(16)
            .padding()
    }
    //重新计算
    private var reComputeBtnView: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "gobackward")
                Text("重新计算")
            }.font(.system(size: 17)).foregroundColor(.white).frame(width: 200, height: 48)
                .background(Color.blue).cornerRadius(8).padding(.horizontal)
        }
    }

}

#Preview() {
    BMIResultItemView(
        height: 174, weight: 65, bmiNum: 21.22, bmiResult: "正常", bmiColor: Color.green)
}
