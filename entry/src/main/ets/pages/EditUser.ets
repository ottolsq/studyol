import { promptAction, router } from '@kit.ArkUI';
import { http } from '@kit.NetworkKit';
import Constants, { ContentType } from '../common/constants/Constants'
import { UserModel } from '../viewmodel/UserModel';

@Entry
@Component
struct EditUser {
  @State userId: string = '';

  @State username: string = '';
  @State school: string | undefined = '';
  @State qualification: string | undefined = '';
  @State email: string | undefined = '';
  @State region: string | undefined = '';
  @State userPosition: string | undefined = '';


  aboutToAppear(): void {
    console.log('testTag: EditUser aboutToAppear')
    const params = router.getParams() as Record<string, string>
    if (params && params['id']) {
      this.userId = params['id']
      // 可根据ID发起数据请求等操作
      // 请求用户信息
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

              this.username = userData.username;
              this.school = userData.school;
              this.qualification = userData.qualification;
              this.email = userData.email;
              this.region = userData.region;
              this.userPosition = userData.position;
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
        Text("用户:")
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