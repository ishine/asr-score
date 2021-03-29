./compute-wer \
    --text-norm en \
    --tokenizer whitespace \
    --ref ref.txt --hyp hyp.txt diagnostics.txt 1> summary.txt
