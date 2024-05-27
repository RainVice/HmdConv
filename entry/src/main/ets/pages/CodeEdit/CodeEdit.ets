import measure from '@ohos.measure'
import { colorMap } from './highlight'
import font from '@ohos.font'
import { KeyCode } from '@kit.InputKit'

@Entry
@Component
struct CodeEdit {
  vscroller: Scroller = new Scroller()
  hscroller: Scroller = new Scroller()
  controller: TextAreaController = new TextAreaController()
  @State @Watch("scroll") text: string = ''
  @State fontsize: number = 16
  @State textHight: number = 0

  aboutToAppear(): void {
    this.textHight = px2vp(measure.measureTextSize({
      textContent: "ggg",
      fontSize: this.fontsize,
    }).height as number)
  }

  build() {
    Column() {
      Scroll(this.vscroller) {

        Row({ space: 5 }) {
          Column() {
            ForEach(this.text.split('\n'), (item: string, index: number) => {

              Text(index.toString())
                .height(this.textHight)
                .width(30)
                .textAlign(TextAlign.Center)
                .backgroundColor("#313335")
                .fontColor("#A4A3A3")
                .fontSize(12)
                .alignSelf(ItemAlign.Start)

            })
          }.justifyContent(FlexAlign.Start)

          Scroll(this.hscroller) {
            Stack() {
              Column() {
                ForEach(this.text.split('\n'), (item: string, index: number) => {
                  Text() {
                    ForEach(item.split(/(\W+|\s+)/).filter(s => s !== ''), (word: string, windex: number) => {
                      if (windex === 0 && word.trim() === "") {
                        Span(".".repeat(word.length)).fontColor("#373737")
                      }
                      else {
                        Span(word).fontColor(colorMap[word] || "#fff")
                      }
                    })
                  }
                  .height(this.textHight)
                  .fontColor(Color.White)
                  // .layoutWeight(1)
                  .fontSize(this.fontsize)

                  // .padding({ right: 5 })
                })
              }
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.Start)

              TextArea({ text: $$this.text, controller: this.controller })
                .onKeyEvent((event: KeyEvent) => {
                  if (event.keyCode === KeyCode.KEYCODE_TAB && event.type === KeyType.Down) {
                    this.text += "    "
                  } else if (event.keyCode === KeyCode.KEYCODE_ENTER) {
                    if (this.text.includes('\n')) {
                      // todo 当前位置的上一行
                      const arr = this.text.split('\n')
                      const s = arr[arr.length-2]
                      const leadingSpaces: number = s.length - s.trimStart().length;
                      // 在this.text的指定位置插入数据
                      const caretOffset = this.controller.getCaretOffset().index; // 获取插入位置
                      let modifiedText = this.text.substring(0, caretOffset) + " ".repeat(leadingSpaces - leadingSpaces % 4) + this.text.substring(caretOffset);
                      // 更新 this.text
                      this.text = modifiedText;
                    }
                  }
                })// .padding({ top: 0, bottom: 0, left: 0, right: 5 })
                .borderRadius(0)
                .backgroundColor(Color.Transparent)
                .fontColor(Color.Transparent)
                .onChange((value: string) => {
                })
                .padding(0)
                .fontSize(this.fontsize)
              // .layoutWeight(1)

            }
            .alignContent(Alignment.TopStart)
          }.scrollable(ScrollDirection.Horizontal)
        }.alignItems(VerticalAlign.Top)

        // Scroll() {
        //   Stack() {
        //     // 行
        //     Column() {
        //       ForEach(this.text.split('\n'), (item: string, index: number) => {
        //         Row({ space: 5 }) {
        //           Text(index.toString())
        //             .height(this.textHight)
        //             .width(30)
        //             .textAlign(TextAlign.Center)
        //             .backgroundColor("#313335")
        //             .fontColor("#A4A3A3")
        //             .fontSize(12)
        //             .alignSelf(ItemAlign.Start)
        //           Text() {
        //             ForEach(item.split(/(\W+|\s+)/).filter(s => s !== ''), (word: string, windex: number) => {
        //               if (windex === 0 && word.trim() === "") {
        //                 Span(".".repeat(word.length)).fontColor("#373737")
        //               }
        //               else {
        //                 Span(word).fontColor(colorMap[word] || "#fff")
        //               }
        //             })
        //           }
        //           .fontColor(Color.White)
        //           // .layoutWeight(1)
        //           .fontSize(this.fontsize)
        //           // .padding({ right: 5 })
        //         }
        //       })
        //     }
        //     // .width("100%")
        //     .alignItems(HorizontalAlign.Start)
        //     .justifyContent(FlexAlign.Start)
        //
        //     Row() {
        //       Column().width(35)
        //       TextArea({ text: $$this.text, controller: this.controller })
        //         .onKeyEvent((event: KeyEvent) => {
        //           if (event.keyCode === KeyCode.KEYCODE_TAB && event.type === KeyType.Down) {
        //             this.text += "    "
        //           } else if (event.keyCode === KeyCode.KEYCODE_ENTER) {
        //             if (this.text.includes('\n')) {
        //               // todo 当前位置的上一行
        //               const arr = this.text.split('\n')
        //               const s = arr[arr.length-2]
        //               const leadingSpaces: number = s.length - s.trimStart().length;
        //               // 在this.text的指定位置插入数据
        //               const caretOffset = this.controller.getCaretOffset().index; // 获取插入位置
        //               let modifiedText = this.text.substring(0, caretOffset) + " ".repeat(leadingSpaces - leadingSpaces % 4) + this.text.substring(caretOffset);
        //               // 更新 this.text
        //               this.text = modifiedText;
        //             }
        //           }
        //         })
        //         // .padding({ top: 0, bottom: 0, left: 0, right: 5 })
        //         .borderRadius(0)
        //         .backgroundColor(Color.Transparent)
        //         .fontColor(Color.Transparent)
        //         .onChange((value: string) => {
        //         })
        //         .fontSize(this.fontsize)
        //         // .layoutWeight(1)
        //     }
        //   }
        //   // .width("100%")
        //   .alignContent(Alignment.TopStart)
        // }
        // .width("100%e")
        // .scrollable(ScrollDirection.Horizontal)

      }.align(Alignment.TopStart)
    }.backgroundColor("#2B2B2B")
    // .height("100%")

  }

  scroll(){
    // this.vscroller.scrollEdge(Edge.Bottom)
    const caret = this.controller.getCaretOffset()
    // const pos = this.findLineColumn(this.text,caret.index)
    console.log(JSON.stringify(caret));
    console.log(px2vp(caret.y).toString());
    this.vscroller.scrollTo({
      yOffset: px2vp(caret.y),
      xOffset: 0
    })
  }

  findLineColumn(text: string, index: number): Array<number> {
    if (text === "") {
      return [0,0]
    }

    const lines = text.split('\n');
    let lineNumber = 0;
    let charNumber = 0;

    for (const line of lines) {
      if (index <= line.length) {
        charNumber = index;
        break;
      } else {
        index -= line.length + 1;
        lineNumber++;
      }
    }

    console.log(lineNumber.toString(),charNumber.toString())

    return [lineNumber, charNumber];
  }
}