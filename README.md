# Zero-Dependency WER & CER calculator for ASR evaluation (Python3)
* self-contained, zero dependency
* support kaldi ark formated hyp/ref

## usage
```
./asr-score --tokenizer whitespace \
    --ref ref.txt \
    --hyp hyp.txt \
    diagnostics.txt
```

`ref.txt`:
```
EdevDEWdIYQ_0021	 这 支 颜 色 好 不 好 看 你 们 觉 得 好 看 吗 好 卸 吗
EdevDEWdIYQ_0011	 可 以 呀 它 不 会 是 那 种 特 别 特 别 润 的 那 一 种 它 会 干 的 啊 这 支 颜 色 会 干 的 这 支 口 红 也 会 干 的
...
...
```

`hyp.txt`:
```
EdevDEWdIYQ_0021	 这 些 人 笑 好 不 好 看 你 们 觉 得 好 看 吗 好 卸 吗
EdevDEWdIYQ_0011	 可 以 啊 它 不 会 是 那 种 特 别 特 别 润 的 那 一 种 它 会 干 的 啊 就 是 颜 色 会 干 的 这 只 孔 也 会 干 的
...
...
```

standard output:
```
{"num_ref_utts": 10, "num_hyp_utts": 10, "num_eval_utts": 10, "num_hyp_without_ref": 0, "C": 290, "S": 28, "I": 8, "D": 7, "token_error_rate": 13.23076923076923, "num_utts_with_error": 9, "sentence_error_rate": 90.0}
%WER 13.23 [ 43 / 325, 8 ins, 7 del, 28 sub ]
%SER 90.00 [ 9 / 10 ]
```
You can parse either `json` or `%WER/SER` lines(compatible with kaldi).

`diagnostics.txt` contains human-friendly alignment details utterance by utterance:
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

## options for ASR result post-processing(preprocessing for WER evaluation)
1. `--normalizer` option, can be omitted(without TN), or `EN`, or `CN`.

    `EN` normalizer applies following steps:
    * convert text to upper case
    * remove `-`, `"`
    * remove non-scoring tags:
        ```
        sclite_conversational_filler = ['UH', 'UHH', 'UM', 'EH', 'MM', 'HM', 'AH', 'HUH', 'HA', 'ER', 'OOF', 'HEE' , 'ACH', 'EEE', 'EW']
        unk_tags = ['<UNK>', '<unk>']
        gigaspeech_punctuations = ['<COMMA>', '<PERIOD>', '<QUESTIONMARK>', '<EXCLAMATIONPOINT>']
        gigaspeech_garbage_utterance_tags = ['<SIL>', '<NOISE>', '<MUSIC>', '<OTHER>']
        ``` 
    
    `CN` normalizer:
    * TODO: integrate https://github.com/speechio/chinese_text_normalization

2. `--tokenizer` option, can be set to `whitespace`(for WER), or `char`(for CER). default is (whitespace)
    * `whitespace` tokenizer gives WER
    * `char` tokenizer gives CER
