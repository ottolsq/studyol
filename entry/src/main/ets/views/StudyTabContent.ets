import { CourseModel } from "../viewmodel/CourseModel";
import { promptAction, router } from "@kit.ArkUI";
import { common } from "@kit.AbilityKit";
import preferences from '@ohos.data.preferences'
import Constants, { ContentType } from '../common/constants/Constants'
import { http } from "@kit.NetworkKit";

// StudyTabContent.est
@Component
export default struct StudyTabContent {

  @State myCourseList: Array<CourseModel> = [];
  @State userId: string = '';

  private context = getContext(this) as common.UIAbilityContext;
  private preference = preferences.getPreferences(this.context, { name: 'userInfo' })

  async aboutToAppear(){
    console.log('testTag: StudyTabContent aboutToAppear')

    // 获取用户id, 根据用户id获取课程数据
    // 获取用户id
    this.userId = (await this.preference).getSync('userId', '') as string
    try {
      let httpRequest = http.createHttp();
      httpRequest.request(`${Constants.SERVER}/getCourseByUserId/${this.userId}`, {
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

          let courseData: CourseModel[];

          if (typeof result.result === 'string') {
            courseData = JSON.parse(result.result);
            this.myCourseList = courseData
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
    Scroll(){
      Column(){
        Text('我的课程')
          .fontSize(20)
          .lineHeight(20)
          .fontColor('#000')
          .textAlign(TextAlign.Center)
          .margin({ top: 3, bottom: 3 })

        ForEach(this.myCourseList, (Course: CourseModel) => {
          Row() {
            Image(Course.image_url)
              .borderRadius(5)
              .width('50%')
              .height(110)
              .objectFit(ImageFit.Cover)
              .margin({ top: 3, bottom: 3 })

            Column() {
              Text(Course.name)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#000')
                // .textAlign(TextAlign.Center)
                .margin({ top: 3, bottom: 3 })


              Text(Course.school+ "|"+Course.teacher)
                .fontSize(16)
                .fontColor('#000')
                .textAlign(TextAlign.Start)
                .margin({ top: 3, bottom: 3 })

              Button("进入学习")
                .backgroundColor(Color.Orange)
                .onClick(()=>{
                  // 进入学习页面
                  router.pushUrl({
                    url: 'pages/Study',  // 请根据实际页面路径调整
                    params: {
                      id: Course.id
                    }
                  })
                })
            }
            .width('50%')
          }
          .margin({bottom: 10})
          .height(110)
          .width('94%')
          .borderRadius(10)
          .backgroundColor($r('app.color.card_background'))
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Course',  // 请根据实际页面路径调整
              params: {
                id: Course.id
              }
            })
          })
        })
      }
    }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.my_background'))
    // .height('100%')
  }
}
