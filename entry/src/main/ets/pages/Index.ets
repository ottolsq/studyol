import HomeTabContent from '../views/HomeTabContent'
import AllThingsTabContent from '../views/AllThingsTabContent'
import StudyTabContent from '../views/StudyTabContent'
import MyTabContent from '../views/MyTabContent'
import { TabItem } from '../viewmodel/NewsData'
import preferences from '@ohos.data.preferences'
import { common } from '@kit.AbilityKit'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct MainPage {
  @State currentTabIndex: number = 0;

  @State userId: string = '';
  @State isCheckingLogin: boolean = false;

  private context = getContext(this) as common.UIAbilityContext;
  private preference = preferences.getPreferences(this.context, { name: 'userInfo' })


  // 底部导航配置
  private tabs: TabItem[] = [
    { title: '首页', icon: '🌐' },
    { title: '全部', icon: '📚' },
    { title: '学习', icon: '🏫' },
    { title: '我的', icon: '👤' }
  ]

  async aboutToAppear() {
    console.log('testTag: MainPage aboutToAppear');
    // await this.checkLoginStatus()
    // todo: 检查是否登录，并获取数据

    (await this.preference).putSync('userId', '111');

    // 获取用户ID -- 检查是否登录
    this.userId = (await this.preference).getSync('userId', '') as string;
    console.log('testTag: MainPage userId: ' + this.userId);

    // (await this.preference).putSync('userId', '111');
    // (await this.preference).flush();

    if(!this.userId){
      router.replaceUrl({
        url: 'pages/Login'
      })
    }

    this.isCheckingLogin = true;
    // 获取用户信息


  }

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
            .fontColor(this.currentTabIndex === index ? '#E53935' : '#80817E')
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .padding(8)
        .onClick(() => {
          this.currentTabIndex = index
        })
      })
    }
    .width('100%')
    .padding(8)
    .backgroundColor('#E4E4E7')
  }
}
