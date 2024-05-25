
import { HTMLParser } from './parser'

export class HmdConv {
  html2md(input: string): string {
    const html = new HTMLParser(input)
    return html.getMdText()
  }
}

export * from './parser'