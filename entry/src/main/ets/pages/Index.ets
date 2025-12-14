import HomeTabContent from '../views/HomeTabContent'
import AllThingsTabContent from '../views/AllThingsTabContent'
import StudyTabContent from '../views/StudyTabContent'
import MyTabContent from '../views/MyTabContent'
import { TabItem } from '../viewmodel/NewsData'
import preferences from '@ohos.data.preferences'

// 定义底部导航项类型


@Entry
@Component
struct MainPage {
  @State currentTabIndex: number = 0;
  @State refreshKey: number = 0;
  @State isCheckingLogin: boolean = true;



  // 底部导航配置
  private tabs: TabItem[] = [
    { title: '首页', icon: '🌐' },
    { title: '全部', icon: '📚' },
    { title: '学习', icon: '🏫' },
    { title: '我的', icon: '👤' }
  ]

  // 检查是否登录
  async aboutToAppear() {

    // await this.checkLoginStatus()
  }



  // async checkLoginStatus() {
  //   try {
  //     const isLoggedIn = await StorageManager.loadLoginStatus()
  //     if (!isLoggedIn) {
  //       console.info('未检测到登录状态，跳转到登录页')
  //       router.replaceUrl({
  //         url: 'pages/LoginPage'
  //       })
  //       return
  //     }
  //
  //     const userData = await StorageManager.loadUserData()
  //     if (userData) {
  //       simpleAppState.login(userData)
  //     }
  //
  //     this.isCheckingLogin = false
  //   } catch (err) {
  //     console.error('检查登录状态失败: ' + JSON.stringify(err))
  //     this.isCheckingLogin = false
  //   }
  // }

  build() {
    Column() {
      if (this.isCheckingLogin) {
        // this.renderLoading()
        this.getCurrentTabContent()
        this.BottomNavigation()
      } else {

        // 显示内容
        this.getCurrentTabContent()
        // 底部导航
        this.BottomNavigation()
      }
    }
    .width('100%')
    .height('100%')
    // .backgroundColor(Color.White)

  }


  // 检查登录状态
  @Builder
  renderLoading() {
    Column() {
      Text('检查登录状态...')
        .fontSize(16)
        .fontColor('#CCCCCC')
        .margin(40)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  // 获取当前Tab的内容
  @Builder
  getCurrentTabContent() {
    Column() {
      if (this.currentTabIndex === 0) {
        HomeTabContent()
      } else if (this.currentTabIndex === 1) {
        AllThingsTabContent()
      } else if (this.currentTabIndex === 2) {
        StudyTabContent()
      } else if (this.currentTabIndex === 3) {
        MyTabContent()
      }
    }
    .layoutWeight(1)
    .width('100%')
  }


  // 底部导航栏
  @Builder
  BottomNavigation() {
    Row() {
      ForEach(this.tabs, (tab: TabItem, index: number) => {
        Column() {
          Text(tab.icon)
            .fontSize(20)
            .opacity(this.currentTabIndex === index ? 1 : 0.6)

          Text(tab.title)
            .fontSize(12)
            .fontColor(this.currentTabIndex === index ? '#E53935' : '#CCCCCC')
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .padding(8)
        .onClick(() => {
          this.currentTabIndex = index
          this.refreshKey += 1
        })
      })
    }
    .width('100%')
    .padding(8)
    .backgroundColor("#CAD5E2")
  }


  // 数据卡片组件
  // @Builder
  // DataCard(title: string, value: string, unit: string) {
  //   Column() {
  //     Text(title)
  //       .fontSize(14)
  //       .fontColor('#CCCCCC')
  //       .margin({ bottom: 8 })
  //
  //     Row() {
  //       Text(value)
  //         .fontSize(20)
  //         .fontWeight(FontWeight.Bold)
  //         .fontColor('#FFFFFF')
  //
  //       Text(unit)
  //         .fontSize(12)
  //         .fontColor('#CCCCCC')
  //         .margin({ left: 4 })
  //     }
  //     .alignItems(VerticalAlign.Bottom)
  //   }
  //   .width('100%')
  //   .height('100%')
  //   .backgroundColor('#1A1A1A')
  //   .borderRadius(8)
  //   .justifyContent(FlexAlign.Center)
  //   .padding(12)
  // }
}
