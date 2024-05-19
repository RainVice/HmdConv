import { HmdConv } from '@rv/hmd-conv/Index';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    this.message = new HmdConv().html2md(`<h1>Heading level 1</h1>
<h2>Heading level 2</h2>
<p>123<del>1232131</del>123</br>12</br>
<strong><i>34</i></strong>456</p>
a<i><b>sd</b></i>asd`)
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .backgroundColor(Color.Pink)
          .width("100%")
      }
      .width('100%')
    }
    .height('100%')
  }
}