import { UserModel } from "../viewmodel/UserModel"
import { UserInfoData } from "../Data/Data"
import { router } from "@kit.ArkUI"


// MyTabContent.est
@Component
export default struct MyTabContent {

  @State userInfo: UserModel = new UserModel()

  aboutToAppear(){
    console.log('testTag: MyTabContent aboutToAppear')
    // todo: 获取用户信息
    this.userInfo = UserInfoData
  }

  // 页面显示时调用
  // 编辑用户信息后用于刷新
  onPageShow(){
    console.log('testTag: MyTabContent onPageShow')
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
              id: this.userInfo.id
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
          .borderColor(Color.Gray)
          .margin({top: 15, bottom: 15})


        Text("姓名: " + this.userInfo.username)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          // .borderStyle(BorderStyle.Solid)

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor(Color.Gray)
          .margin({top: 15, bottom: 15})

        Text("学校: " + this.userInfo.school)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          // .borderStyle(BorderStyle.Solid)

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor(Color.Gray)
          .margin({top: 15, bottom: 15})

        Text("学历: " + this.userInfo.qualification)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          // .borderStyle(BorderStyle.Solid)

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor(Color.Gray)
          .margin({top: 15, bottom: 15})

        Text("邮箱: " + this.userInfo.email)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          // .borderStyle(BorderStyle.Solid)

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor(Color.Gray)
          .margin({top: 15, bottom: 15})

        Text("地区: " + this.userInfo.region)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          // .borderStyle(BorderStyle.Solid)

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor(Color.Gray)
          .margin({top: 15, bottom: 15})

        Text("职位: " + this.userInfo.position)
          .width('94%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          // .borderStyle(BorderStyle.Solid)

        Text()
          .width('94%')
          .fontSize(18)
          .borderWidth({ top: 1 })
          .borderColor(Color.Gray)
          .margin({top: 15, bottom: 15})


      }
      .width('100%')
      .height('80%')
      .backgroundColor(Color.Pink)

      Button("退出登录").onClick((event: ClickEvent) => {
        // todo: 退出登录
        console.log('testTag: 退出登录')


      })
        .backgroundColor(Color.Red)
        .margin({top: 45})
    }
  }
}
