# A Swift Companion for the Book
This repository is designed as a companion for Peter Shirley’s excellent book, [Ray Tracing in One Weekend](https://in1weekend.blogspot.com/2016/01/ray-tracing-in-one-weekend.html). If you don’t have the book yet, you’ll definitely want to [pick it up on Amazon](https://www.amazon.com/Ray-Tracing-Weekend-Minibooks-Book-ebook/dp/B01B5AODD8?ie=UTF8&camp=1789&creative=9325&creativeASIN=B01B5AODD8&linkCode=as2&linkId=OPNJXXJY2IBCMEGE&redirect=true&ref_=as_li_tl&tag=inonwe09-20).

As a companion, **this codebase contains a step-by-step implementation** of the code from the book in Swift; every chapter in the book has a corresponding branch, and every commit in every branch corresponds to either the Swift translation of a code snippet in the book, an image from the book rendered with the Swift code for visual comparison, or a bug fix found on the book’s site. This was done to help make it obvious how the C++ in the book is translated over to Swift.

> Readers should find it very easy to find the relevant code snippet by searching a chapter’s “diff” (see below) and looking for commits labeled similar to “Code 3.1” (chapter 3, snippet 1).

Out of respect for the author and his intellectual property, I would like to point out that this is merely *an* implementation of the *code*.  Only code and images were reproduced; for the real meat of the book—the explanations—you’ll of course have to buy the book.



## Chapters
- Chapter 1 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch1) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch1)
- Chapter 2 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch2) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch1...ch2)
- Chapter 3 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch3) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch2...ch3)
- Chapter 4 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch4) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch3...ch4)
- Chapter 5 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch5) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch4...ch5)
- Chapter 6 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch6) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch5...ch6)
- Chapter 7 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch7) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch6...ch7)
- Chapter 8 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch8) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch7...ch8)
- Chapter 9 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch9) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch8...ch9)
- Chapter 10 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch10) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch9...ch10)
- Chapter 11 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch11) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch10...ch11)
- Chapter 12 - [branch](https://github.com/mebmichael/InOneWeekendSwift/tree/ch12) | [diff](https://github.com/mebmichael/InOneWeekendSwift/compare/ch11...ch12)

## Swift styling
I tried to follow most common Swift conventions and code styling. There is one minor exception, which I only realized in hindsight: by convention, type names should be camel case beginning with an uppercase letter, and I forgot to make the first letter uppercase. (This is probably because we started with `vec3`, and IMO it looks better lowercase—at the very least, it’s consistent with GLSL’s `vec3`.

I also made the choice to simply some methods and initializers, such that vec3 is initialized as `vec3(0, 0, 0)` instead of the Swift convention of `vec3WithX(0, y: 0, z: 0)`, which seems overly verbose and IMO can sometimes draw a little too much from the style of Cocoa frameworks. So while I tried to stick to Swift conventions for the sake of education purposes, sometimes it felt too clunky and I opted for shorter parameter names (or to omit named parameters entirely). Hopefully this will provide more clarity than confusion.

## Compiling
I compiled the code on Mac OS X with the following command in Terminal:

`swiftc *.swift -o binary -O -whole-module-optimization`

(Make sure all the source code is in the same directory as the one you’re trying to compile from. And be sure to use the optimizations flags!)

## Performance
When you’re doing ray tracing, performance is very important. One of the biggest shocks at first was how much slower the Swift code ran than the C++ code when producing the same image. So I researched and optimized, and then came an even bigger surprise—**the Swift code actually runs ~17% faster** on my machine (late 2013 Retina Macbook Pro, Intel Core i5) than the textbook C++ code (compiled on the same computer with `clang -stdlib=c++ -std=c++11 -o3`).

## Contributions
Contributions would be great! However, because this repo was architected to rely on branch diffing and commit history to help parallel the book, it may be hard to merge in changes without making a confusing commit history. (But if you have ideas on how to fix that, let me know! I’d love to change the type names to uppercase to match the convention.)
