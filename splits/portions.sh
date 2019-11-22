for test in *.conllu; do
	train=$(ls -1 *.conllu | grep -v $test | tr '\n' ' ');
	echo $train
	cat $train | ggrep -v '^#[^=]\+$' | python ../nodouble.py > $test".train"
	python ~/tools/validate.py --lang cnh $test".train"
	exit;
	cp $test $test".test"
	echo "$test $train"
	/Users/bee/udpipe/src/udpipe --train --tokenizer none $test".train.udpipe" < $test".train"
	/Users/bee/udpipe/src/udpipe  --parse $test".test" > $test".output"
	#python ../cconll18_ud_eval > $test".test" $test".output"
	python ../conll18_ud_eval $test".test $test".output
done
