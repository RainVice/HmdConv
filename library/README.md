# image-preview

## 简介

image-preview 提供图片预览组件，支持旋转，缩放和平移，提供一些自定义属性

## 下载安装

`ohpm install @rv/@rv/hmd-conv`

## 权限

无需权限

## 使用方式
```typescript
const md = new HmdConv().html2md("html")
```
目前支持的 html to markdown 的语法都是根据网站 [Markdown官方教程](https://markdown.com.cn/)中对应而来的，且有几项暂未支持：
- 转义字符与内嵌HTML
- 脚注
- 使用 Emoji 表情
- 自动网址链接

除了不支持的部分，还有不同语法标识同一功能的状况，这里也未做细分，如： 粗体可以使用 `**` 或 `——`，而我只实现了 `**`，在后续的更新中将会加上可选项
如有不兼容的地方，可以提交 [Issuse](https://gitee.com/MUYS/hmd-conv/issues) ，带上你的 `html` 源码和生成的 `md` 文本

## tip
建议配合三方库 [@hcs/biu-markdown](https://ohpm.openharmony.cn/#/cn/detail/@hcs%2Fbiu-markdown) 一起使用，界面会更美观
![配合 biu-markdown](.\img.png)