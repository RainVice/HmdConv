import { HmdConv } from '@rv/hmd-conv';
import { lvMarkdownIn } from '@luvi/lv-markdown-in'
import { BiuMarkdown } from '@hcs/biu-markdown'


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    const elements = ['元素1', '元素2', '元素3'];
    this.message = elements.map(element => `${element}`).join('\n\n')
  }

  build() {
    Row() {
      Column() {
        TextArea({ text: this.message })
          .backgroundColor(Color.Pink)
          .width("100%")
        // Scroll(){
        //   BiuMarkdown({content: this.message})
        //     .padding(10)
        // }

      }
      .width('100%')
    }
    .height('100%')
  }
}