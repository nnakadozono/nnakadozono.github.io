---
layout: post
title:  "Test ChatGPT by ChatGPT"
date:   2023-12-22 23:59:00 +0900
categories: blog
---

ChatGPT (Assistants API)を製品に組み込もうというときは、Assistants APIの性能が製品として耐えうるかをテストするだろう。テストは自動化したい。あるテストケースの、期待する応答が`expectedAnswer`であるときに、Assistants APIの応答が`answer`だった場合、`assertEqual(answer, expectedAnswer)`でテストしたいのだけれども、`answer`も`expectedAnswer`も自然言語なので、一字一句まったく一致する回答は普通得られない。そこで、`answer`と`expectedAnswer`が、意味的にEqualかどうかということを判定する必要があるのだけれども、これをChatGPTに判定してもらえばいいじゃないかと思った。このアイデアは既出だろうか。`assertSameMeaning(answer, expectedAnswer)`的な。
 

 
 
