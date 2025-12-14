import { router } from "@kit.ArkUI"
import { CourseModel } from "../viewmodel/CourseModel"
import { TabItem } from "../viewmodel/NewsData"
import {CourseListData} from "../Data/Data"
import AllThingsTabContent from "./AllThingsTabContent"
import preferences from "@ohos.data.preferences"

// HomeTabContent.ets
@Component
export default struct HomeTabContent {

  private swiperController: SwiperController = new SwiperController()  // 声明控制器
  private CourseList: CourseModel[] = [];
  private RecomCourses: CourseModel[] = [];

  private sorts: TabItem[] = [
    { title: '计科', icon: '🖥️' },
    { title: '英语', icon: '🔤' },
    { title: '数学', icon: '🔢' },
    { title: '其他', icon: '🎸' }
  ]

  aboutToAppear(){
    console.log('testTag: HomeTabContent aboutToAppear')

    // todo: 获取课程数据
    // CourseListData
    this.CourseList = CourseListData;
    this.RecomCourses = CourseListData.slice(3, 8);
  }

  build() {

    Scroll(){
        Column(){
          // 标题
          Text('首页')
            .fontSize(20)
            .lineHeight(20)
            .fontColor('#000')
            .textAlign(TextAlign.Center)
            .margin({ top: 3, bottom: 3 })

          // 轮播图 -- 推荐课程
          Swiper(this.swiperController) {
            ForEach(this.RecomCourses, (Course: CourseModel) => {
              Image(Course.image)
                .borderRadius(5)
                .width('100%')  // 宽度与 Swiper 保持一致
                .height('100%') // 高度与 Swiper 保持一致
                .objectFit(ImageFit.Cover)
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/Course',  // 请根据实际页面路径调整
                    params: {
                      id: Course.id
                    }
                  })

                })
            }, (Course: CourseModel) => JSON.stringify(Course.id))
          }
          .height(200) // 设置 Swiper 固定高度
          .width('96%') // 宽度填满父容器
          .backgroundColor(Color.White)
          // .margin({ top: $r('app.float.home_swiper_margin') })
          .autoPlay(true)

          // todo: 分类栏
          Row(){
            ForEach(this.sorts, (tab: TabItem, index: number) => {
              Column() {
                Text(tab.icon)
                  .fontSize(30)


                Text(tab.title)
                  // .fontSize(12)
                  // .margin({ top: 4 })
              }
              .margin({ left: 26, right: 26 })
              .onClick(() => {
                let type = '';
                switch (tab.title){
                  case '计科':
                    type = 'cs';
                    break;
                  case '英语':
                    type = 'eng';
                    break;
                  case '数学':
                    type = 'math';
                    break;
                  case '其他':
                    type = 'other';
                    break;
                  default:
                    type = 'all';
                    // console.log('testTag: HomeTabContent 其他')
                }

                router.pushUrl({
                  url: 'pages/SortCourse',  // 请根据实际页面路径调整
                  params: {
                    type: type
                  }
                })

              })
            })
          }
          .width("100%")
          .height(80)
          .margin({ top: 10 })
          .backgroundColor(Color.Green)

          Text("热门课程")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Start)
            .width('96%')
            .margin({top: 10})

          // todo: 课程卡
          ForEach(this.CourseList, (Course: CourseModel) => {
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
            .margin({top: 10})
            .height(110)
            .width('94%')
            .backgroundColor(Color.White)
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

    .width('100%')
    // .height('100%')
    .backgroundColor(Color.Pink)
  }
}
