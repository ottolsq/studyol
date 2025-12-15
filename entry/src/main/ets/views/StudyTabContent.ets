import { CourseModel } from "../viewmodel/CourseModel";
import { CourseListData } from "../Data/Data"
import { router } from "@kit.ArkUI";
import { common } from "@kit.AbilityKit";
import preferences from '@ohos.data.preferences'

// StudyTabContent.est
@Component
export default struct StudyTabContent {

  @State myCourseList: Array<CourseModel> = [];
  @State userId: string = '';

  private context = getContext(this) as common.UIAbilityContext;
  private preference = preferences.getPreferences(this.context, { name: 'userInfo' })

  async aboutToAppear(){
    console.log('testTag: StudyTabContent aboutToAppear')

    // todo: 获取用户id, 根据用户id获取课程数据
    // 获取用户id
    this.userId = (await this.preference).getSync('userId', '') as string
    // console.log('testTag: StudyTabContent userId: ' + this.userId);

    // 获取课程数据
    this.myCourseList = CourseListData.slice(0, 3);
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
            Image(Course.image)
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
