for test in *.conllu; do
	train=$(ls -1 *.conllu | grep -v $test | tr '\n' ' ');
	echo $train
	cat $train | ggrep -v '^#[^=]\+$' >$test".train"
	python3 ~/tools/validate.py --lang cnh $test".train"
	exit;
	cp $test $test".test"
	echo "$test $train"
	/Users/bee/udpipe/src/udpipe --train --tokenizer none $test".train.udpipe" < $test".train"
	#udpipe --parse $test".test > $test".output
	#conllu_evaluate.py $test".test $test".output
done
