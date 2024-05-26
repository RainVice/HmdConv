@Entry
@Component
struct Test {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Column(){
          ForEach(this.message.split('\n'), (item: string, index: number) => {
            Text(item).width("100%")
              .padding(0)
          })
        }
        TextArea({text: $$this.message}).width("100%")
          .padding(0)
          .borderRadius(0)
      }
    }
    .height('100%')
  }
}