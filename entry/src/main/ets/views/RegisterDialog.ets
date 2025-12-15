import { promptAction } from '@kit.ArkUI'
import { UserModel } from '../viewmodel/UserModel'


// 使用@CustomDialog装饰器定义注册弹窗
@CustomDialog
struct RegisterDialog {
  // 控制器，用于关闭弹窗
  controller: CustomDialogController
  // 回调函数，用于将注册数据传回主页面
  private onConfirm?: (userData: object) => void

  // 定义弹窗内的状态数据
  @State username: string = ''
  @State password: string = ''
  @State confirmPassword: string = ''
  @State school: string = ''
  @State qualification: string = ''
  @State email: string = ''
  @State region: string = ''
  @State _position: string = ''


  build() {
    Column() {
      Text('用户注册')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 30 })

      // 用户名
      TextInput({ placeholder: '请输入姓名' })
        .onChange((value: string) => { this.username = value })
        .margin({ bottom: 15 })

      // 密码
      TextInput({ placeholder: '请输入密码' })
        .type(InputType.Password)
        .onChange((value: string) => { this.password = value })
        .margin({ bottom: 15 })

      // 确认密码
      TextInput({ placeholder: '请再次输入密码' })
        .type(InputType.Password)
        .onChange((value: string) => { this.confirmPassword = value })
        .margin({ bottom: 15 })

      // 学校
      TextInput({ placeholder: '请输入学校' })
        .onChange((value: string) => { this.school = value })
        .margin({ bottom: 15 })

      // 学历
      TextInput({ placeholder: '请输入学历' })
        .onChange((value: string) => { this.qualification = value })
        .margin({ bottom: 15 })

      // 邮箱
      TextInput({ placeholder: '请输入邮箱' })
        .onChange((value: string) => { this.email = value })
        .margin({ bottom: 15 })

      // 地区
      TextInput({ placeholder: '请输入地区' })
        .onChange((value: string) => { this.region = value })
        .margin({ bottom: 15 })

      // 职位
      TextInput({ placeholder: '请输入职位' })
        .onChange((value: string) => { this._position = value })
        .margin({ bottom: 15 })

      // 按钮行
      Row() {
        Button('注册')
          .onClick(() => {
            // 调用注册逻辑
            if (this.handleRegister()) {
              // 构建要传回的数据对象
              let userData = {
                id: "0",
                username: this.username,
                password: this.password,
                school: this.school,
                qualification: this.qualification,
                email: this.email,
                region: this.region,
                position: this._position,
                SelectedCourses: []
              } as UserModel;

              console.log('testTag: 用户注册数据为：', userData);
              // 通过回调函数将数据传回主页面
              if (this.onConfirm) {
                this.onConfirm(userData);
              }
              this.controller.close();
            }
          })
          .backgroundColor(Color.Orange)
          .layoutWeight(1)

        Button('取消')
          .onClick(() => { this.controller.close() })
          .backgroundColor(Color.Gray)
          .layoutWeight(1)
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly)
    }
    .padding(20)
    .width('100%')
  }

  // 处理注册逻辑，包含表单验证
  private handleRegister(): boolean {
    // 非空验证
    if (!this.username.trim()) {
      promptAction.showToast({ message: '请输入用户名' }); return false;
    }
    if (!this.password.trim()) {
      promptAction.showToast({ message: '请输入密码' }); return false;
    }
    // 密码一致性验证
    if (this.password !== this.confirmPassword) {
      promptAction.showToast({ message: '两次输入的密码不一致' }); return false;
    }
    return true; // 验证通过
  }
}

export { RegisterDialog };