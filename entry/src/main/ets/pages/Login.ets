import { LoginDialog } from '../views/LoginDialog'
import { RegisterDialog } from '../views/RegisterDialog'
import { promptAction, router } from '@kit.ArkUI'
import preferences from '@ohos.data.preferences'
import { common } from '@kit.AbilityKit'

@Entry
@Component
struct Login {

  private context = getContext(this) as common.UIAbilityContext;
  private preference = preferences.getPreferences(this.context, { name: 'userInfo' })

  // 创建弹窗控制器[5,6](@ref)
  loginDialogController: CustomDialogController = new CustomDialogController({
    builder: LoginDialog({
      onConfirm: this.handleLogin.bind(this) // 绑定处理登录逻辑的回调函数
    }),
    alignment: DialogAlignment.Center, // 弹窗居中对齐[6](@ref)
    autoCancel: true // 点击遮罩层可关闭弹窗，提升用户体验[2](@ref)
  })

  // 处理表单提交的回调函数
  private async handleLogin(username: string, password: string) {
    // 在这里处理登录逻辑，例如发送网络请求[3](@ref)
    console.log(`testTag: 用户名: ${username}, 密码: ${password}`);
    // todo: 登录请求

    (await this.preference).putSync('userId', '111');

    // 登录成功
    promptAction.showToast({ message: `欢迎回来，${username}!` })
    router.replaceUrl({
      url: 'pages/Index'
    })
  }


  // 创建注册弹窗控制器
  registerDialogController: CustomDialogController = new CustomDialogController({
    builder: RegisterDialog({
      onConfirm: this.handleRegister.bind(this) // 绑定处理注册逻辑的回调函数
    }),
    alignment: DialogAlignment.Center,
    autoCancel: true
  })

  // 处理注册逻辑的回调函数
  private handleRegister(userData: object) {
    // 这里可以发送注册请求到服务器
    console.log('testTag: 注册信息:', JSON.stringify(userData));
    // 示例：显示注册成功提示

    // todo: 注册请求

    // 注册成功
    promptAction.showToast({ message: '注册成功！' });
  }


  build() {
    Column() {

      Image($r('app.media._icon'))
        .width(150)
        // .height(100)
        .margin({ top: 100 })
        .align(Alignment.Center)

      // 标题
      Text('学成在线')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .letterSpacing(12)
        .lineHeight(20)
        .fontColor('#000')
        .textAlign(TextAlign.Center)
        .margin({ top: 20, bottom: 3 })
        .width('100%')

      Button('登录')
        .onClick(() => {
          // 点击按钮打开弹窗
          this.loginDialogController.open()
        })
        .width('60%')
        .margin({ top: 100 })

      Button('注册')
        .onClick(() => {
          // 点击按钮打开弹窗
          this.registerDialogController.open()
        })
        .width('60%')
        .margin({ top: 30 })
    }
    .backgroundColor($r('app.color.my_background'))
    .width('100%')
    .height('100%')
  }
}
