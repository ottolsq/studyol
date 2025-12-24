@Entry
@Component
struct Test {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .id('TestHelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })

      Image('https://tse3-mm.cn.bing.net/th/id/OIP-C.bvSEFnSCc6Wu0mXeeQycDgHaD3?w=318&h=180&c=7&r=0&o=7&pid=1.7&rm=3')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .backgroundColor(Color.Red)
    }
    .height('100%')
    .width('100%')
  }
}