import { CourseListData } from "../Data/Data"
import { CourseModel } from "../viewmodel/CourseModel"
import { router } from "@kit.ArkUI"

// AllThingsTabContent.est
@Component
export default struct AllThingsTabContent {
  @State courseList: Array<CourseModel> = []

  aboutToAppear(){
    console.log('testTag: AllThingsTabContent aboutToAppear')
    // todo: 获取课程数据
    this.courseList = CourseListData;
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Text('全部课程')
            .fontSize(20)
            .lineHeight(20)
            .fontColor('#000')
            .textAlign(TextAlign.Center)
            .margin({ top: 3, bottom: 3 })


          ForEach(this.courseList, (Course: CourseModel) => {
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


                Text("学校: " + Course.school)
                  .fontSize(16)
                  .fontColor('#000')
                  .textAlign(TextAlign.Start)
                  .margin({ top: 3, bottom: 3 })

                Text("教师: " + Course.teacher)
                  .fontSize(16)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })
              }
              .width('50%')
            }
            .margin({ bottom: 10 })
            .height(110)
            .width('94%')
            .borderRadius(5)
            .backgroundColor($r('app.color.card_background'))
            .onClick(() => {
              router.pushUrl({
                url: 'pages/Course', // 请根据实际页面路径调整
                params: {
                  id: Course.id
                }
              })
            })
          })

          ForEach(this.courseList, (Course: CourseModel) => {
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


                Text("学校: " + Course.school)
                  .fontSize(16)
                  .fontColor('#000')
                  .textAlign(TextAlign.Start)
                  .margin({ top: 3, bottom: 3 })

                Text("教师: " + Course.teacher)
                  .fontSize(16)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })
              }
              .width('50%')
            }
            .margin({ bottom: 10 })
            .height(110)
            .width('94%')
            .borderRadius(5)
            .backgroundColor($r('app.color.card_background'))
            .onClick(() => {
              router.pushUrl({
                url: 'pages/Course', // 请根据实际页面路径调整
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
  }
}
