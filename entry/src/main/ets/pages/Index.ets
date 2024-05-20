import { HmdConv } from '@rv/hmd-conv/Index';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    this.message = new HmdConv().html2md(`
<h1>Heading level 1</h1>
<h2>Heading level 2</h2>
<p>123<del>1232131</del>123</br>12</br>
	<strong>
		<i>34</i>
	</strong>456
</p>
a<i>
	<b>sd</b>
</i>asd
<blockquote>
	<ul>
		<li>First item
			<ol>
				<li>First item
				</li>
				<li>Second item</li>
				<li>Third item</li>
				<li>Fourth item</li>
			</ol>
		</li>
		<li>Second item</li>
		<li>Third item</li>
		<li>Fourth item</li>
	</ul>
	<p>Dorothy
		<h1>Heading level 1</h1>
		<ol>
			<li>First item</li>
			<li>Second item</li>
			<li>123</li>
			<li>Third item</li>
			<li>Fourth item</li>
		</ol>
		followed her through many of <blockquote>
			<p>Dorothy followed her through many of the beautiful rooms in her castle.</p>
		</blockquote>the beautiful rooms in her castle.
	</p>
</blockquote>


<ol>
	<li>First item
		<ul>
			<li>First item</li>
			<li>Second item</li>
			<li>Third item
					<ol>
			<li>First item</li>
			<li>Second item
			<ol>
			<li>First item</li>
			<li>Second item</li>
			<li>123</li>
			<li>Third item</li>
			<li>Fourth item</li>
		</ol>
		</li>
			<li>123</li>
			<li>Third item</li>
			<li>Fourth item</li>
		</ol>
			</li>
			<li>Fourth item
			<blockquote>
			<p>Dorothy followed her through many of the beautiful rooms in her castle.</p>
			<p>Dorothy followed her through many of the beautiful rooms in her castle.</p>
		</blockquote>
			</li>
		</ul>
		123456
	</li>
	<li>Second item</li>
	<li>Third item</li>
	<li>Fourth item</li>
</ol>
`)
  }

  build() {
    Row() {
      Column() {
        TextArea({ text: this.message })
          .backgroundColor(Color.Pink)
          .width("100%")
      }
      .width('100%')
    }
    .height('100%')
  }
}