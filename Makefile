PID = $(shell ps aux|grep '\./goji'|grep -v grep)

serve:
	make restart
	#fswatch -o . | xargs -n1 -I{}  make restart || make kill
	#fswatch | xargs -n1 -I{}  make restart || make kill
	fswatch |  make restart || make kill

kill:
	ps aux|grep '\./goji'|grep -v grep| awk '{print $2}' | xargs kill

restart:
	make kill
	echo "Re-compile"
	go build -gcflags "-N -l" goji.go
	./goji

start:
	echo $(PID)
	go build -gcflags "-N -l" goji.go
	./goji

say:
	echo $(PID)
	ifeq $(PID) ""
		echo "nothing"
	else
		echo "say hoo"
	endif
