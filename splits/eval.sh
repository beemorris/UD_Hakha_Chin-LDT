FILES=*.conllu
for f in $FILES
do
	echo "Results of $f"
	python ../conll18_ud_eval.py -v $f".test" $f".output" > results/$f".result"
done