import { Text } from 'domhandler'
import { MDNode } from '../node'

export const header = (mdNode: MDNode): (text: string) => string => {
  return (text: string): string => '\n' + `${"#".repeat(parseInt(mdNode.type().slice(-1)))} ${text}`
}

export const paragraph = (mdNode: MDNode): (text: string) => string => {
  return (text: string): string => '\n' + text + '\n'
}

export const root = (mdNode: MDNode): (text: string) => string => {
  return (text: string): string => text
}

export const text = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => (mdNode.html() as Text).data.trim() + text
}

export const deleteLine = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => `~~${text}~~`
}


export const lineBreak = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => '\n' + text
}


export const bold = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => ` **${text.trim()}** `
}

export const italic = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => {
    return ` *${text.trim()}* `
  }
}

