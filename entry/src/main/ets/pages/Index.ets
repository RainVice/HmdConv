import { HmdConv } from '@rv/hmd-conv';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    this.message = new HmdConv().html2md(`
<h2>项目升级AGP到8.0+</h2>
<p>同步项目，遇到以下错误： Namespace not specified. Specify a namespace in the module's build file. See https://d.android.com/r/tools/upgrade-assistant/set-namespace for information about setting the namespace.</p>
<p><code>解决方案</code>： 在每一个模块中，都有一个build.gradle文件和AndroidManifest.xml，现在需要做的就是把AndroidManifest.xml中package=&quot;com.aaa.bbb&quot;包名添加到模块对应的build.gradle中。每一个模块都是这样，包括主App模块。 假设AndroidManifest.xml -&gt; package=&quot;com.aaa.bbb&quot;</p>
<pre><code class="language-c">android {
	namespace &quot;com.aaa.bbb&quot;
}
</code></pre>
<p>如果不解决namespace问题，用到的R文件也是无法生成，跨模块使用R文件各种错误。</p>
<h2>BuildConfig无法生成，报红</h2>
<p>AGP8+默认不生成模块的BuildConfig.java，导致之前使用该类的功能失效。开启方案是： 在模块的build.gradle中增加配置。</p>
<pre><code class="language-c">android {
	buildFeatures {
        buildConfig true
    }
}
</code></pre>

`)
    const aaa = this.message.toString()
    return
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