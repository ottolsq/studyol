import { promptAction, router } from '@kit.ArkUI';
import { UserInfoData } from "../Data/Data"

@Entry
@Component
struct EditUser {
  @State userId: string = '';

  @State username: string = '';
  @State school: string = '';
  @State qualification: string = '';
  @State email: string = '';
  @State region: string = '';
  @State userPosition: string = '';


  aboutToAppear(): void {
    console.log('testTag: EditUser aboutToAppear')
    const params = router.getParams() as Record<string, string>
    if (params && params['id']) {
      this.userId = params['id']
      // 可根据ID发起数据请求等操作
      // todo: 请求用户信息

      this.username = UserInfoData.username
      this.school = UserInfoData.school ?? ''
      this.qualification = UserInfoData.qualification ?? ''
      this.email = UserInfoData.email ?? ''
      this.region = UserInfoData.region ?? ''
      this.userPosition = UserInfoData.position ?? ''
    }
  }

  build() {
    Column(){
      Row(){
        Button("<")
          .fontSize(18)
          .borderRadius(0)
          .type(ButtonType.Normal)
          .fontColor(Color.Black)
          .backgroundColor('#FFF')
          // .border({                 // 边框设置（可选）
          //   width: 1,
          //   color: '#CCC'
          // })
          .onClick(() => {
            router.back()
          })

        // 课程标题
        Text("编辑用户")
          .width("80%")
          .fontSize(18)
          .textAlign(TextAlign.Center)
      }
      .width("100%")
      .backgroundColor(Color.White)
      .position({ x: 0, y: 0 })
      .zIndex(1)

      Row(){
        Text("姓名:")
          .fontSize(16)
          // .margin({ top: 20 })
          .width('15%')

        // 用户名输入
        TextInput({ placeholder: '请输入用户名', text: this.username })
          .onChange((value: string) => {
            this.username = value
          })
          .width('85%')
          .height(40)
          // .margin({ top: 20 })
          .border({ width: 1, color: '#ccc' })
      }
      .margin({ top: 50})
      .width('94%')

      Row(){
        Text("学校:")
          .fontSize(16)
          // .margin({ top: 20 })
          .width('15%')

        // 学校输入
        TextInput({ placeholder: '请输入学校', text: this.school })
          .onChange((value: string) => {
            this.school = value
          })
          .width('85%')
          .height(40)
          .border({ width: 1, color: '#ccc' })
      }
      .margin({ top: 10})
      .width('94%')

      Row(){
        Text("学历:")
          .fontSize(16)
          // .margin({ top: 20 })
          .width('15%')

        // 学历输入
        TextInput({ placeholder: '请输入学历', text: this.qualification })
          .onChange((value: string) => {
            this.qualification = value
          })
          .width('85%')
          .height(40)
          .border({ width: 1, color: '#ccc' })
      }
      .margin({ top: 10})
      .width('94%')

      Row(){
        Text("邮箱:")
          .fontSize(16)
          // .margin({ top: 20 })
          .width('15%')

        // 邮箱输入
        TextInput({ placeholder: '请输入邮箱', text: this.email })
          .onChange((value: string) => {
            this.email = value
          })
          .width('85%')
          .height(40)
          .border({ width: 1, color: '#ccc' })

      }
      .margin({ top: 10})
      .width('94%')

      Row(){
        Text("地区:")
          .fontSize(16)
          // .margin({ top: 20 })
          .width('15%')

        // 地区输入
        TextInput({ placeholder: '请输入地区', text: this.region })
          .onChange((value: string) => {
            this.region = value
          })
          .width('85%')
          .height(40)
          .border({ width: 1, color: '#ccc' })


      }
      .margin({ top: 10})
      .width('94%')

      Row(){
        Text("职位:")
          .fontSize(16)
          // .margin({ top: 20 })
          .width('15%')

        // 职位输入
        TextInput({ placeholder: '请输入职位', text: this.userPosition })
          .onChange((value: string) => {
            this.userPosition = value
          })
          .width('85%')
          .height(40)
          .border({ width: 1, color: '#ccc' })
      }
      .margin({ top: 10})
      .width('94%')


      Button("确定修改")
        .margin({top: 265})
        .onClick((event: ClickEvent) => {

          if (this.username.trim() !== '') {
            // todo: 修改用户信息


            promptAction.showToast({ message: '修改成功!' });
            router.replaceUrl({
              url: 'pages/Index'
            })
          }else{

            promptAction.showToast({ message: '姓名不可为空!' });
          }
      })

    }
    .width("100%")
    .height("100%")
    .backgroundColor($r('app.color.my_background'))
  }
}