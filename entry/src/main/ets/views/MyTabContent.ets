import { UserModel } from "../viewmodel/UserModel"
import Constants, { ContentType } from '../common/constants/Constants'
import { promptAction, router } from "@kit.ArkUI"
import { common } from "@kit.AbilityKit";
import preferences from '@ohos.data.preferences'
import { http } from "@kit.NetworkKit";

// MyTabContent.est
@Component
export default struct MyTabContent {

  @State userId: string = '';
  @State userInfo: UserModel = new UserModel()

  private context = getContext(this) as common.UIAbilityContext;
  private preference = preferences.getPreferences(this.context, { name: 'userInfo' })

  async aboutToAppear(){
    // 获取用户信息

    // 获取用户id
    this.userId = (await this.preference).getSync('userId', '') as string

    console.log('testTag: MyTabContent userId: ' + this.userId);

    try {
      let httpRequest = http.createHttp();
      httpRequest.request(`http://172.18.96.30:8080/getUserById/${this.userId}`, {
        method:  http.RequestMethod.GET,
        readTimeout: Constants.HTTP_READ_TIMEOUT,
        header: {
          'Content-Type': ContentType.JSON
        },
        connectTimeout: Constants.HTTP_READ_TIMEOUT
      }, async (err, result) =>{
        if (result.responseCode === 200) {
          console.log('testTag: 获取成功')
          console.log('testTag: responseResult:', typeof result.result);

          let userData: UserModel;

          if (typeof result.result === 'string') {
            userData = JSON.parse(result.result);

            this.userInfo = userData
          }else{
            promptAction.showToast({ message: '转换失败' })
          }
        } else {
          console.log('testTag: 获取失败')
          promptAction.showToast({ message: '获取失败' })
        }
      });
    } catch (err) {
      console.error('Request error:', err);
      promptAction.showToast({ message: '网络请求异常' });
    }
  }

  build() {
    Column(){
      Text('我的')
        .fontSize(20)
        .lineHeight(20)
        .fontColor('#000')
        .textAlign(TextAlign.Center)
        .margin({ top: 3, bottom: 3 })

      Text("🖆")
        .fontSize(30)
        // .border({width: 1, color: Color.Gray})
        .onClick(()=>{
          // 编辑用户信息
          router.pushUrl({
            url: 'pages/EditUser',
            params: {
              id: this.userId
            }
          })

        })
        .position({ x: 320, y: 30 })
        .zIndex(1)


      Column(){
        Image($r('app.media.user'))
          .width(100)
          .height(100)
          .borderRadius(50)
          .margin({ top: 10, bottom: 10 })
          .border({                 // 边框设置（可选）
            width: 3,
            color: Color.Gray
          })

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor($r('app.color.my_font_color'))
          .margin({top: 15, bottom: 15})


        Text("用户: " + this.userInfo.username)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          .fontColor($r('app.color.my_font_color'))

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor($r('app.color.my_font_color'))
          .margin({top: 15, bottom: 15})

        Text("学校: " + this.userInfo.school)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          .fontColor($r('app.color.my_font_color'))

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor($r('app.color.my_font_color'))
          .margin({top: 15, bottom: 15})

        Text("学历: " + this.userInfo.qualification)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          .fontColor($r('app.color.my_font_color'))

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor($r('app.color.my_font_color'))
          .margin({top: 15, bottom: 15})

        Text("邮箱: " + this.userInfo.email)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          .fontColor($r('app.color.my_font_color'))

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor($r('app.color.my_font_color'))
          .margin({top: 15, bottom: 15})

        Text("地区: " + this.userInfo.region)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          .fontColor($r('app.color.my_font_color'))

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor($r('app.color.my_font_color'))
          .margin({top: 15, bottom: 15})

        Text("职位: " + this.userInfo.position)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          .fontColor($r('app.color.my_font_color'))

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor($r('app.color.my_font_color'))
          .margin({top: 15, bottom: 15})


      }
      .width('100%')
      .height('80%')
      // .backgroundColor(Color.Pink)

      Button("退出登录").onClick(async (event: ClickEvent) => {
        console.log('testTag: 退出登录');
        (await this.preference).delete('userId')

        router.replaceUrl({
          url: 'pages/Login'
        })

      })
        .backgroundColor('#FB2C36')
        .margin({top: 45})
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.my_background'))
  }
}
