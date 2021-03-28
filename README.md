# dependency-free WER & CER calculator in Python3
* self-contained, zero dependency
* support kaldi ark formated hyp/ref

usage:
```
./compute-wer --ref ref.txt --hyp hyp.txt details.txt 1> summary.txt
```

* ref.txt:
```
EdevDEWdIYQ_0021	 这 支 颜 色 好 不 好 看 你 们 觉 得 好 看 吗 好 卸 吗
EdevDEWdIYQ_0011	 可 以 呀 它 不 会 是 那 种 特 别 特 别 润 的 那 一 种 它 会 干 的 啊 这 支 颜 色 会 干 的 这 支 口 红 也 会 干 的
...
...
```

* hyp.txt:
```
EdevDEWdIYQ_0021	 这 些 人 笑 好 不 好 看 你 们 觉 得 好 看 吗 好 卸 吗
EdevDEWdIYQ_0011	 可 以 啊 它 不 会 是 那 种 特 别 特 别 润 的 那 一 种 它 会 干 的 啊 就 是 颜 色 会 干 的 这 只 孔 也 会 干 的
...
...
```

* summary.txt:
```
%WER 13.23 [ 43 / 325, 8 ins, 7 del, 28 sub ]
%SER 90.00 [ 9 / 10 ]
```

* details.txt:
```
{"uid":EdevDEWdIYQ_0021, "score":-3.0, "ter":16.67, "cor":15, "sub":3, "ins":0, "del":0}
    REF: 这 支 颜 色 好 不 好 看 你 们 觉 得 好 看 吗 好 卸 吗 
    HYP: 这 些 人 笑 好 不 好 看 你 们 觉 得 好 看 吗 好 卸 吗 
   EDIT:    S  S  S                                                                    
{"uid":EdevDEWdIYQ_0011, "score":-6.0, "ter":15.79, "cor":32, "sub":5, "ins":0, "del":1}
    REF: 可 以 呀 它 不 会 是 那 种 特 别 特 别 润 的 那 一 种 它 会 干 的 啊 这 支 颜 色 会 干 的 这 支 口 红 也 会 干 的 
    HYP: 可 以 啊 它 不 会 是 那 种 特 别 特 别 润 的 那 一 种 它 会 干 的 啊 就 是 颜 色 会 干 的 这 只 孔 *  也 会 干 的 
   EDIT:       S                                                              S  S                    S  S  D                  
...
...
```