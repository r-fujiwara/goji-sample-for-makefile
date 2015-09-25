serve:
	make restart
	fswatch -o . | xargs -n1 -I{}  make restart || make kill

kill:
	#ps aux|grep '\./goji'|grep -v grep| awk '{print $2}' | xargs kill
	ps aux|grep '\./goji'|grep -v grep| awk '{print $2}' | xargs kill {}

restart:
	make kill
	go build -gc flag "-N -l" goji.go
	./goji
