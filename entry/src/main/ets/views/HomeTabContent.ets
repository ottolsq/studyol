import { router } from "@kit.ArkUI"
import { CourseModel } from "../viewmodel/CourseModel"

// HomeTabContent.ets
@Component
export default struct HomeTabContent {

  private swiperController: SwiperController = new SwiperController()  // 声明控制器

  private CourseList: Array<CourseModel> = [
    {
      id: "1",
      name: "阿爸水电费阿斯顿发的",
      teacher: "张三",
      school: "广软",
      type: "math",
      introduction: "这里是简介12312312312阿斯顿法师打发斯蒂芬",
      image: $r('app.media.th'),

    },
    {
      id: "2",
      name: "阿爸水电费阿斯顿发的",
      teacher: "张三",
      school: "广软",
      type: "math",
      introduction: "这里是简介12312312312阿斯顿法师打发斯蒂芬",
      image: $r('app.media.th1'),

    },
    {
      id: "3",
      name: "阿爸水电费阿斯顿发的",
      teacher: "张三",
      school: "广软",
      type: "math",
      introduction: "这里是简介12312312312阿斯顿法师打发斯蒂芬",
      image: $r('app.media.th2'),

    },
    {
      id: "4",
      name: "阿爸水电费阿斯顿发的",
      teacher: "张三",
      school: "广软",
      type: "math",
      introduction: "这里是简介12312312312阿斯顿法师打发斯蒂芬",
      image: $r('app.media.th3'),
    }
  ]

  aboutToAppear(){
    console.log('testTag: HomeTabContent aboutToAppear')

    // todo: 获取课程数据
  }

  build() {
    Column() {
      Scroll(){
        Column(){
          // 标题
          Text('首页')
            .fontSize(20)
            .lineHeight(20)
            .fontColor('#000')
            .textAlign(TextAlign.Center)
            .margin({ top: 3, bottom: 3 })

          // 轮播图
          Swiper(this.swiperController) {
            ForEach(this.CourseList, (Course: CourseModel) => {
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
            Column(){


            }

          }

          // todo: 课程卡
          ForEach(this.CourseList, (Course: CourseModel) => {
            Column() {
              Image(Course.image)
                .borderRadius(5)
                .width(150)
                .height(150)
                .objectFit(ImageFit.Cover)
                .margin({ top: 3, bottom: 3 })
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/Course',  // 请根据实际页面路径调整
                  })
                })
            }
          })
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}
