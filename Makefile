#PID = $(shell ps aux|pgrep '\./goji'| grep -v grep | awk '{print $2}')
PID = $(shell ps aux|pgrep goji)
BLANK = ''

serve:
	make restart
	#fswatch -o . | xargs -n1 -I{}  make restart || make kill
	#fswatch | xargs -n1 -I{}  make restart || make kill
	fswatch |  make restart || make kill

kill:
	#ps aux|grep '\./goji'|grep -v grep| awk '{print $2}' | xargs kill

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
	@echo $(PID)
	@ifeq($(PID),)
		@echo "kuso"
	@endif
