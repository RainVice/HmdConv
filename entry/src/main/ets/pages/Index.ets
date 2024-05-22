import { HmdConv } from '@rv/hmd-conv';
import { lvMarkdownIn } from '@luvi/lv-markdown-in'
import { BiuMarkdown } from '@hcs/biu-markdown'


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State html:string = `
<blockquote><p>微信公众号排版工具。问题或建议，请公众号留言。<strong><a href='#jump_8'>程序员翻身</a></strong></p>
</blockquote>
<p>建议使用 <strong>Chrome</strong> 浏览器，体验最佳效果。</p>
<p>使用微信公众号编辑器有一个十分头疼的问题：粘贴出来的代码，格式错乱，空间小还带行号，而且特别丑。Markdown.com.cn编辑器能够解决这个问题。</p>
<p>Markdown是一种轻量级的「标记语言」。</p>
<p>请阅读下方文本熟悉工具使用方法，本文可直接拷贝到微信中预览。</p>
<h2 id='1-markdowncomcn-简介'>1 Markdown.com.cn 简介</h2>
<ul>
<li>支持自定义样式的 Markdown 编辑器</li>
<li>支持微信公众号、知乎和稀土掘金</li>
<li>点击右上方对应图标，一键复制到各平台</li>

</ul>
<h2 id='2-markdown语法教程'>2 Markdown语法教程</h2>
<h3 id='21-标题'>2.1 标题</h3>
<p>不同数量的<code>#</code>可以完成不同的标题，如下：</p>
<h1 id='一级标题'>一级标题</h1>
<h2 id='二级标题'>二级标题</h2>
<h3 id='三级标题'>三级标题</h3>
<h3 id='22-字体'>2.2 字体</h3>
<p>粗体、斜体、粗体和斜体，删除线，需要在文字前后加不同的标记符号。如下：</p>
<p><strong>这个是粗体</strong></p>
<p><em>这个是斜体</em></p>
<p><em><strong>这个是粗体加斜体</strong></em></p>
<p>~这里想用删除线~~</p>
<p>注：如果想给字体换颜色、字体或者居中显示，需要使用内嵌HTML来实现。</p>
<h3 id='23-无序列表'>2.3 无序列表</h3>
<p>无序列表的使用，在符号<code>-</code>后加空格使用。如下：</p>
<ul>
<li>无序列表 1</li>
<li>无序列表 2</li>
<li>无序列表 3</li>

</ul>
<p>如果要控制列表的层级，则需要在符号<code>-</code>前使用空格。如下：</p>
<ul>
<li><p>无序列表 1</p>
</li>
<li><p>无序列表 2</p>
<ul>
<li>无序列表 2.1</li>
<li>无序列表 2.2</li>

</ul>
</li>

</ul>
<p><strong>由于微信原因，最多支持到二级列表</strong>。</p>
<h3 id='24-有序列表'>2.4 有序列表</h3>
<p>有序列表的使用，在数字及符号<code>.</code>后加空格后输入内容，如下：</p>
<ol start='' >
<li>有序列表 1</li>
<li>有序列表 2</li>
<li>有序列表 3</li>

</ol>
<h3 id='25-引用'>2.5 引用</h3>
<p>引用的格式是在符号<code>&gt;</code>后面书写文字。如下：</p>
<blockquote><p>读一本好书，就是在和高尚的人谈话。 ——歌德</p>
</blockquote>
<blockquote><p>雇用制度对工人不利，但工人根本无力摆脱这个制度。 ——阮一峰</p>
</blockquote>
<h3 id='27-链接'>2.7 链接</h3>
<p>微信公众号仅支持公众号文章链接，即域名为<code>https://mp.weixin.qq.com/</code>的合法链接。使用方法如下所示：</p>
<p>对于该论述，欢迎读者查阅之前发过的文章，<a href='https://mp.weixin.qq.com/s/s5IhxV2ooX3JN_X416nidA'>你是《未来世界的幸存者》么？</a>
<a id="jump_8"></a></p>
<h3 id='28-图片'>2.8 图片</h3>
<p>插入图片，格式如下：</p>
<p><img src="https://www.nginx.cn/wp-content/uploads/2020/03/qrcode_for_gh_82cf87d482f0_258.jpg" referrerpolicy="no-referrer" alt="这里写图片描述"></p>
<p>支持 jpg、png、gif、svg 等图片格式，<strong>其中 svg 文件仅可在微信公众平台中使用</strong>，svg 文件示例如下：</p>
<p><img src="https://markdown.com.cn/images/i-am-svg.svg" referrerpolicy="no-referrer"></p>
<p>支持图片<strong>拖拽和截图粘贴</strong>到编辑器中。</p>
<p>注：支持图片 <em><strong>拖拽和截图粘贴</strong></em> 到编辑器中，仅支持 https 的图片，图片粘贴到微信时会自动上传微信服务器。</p>
<h3 id='29-分割线'>2.9 分割线</h3>
<p>可以在一行中用三个以上的减号来建立一个分隔线，同时需要在分隔线的上面空一行。如下：</p>
<hr />
<h3 id='210-表格'>2.10 表格</h3>
<p>可以使用冒号来定义表格的对齐方式，如下：</p>
<figure class='table-figure'><table>
<thead>
<tr><th style='text-align:left;' >姓名</th><th style='text-align:center;' >年龄</th><th style='text-align:right;' >工作</th></tr></thead>
<tbody><tr><td style='text-align:left;' >小可爱</td><td style='text-align:center;' >18</td><td style='text-align:right;' >吃可爱多</td></tr><tr><td style='text-align:left;' >小小勇敢</td><td style='text-align:center;' >20</td><td style='text-align:right;' >爬棵勇敢树</td></tr><tr><td style='text-align:left;' >小小小机智</td><td style='text-align:center;' >22</td><td style='text-align:right;' >看一本机智书</td></tr></tbody>
</table></figure>
<p>&nbsp;</p>
<h2 id='3-特殊语法'>3. 特殊语法</h2>
<h3 id='31-脚注'>3.1 脚注</h3>
<blockquote><p>支持平台：微信公众号、知乎。</p>
</blockquote>
<p>脚注与链接的区别如下所示：</p>
<pre><code class='language-markdown' lang='markdown'>链接：[文字](链接)
脚注：[文字](脚注解释 &quot;脚注名字&quot;)
</code></pre>
<p>有人认为在<a href='https://en.wikipedia.org/wiki/Front-end_web_development' title='Front-end web development'>大前端时代</a>的背景下，移动端开发（Android、IOS）将逐步退出历史舞台。</p>
<p><a href='是指掌握多种技能，并能利用多种技能独立完成产品的人。' title='什么是全栈工程师'>全栈工程师</a>在业务开发流程中起到了至关重要的作用。</p>
<p>脚注内容请拉到最下面观看。</p>
<h3 id='32-代码块'>3.2 代码块</h3>
<blockquote><p>支持平台：微信代码主题仅支持微信公众号！其他主题无限制。</p>
</blockquote>
<p>如果在一个行内需要引用代码，只要用反引号引起来就好，如下：</p>
<p>Use the <code>printf()</code> function.</p>
<p>在需要高亮的代码块的前一行及后一行使用三个反引号，同时<strong>第一行反引号后面表示代码块所使用的语言</strong>，如下：</p>
<pre><code class='language-java' lang='java'>// FileName: HelloWorld.java
public class HelloWorld {
  // Java 入口程序，程序从此入口
  public static void main(String[] args) {
    System.out.println(&quot;Hello,World!&quot;); // 向控制台打印一条语句
  }
}
</code></pre>
<p>支持以下语言种类：</p>
<pre><code>bash
clojure，cpp，cs，css
dart，dockerfile, diff
erlang
go，gradle，groovy
haskell
java，javascript，json，julia
kotlin
lisp，lua
makefile，markdown，matlab
objectivec
perl，php，python
r，ruby，rust
scala，shell，sql，swift
tex，typescript
verilog，vhdl
xml
yaml
</code></pre>
<p>如果想要更换代码高亮样式，可在上方<strong>代码主题</strong>中挑选。</p>
<p>其中<strong>微信代码主题与微信官方一致</strong>，有以下注意事项：</p>
<ul>
<li>带行号且不换行，代码大小与官方一致</li>
<li>需要在代码块处标志语言，否则无法高亮</li>
<li>粘贴到公众号后，用鼠标点代码块内外一次，完成高亮</li>

</ul>
<p>diff 不能同时和其他语言的高亮同时显示，且需要调整代码主题为微信代码主题以外的代码主题才能看到 diff 效果，使用效果如下:</p>
<pre><code class='language-diff' lang='diff'>+ 新增项
- 删除项
</code></pre>
<p><strong>其他主题不带行号，可自定义是否换行，代码大小与当前编辑器一致</strong></p>
<h3 id='33-数学公式'>3.3 数学公式</h3>
<blockquote><p>支持平台：微信公众号、知乎。</p>
</blockquote>
<p>行内公式使用方法，比如这个化学公式：$\ce{Hg^2+ -&gt;[I-] HgI2 -&gt;[I-] [Hg^{II}I4]^2-}$</p>
<p>块公式使用方法如下：</p>
<p>$$H(D_2) = -\left(\frac{2}{4}\log_2 \frac{2}{4} + \frac{2}{4}\log_2 \frac{2}{4}\right) = 1$$</p>
<p>矩阵：</p>
<div contenteditable="false" spellcheck="false" class="mathjax-block md-end-block md-math-block md-rawblock" id="mathjax-n135" cid="n135" mdtype="math_block" data-math-tag-before="0" data-math-tag-after="0" data-math-labels="[]"><div class="md-rawblock-container md-math-container" tabindex="-1"><mjx-container class="MathJax" jax="SVG" display="true" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="25.408ex" height="14.294ex" role="img" focusable="false" viewBox="0 -3409 11230.5 6318" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -6.581ex;" class=""><defs><path id="MJX-1-TEX-S4-239B" d="M837 1154Q843 1148 843 1145Q843 1141 818 1106T753 1002T667 841T574 604T494 299Q417 -84 417 -609Q417 -641 416 -647T411 -654Q409 -655 366 -655Q299 -655 297 -654Q292 -652 292 -643T291 -583Q293 -400 304 -242T347 110T432 470T574 813T785 1136Q787 1139 790 1142T794 1147T796 1150T799 1152T802 1153T807 1154T813 1154H819H837Z"></path><path id="MJX-1-TEX-S4-239D" d="M843 -635Q843 -638 837 -644H820Q801 -644 800 -643Q792 -635 785 -626Q684 -503 605 -363T473 -75T385 216T330 518T302 809T291 1093Q291 1144 291 1153T296 1164Q298 1165 366 1165Q409 1165 411 1164Q415 1163 416 1157T417 1119Q417 529 517 109T833 -617Q843 -631 843 -635Z"></path><path id="MJX-1-TEX-S4-239C" d="M413 -9Q412 -9 407 -9T388 -10T354 -10Q300 -10 297 -9Q294 -8 293 -5Q291 5 291 127V300Q291 602 292 605L296 609Q298 610 366 610Q382 610 392 610T407 610T412 609Q416 609 416 592T417 473V127Q417 -9 413 -9Z"></path><path id="MJX-1-TEX-N-31" d="M213 578L200 573Q186 568 160 563T102 556H83V602H102Q149 604 189 617T245 641T273 663Q275 666 285 666Q294 666 302 660V361L303 61Q310 54 315 52T339 48T401 46H427V0H416Q395 3 257 3Q121 3 100 0H88V46H114Q136 46 152 46T177 47T193 50T201 52T207 57T213 61V578Z"></path><path id="MJX-1-TEX-I-1D44E" d="M33 157Q33 258 109 349T280 441Q331 441 370 392Q386 422 416 422Q429 422 439 414T449 394Q449 381 412 234T374 68Q374 43 381 35T402 26Q411 27 422 35Q443 55 463 131Q469 151 473 152Q475 153 483 153H487Q506 153 506 144Q506 138 501 117T481 63T449 13Q436 0 417 -8Q409 -10 393 -10Q359 -10 336 5T306 36L300 51Q299 52 296 50Q294 48 292 46Q233 -10 172 -10Q117 -10 75 30T33 157ZM351 328Q351 334 346 350T323 385T277 405Q242 405 210 374T160 293Q131 214 119 129Q119 126 119 118T118 106Q118 61 136 44T179 26Q217 26 254 59T298 110Q300 114 325 217T351 328Z"></path><path id="MJX-1-TEX-N-32" d="M109 429Q82 429 66 447T50 491Q50 562 103 614T235 666Q326 666 387 610T449 465Q449 422 429 383T381 315T301 241Q265 210 201 149L142 93L218 92Q375 92 385 97Q392 99 409 186V189H449V186Q448 183 436 95T421 3V0H50V19V31Q50 38 56 46T86 81Q115 113 136 137Q145 147 170 174T204 211T233 244T261 278T284 308T305 340T320 369T333 401T340 431T343 464Q343 527 309 573T212 619Q179 619 154 602T119 569T109 550Q109 549 114 549Q132 549 151 535T170 489Q170 464 154 447T109 429Z"></path><path id="MJX-1-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path><path id="MJX-1-TEX-I-1D45B" d="M21 287Q22 293 24 303T36 341T56 388T89 425T135 442Q171 442 195 424T225 390T231 369Q231 367 232 367L243 378Q304 442 382 442Q436 442 469 415T503 336T465 179T427 52Q427 26 444 26Q450 26 453 27Q482 32 505 65T540 145Q542 153 560 153Q580 153 580 145Q580 144 576 130Q568 101 554 73T508 17T439 -10Q392 -10 371 17T350 73Q350 92 386 193T423 345Q423 404 379 404H374Q288 404 229 303L222 291L189 157Q156 26 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 112 180T152 343Q153 348 153 366Q153 405 129 405Q91 405 66 305Q60 285 60 284Q58 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-1-TEX-N-22EE" d="M78 30Q78 54 95 72T138 90Q162 90 180 74T199 31Q199 6 182 -12T139 -30T96 -13T78 30ZM78 440Q78 464 95 482T138 500Q162 500 180 484T199 441Q199 416 182 398T139 380T96 397T78 440ZM78 840Q78 864 95 882T138 900Q162 900 180 884T199 841Q199 816 182 798T139 780T96 797T78 840Z"></path><path id="MJX-1-TEX-N-22F1" d="M133 760Q133 784 150 802T193 820Q217 820 235 804T254 761Q254 736 237 718T194 700T151 717T133 760ZM580 460Q580 484 597 502T640 520Q664 520 682 504T701 461Q701 436 684 418T641 400T598 417T580 460ZM1027 160Q1027 184 1044 202T1087 220Q1111 220 1129 204T1148 161Q1148 136 1131 118T1088 100T1045 117T1027 160Z"></path><path id="MJX-1-TEX-I-1D45A" d="M21 287Q22 293 24 303T36 341T56 388T88 425T132 442T175 435T205 417T221 395T229 376L231 369Q231 367 232 367L243 378Q303 442 384 442Q401 442 415 440T441 433T460 423T475 411T485 398T493 385T497 373T500 364T502 357L510 367Q573 442 659 442Q713 442 746 415T780 336Q780 285 742 178T704 50Q705 36 709 31T724 26Q752 26 776 56T815 138Q818 149 821 151T837 153Q857 153 857 145Q857 144 853 130Q845 101 831 73T785 17T716 -10Q669 -10 648 17T627 73Q627 92 663 193T700 345Q700 404 656 404H651Q565 404 506 303L499 291L466 157Q433 26 428 16Q415 -11 385 -11Q372 -11 364 -4T353 8T350 18Q350 29 384 161L420 307Q423 322 423 345Q423 404 379 404H374Q288 404 229 303L222 291L189 157Q156 26 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 112 181Q151 335 151 342Q154 357 154 369Q154 405 129 405Q107 405 92 377T69 316T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-1-TEX-S4-239E" d="M31 1143Q31 1154 49 1154H59Q72 1154 75 1152T89 1136Q190 1013 269 873T401 585T489 294T544 -8T572 -299T583 -583Q583 -634 583 -643T577 -654Q575 -655 508 -655Q465 -655 463 -654Q459 -653 458 -647T457 -609Q457 -58 371 340T100 1037Q87 1059 61 1098T31 1143Z"></path><path id="MJX-1-TEX-S4-23A0" d="M56 -644H50Q31 -644 31 -635Q31 -632 37 -622Q69 -579 100 -527Q286 -228 371 170T457 1119Q457 1161 462 1164Q464 1165 520 1165Q575 1165 577 1164Q582 1162 582 1153T583 1093Q581 910 570 752T527 400T442 40T300 -303T89 -626Q78 -640 75 -642T61 -644H56Z"></path><path id="MJX-1-TEX-S4-239F" d="M579 -9Q578 -9 573 -9T554 -10T520 -10Q466 -10 463 -9Q460 -8 459 -5Q457 5 457 127V300Q457 602 458 605L462 609Q464 610 532 610Q548 610 558 610T573 610T578 609Q582 609 582 592T583 473V127Q583 -9 579 -9Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mrow"><g data-mml-node="mo"><use data-c="239B" xlink:href="#MJX-1-TEX-S4-239B" transform="translate(0,2255)"></use><use data-c="239D" xlink:href="#MJX-1-TEX-S4-239D" transform="translate(0,-2265)"></use><svg width="875" height="2900" y="-1200" x="0" viewBox="0 654.8 875 2900" class=""><use data-c="239C" xlink:href="#MJX-1-TEX-S4-239C" transform="scale(1,7.016)"></use></svg></g><g data-mml-node="mtable" transform="translate(875,0)"><g data-mml-node="mtr" transform="translate(0,2575.1)"><g data-mml-node="mtd"><g data-mml-node="mn"><use data-c="31" xlink:href="#MJX-1-TEX-N-31"></use></g></g><g data-mml-node="mtd" transform="translate(1633.6,0)"><g data-mml-node="msub"><g data-mml-node="mi"><use data-c="1D44E" xlink:href="#MJX-1-TEX-I-1D44E"></use></g><g data-mml-node="mn" transform="translate(562,-150) scale(0.707)"><use data-c="31" xlink:href="#MJX-1-TEX-N-31"></use></g></g></g><g data-mml-node="mtd" transform="translate(3866.5,0)"><g data-mml-node="msubsup"><g data-mml-node="mi"><use data-c="1D44E" xlink:href="#MJX-1-TEX-I-1D44E"></use></g><g data-mml-node="mn" transform="translate(562,363) scale(0.707)"><use data-c="32" xlink:href="#MJX-1-TEX-N-32"></use></g><g data-mml-node="mn" transform="translate(562,-287.9) scale(0.707)"><use data-c="31" xlink:href="#MJX-1-TEX-N-31"></use></g></g></g><g data-mml-node="mtd" transform="translate(6020.7,0)"><g data-mml-node="mo"><use data-c="22EF" xlink:href="#MJX-1-TEX-N-22EF"></use></g></g><g data-mml-node="mtd" transform="translate(8346,0)"><g data-mml-node="msubsup"><g data-mml-node="mi"><use data-c="1D44E" xlink:href="#MJX-1-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(562,363) scale(0.707)"><use data-c="1D45B" xlink:href="#MJX-1-TEX-I-1D45B"></use></g><g data-mml-node="mn" transform="translate(562,-295.7) scale(0.707)"><use data-c="31" xlink:href="#MJX-1-TEX-N-31"></use></g></g></g></g><g data-mml-node="mtr" transform="translate(0,1045.4)"><g data-mml-node="mtd"><g data-mml-node="mn"><use data-c="31" xlink:href="#MJX-1-TEX-N-31"></use></g></g><g data-mml-node="mtd" transform="translate(1633.6,0)"><g data-mml-node="msub"><g data-mml-node="mi"><use data-c="1D44E" xlink:href="#MJX-1-TEX-I-1D44E"></use></g><g data-mml-node="mn" transform="translate(562,-150) scale(0.707)"><use data-c="32" xlink:href="#MJX-1-TEX-N-32"></use></g></g></g><g data-mml-node="mtd" transform="translate(3866.5,0)"><g data-mml-node="msubsup"><g data-mml-node="mi"><use data-c="1D44E" xlink:href="#MJX-1-TEX-I-1D44E"></use></g><g data-mml-node="mn" transform="translate(562,363) scale(0.707)"><use data-c="32" xlink:href="#MJX-1-TEX-N-32"></use></g><g data-mml-node="mn" transform="translate(562,-287.9) scale(0.707)"><use data-c="32" xlink:href="#MJX-1-TEX-N-32"></use></g></g></g><g data-mml-node="mtd" transform="translate(6020.7,0)"><g data-mml-node="mo"><use data-c="22EF" xlink:href="#MJX-1-TEX-N-22EF"></use></g></g><g data-mml-node="mtd" transform="translate(8346,0)"><g data-mml-node="msubsup"><g data-mml-node="mi"><use data-c="1D44E" xlink:href="#MJX-1-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(562,363) scale(0.707)"><use data-c="1D45B" xlink:href="#MJX-1-TEX-I-1D45B"></use></g><g data-mml-node="mn" transform="translate(562,-295.7) scale(0.707)"><use data-c="32" xlink:href="#MJX-1-TEX-N-32"></use></g></g></g></g><g data-mml-node="mtr" transform="translate(0,-1170.3)"><g data-mml-node="mtd" transform="translate(111,0)"><g data-mml-node="TeXAtom" data-mjx-texclass="ORD"><g data-mml-node="mo"><use data-c="22EE" xlink:href="#MJX-1-TEX-N-22EE"></use></g></g></g><g data-mml-node="mtd" transform="translate(1977.4,0)"><g data-mml-node="TeXAtom" data-mjx-texclass="ORD"><g data-mml-node="mo"><use data-c="22EE" xlink:href="#MJX-1-TEX-N-22EE"></use></g></g></g><g data-mml-node="mtd" transform="translate(4210.3,0)"><g data-mml-node="TeXAtom" data-mjx-texclass="ORD"><g data-mml-node="mo"><use data-c="22EE" xlink:href="#MJX-1-TEX-N-22EE"></use></g></g></g><g data-mml-node="mtd" transform="translate(5965.7,0)"><g data-mml-node="mo"><use data-c="22F1" xlink:href="#MJX-1-TEX-N-22F1"></use></g></g><g data-mml-node="mtd" transform="translate(8725.1,0)"><g data-mml-node="TeXAtom" data-mjx-texclass="ORD"><g data-mml-node="mo"><use data-c="22EE" xlink:href="#MJX-1-TEX-N-22EE"></use></g></g></g></g><g data-mml-node="mtr" transform="translate(0,-2654.2)"><g data-mml-node="mtd"><g data-mml-node="mn"><use data-c="31" xlink:href="#MJX-1-TEX-N-31"></use></g></g><g data-mml-node="mtd" transform="translate(1500,0)"><g data-mml-node="msub"><g data-mml-node="mi"><use data-c="1D44E" xlink:href="#MJX-1-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(562,-150) scale(0.707)"><use data-c="1D45A" xlink:href="#MJX-1-TEX-I-1D45A"></use></g></g></g><g data-mml-node="mtd" transform="translate(3732.8,0)"><g data-mml-node="msubsup"><g data-mml-node="mi"><use data-c="1D44E" xlink:href="#MJX-1-TEX-I-1D44E"></use></g><g data-mml-node="mn" transform="translate(562,363) scale(0.707)"><use data-c="32" xlink:href="#MJX-1-TEX-N-32"></use></g><g data-mml-node="mi" transform="translate(562,-247) scale(0.707)"><use data-c="1D45A" xlink:href="#MJX-1-TEX-I-1D45A"></use></g></g></g><g data-mml-node="mtd" transform="translate(6020.7,0)"><g data-mml-node="mo"><use data-c="22EF" xlink:href="#MJX-1-TEX-N-22EF"></use></g></g><g data-mml-node="mtd" transform="translate(8247.7,0)"><g data-mml-node="msubsup"><g data-mml-node="mi"><use data-c="1D44E" xlink:href="#MJX-1-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(562,363) scale(0.707)"><use data-c="1D45B" xlink:href="#MJX-1-TEX-I-1D45B"></use></g><g data-mml-node="mi" transform="translate(562,-247) scale(0.707)"><use data-c="1D45A" xlink:href="#MJX-1-TEX-I-1D45A"></use></g></g></g></g></g><g data-mml-node="mo" transform="translate(10355.5,0)"><use data-c="239E" xlink:href="#MJX-1-TEX-S4-239E" transform="translate(0,2255)"></use><use data-c="23A0" xlink:href="#MJX-1-TEX-S4-23A0" transform="translate(0,-2265)"></use><svg width="875" height="2900" y="-1200" x="0" viewBox="0 654.8 875 2900" class=""><use data-c="239F" xlink:href="#MJX-1-TEX-S4-239F" transform="scale(1,7.016)"></use></svg></g></g></g></g></svg></mjx-container></div></div>
<p>公式由于微信不支持，目前的解决方案是转成 svg 放到微信中，无需调整，矢量不失真。</p>
<p>目前测试如果公式量过大，在 Chrome 下会存在粘贴后无响应，但是在 Firefox 中始终能够成功。</p>
<h3 id='34-toc'>3.4 TOC</h3>
<blockquote><p>支持平台：微信公众号、知乎。</p>
</blockquote>
<p>TOC 全称为 Table of Content，列出全部标题。</p>
<div>[TOC]</div>
<p>由于微信只支持到二级列表，本工具仅支持二级标题和三级标题的显示。</p>
<h3 id='35-注音符号'>3.5 注音符号</h3>
<blockquote><p>支持平台：微信公众号。</p>
</blockquote>
<p>支持注音符号，用法如下：</p>
<p>Markdown Nice 这么好用，简直是{喜大普奔|hē hē hē hē}呀！</p>
<h3 id='36-横屏滑动幻灯片'>3.6 横屏滑动幻灯片</h3>
<blockquote><p>支持平台：微信公众号。</p>
</blockquote>
<p>通过<code>&lt;![](url),![](url)&gt;</code>这种语法设置横屏滑动滑动片，具体用法如下：</p>
<p><a href='http://![蓝1](https://markdown.com.cn/images/blue.jpg),![绿2](https://markdown.com.cn/images/green.jpg),![红3](https://markdown.com.cn.jpg)' target='_blank' class='url'>![蓝1](https://markdown.com.cn/images/blue.jpg),![绿2](https://markdown.com.cn/images/green.jpg),![红3](https://markdown.com.cn.jpg)</a></p>
<h2 id='4-其他语法'>4 其他语法</h2>
<h3 id='41-html'>4.1 HTML</h3>
<p>支持原生 HTML 语法，请写内联样式，如下：</p>
<p><span style="display:block;text-align:right;color:orangered;">橙色居右</span>
<span style="display:block;text-align:center;color:orangered;">橙色居中</span></p>
<h3 id='42-uml'>4.2 UML</h3>
<p>不支持，推荐使用开源工具<code>https://draw.io/</code>制作后再导入图片</p>
<h2 id='5-致谢'>5 致谢</h2>
<ul>
<li>歌词经理 <a href='https://github.com/lyricat/wechat-format' title='灵感来源'>wechat-fromat</a></li>
<li>颜家大少 <a href='http://md.aclickall.com/' title='MdA2All'>MD2All</a></li>

</ul>
`
  aboutToAppear(): void {
    this.message = new HmdConv().html2md(this.html.trim())
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