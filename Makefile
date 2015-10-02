#PID = $(shell ps aux|pgrep '\./goji'| grep -v grep | awk '{print $2}')
PID=$(shell ps aux|pgrep goji)
BLANK="hoge"

serve:
ifdef $(PID)
	make start
else
	#tashiro -f sample_path.yaml | xargs -n1 -I{}  make restart || make kill
	#ruby watch.rb | xargs -n1 -I{}  make restart || make kill
	ruby watch.rb | xargs -n1 -I{}  make restart
	#ruby watch.rb
endif
	#make restart
	#fswatch -o . | xargs -n1 -I{}  make restart || make kill
	#tashiro -f sample_path.yaml | xargs -n1 -I{}  make restart || make kill
	#fswatch | make restart || make kill

kill:
	#ps aux|grep '\./goji'|grep -v grep| awk '{print $3}' | xargs kill

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
ifdef $(BLANK)
	echo "empty"
else
	@echo "fuga"
endif
