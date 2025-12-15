// 引入必要的模块
import { promptAction } from '@kit.ArkUI';

@CustomDialog
struct LoginDialog {
  // 必须的控制器，用于关闭弹窗[6](@ref)
  controller: CustomDialogController
  // 定义回调函数，用于将表单数据传回主页面[6](@ref)
  private onConfirm: (username: string, password: string) => void = () => {}


  // 使用@State管理弹窗内的表单数据[4,7](@ref)
  @State username: string = ''
  @State password: string = ''

  build() {
    Column() {
      Text('用户登录')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 30 })

      // 用户名输入框
      TextInput({ placeholder: '请输入用户名' })
        .onChange((value: string) => {
          this.username = value
        })
        .margin({ bottom: 20 })

      // 密码输入框，设置为密码类型[4](@ref)
      TextInput({ placeholder: '请输入密码' })
        .type(InputType.Password)
        .onChange((value: string) => {
          this.password = value
        })
        .margin({ bottom: 40 })

      // 按钮行
      Row() {
        Button('登录')
          .onClick(() => {
            // 简单的输入验证
            if (this.username.trim() === '' || this.password.trim() === '') {
              promptAction.showToast({ message: '用户名或密码不能为空' })
              return
            }
            // 通过回调函数将数据传回主页面
            this.onConfirm(this.username, this.password)
            this.controller.close()
          })
          .backgroundColor(Color.Orange)
          .layoutWeight(1)

        Button('取消')
          .onClick(() => {
            this.controller.close() // 关闭弹窗
          })
          .backgroundColor(Color.Gray)
          .layoutWeight(1) // 设置权重使两个按钮等宽
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly)
    }
    .padding(20)
    .width('100%')
  }
}

export { LoginDialog };
