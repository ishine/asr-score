compute-wer --mode=present --text=true ark,t:EN_REF.txt ark,t:EN_HYP.txt
../asr-score --ref EN_REF.txt --hyp EN_HYP.txt diagnostics.txt
