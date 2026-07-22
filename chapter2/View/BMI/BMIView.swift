import SwiftUI

struct BMIView: View {
    @State private var height: Float = 172
    @State private var weight: Float = 65
    @State private var showBMIResultView: Bool = false
    //产值需要声明
    @State private var bmiNum: Float = 0
    @State private var bmiResult: String = "正常"
    @State private var bmiColor: Color = Color.green

    //代码块的顺序决定了视图的先后顺序
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                inputFormView
                VStack(spacing: 40) {
                    bmiRefefrenceView
                    computeBtnView
                }
            }.navigationTitle("BMI计算器").navigationBarTitleDisplayMode(.inline)
                //A页面数据传到B页面
                .navigationDestination(isPresented: $showBMIResultView) {
                    BMIResultItemView(
                        height: height, weight: weight, bmiNum: bmiNum, bmiResult: bmiResult,
                        bmiColor: bmiColor)
                }
        }
    }

    //输入视图
    private var inputFormView: some View {
        Form {
            LabeledContent("身高(cm)") {
                TextField("请输入", value: $height, format: .number).foregroundColor(.black)
            }
            LabeledContent("体重(kg)") {
                TextField("请输入", value: $weight, format: .number).foregroundColor(.black)
            }
        }.multilineTextAlignment(.trailing).foregroundColor(.gray)
    }

    //BMI指示
    private var bmiRefefrenceView: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "paperplane")
                Text("参考标准").font(.title3).bold()
            }
            BMIReferenceItemView(bmiColor: Color.blue, bmiResult: "过轻", bmiScope: "BMI <= 18.5")
            BMIReferenceItemView(
                bmiColor: Color.green, bmiResult: "正常", bmiScope: "18.5 < BMI <= 24")
            BMIReferenceItemView(
                bmiColor: Color.yellow, bmiResult: "过重", bmiScope: "24 < BMI <= 28")
            BMIReferenceItemView(
                bmiColor: Color.orange, bmiResult: "肥胖", bmiScope: "28 < BMI <= 32")
            BMIReferenceItemView(bmiColor: Color.red, bmiResult: "重度肥胖", bmiScope: "BMI > 32")
        }.padding().background(Color.white).cornerRadius(16).padding(.horizontal)
    }

    //计算按钮
    private var computeBtnView: some View {
        Button(action: {
            //计算
            computeBMI()
            self.showBMIResultView.toggle()
        }) {
            Text("立即计算").font(.system(size: 17))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(Color.green)
                .cornerRadius(16)
                .padding(.horizontal)
        }
    }

    //计算函数
    func computeBMI() {
        let squaredHeight = (height / 100) * (height / 100)
        bmiNum = weight / squaredHeight
        //更新结果
        switch bmiNum {
        case ...18.5:
            bmiResult = "过轻"
            bmiColor = Color.blue
        case 18.5..<24:
            bmiResult = "正常"
            bmiColor = Color.green
        case 24..<28:
            bmiResult = "过重"
            bmiColor = Color.yellow
        case 28..<32:
            bmiResult = "肥胖"
            bmiColor = Color.orange
        default:
            bmiResult = "重度肥胖"
            bmiColor = Color.red
        }
    }
}

#Preview {
    BMIView()
}
