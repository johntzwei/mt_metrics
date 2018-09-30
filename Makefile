all: dev task-package

export MOSESROOT = /iesl/canvas/jwei/mosesdecoder/

dev:
	mkdir -p dev/
	mkdir -p dev/2016/
	mkdir -p dev/2015/
	wget http://www.computing.dcu.ie/~ygraham/DAseg-wmt-newstest2016.tar.gz -P dev/2016/
	wget http://www.computing.dcu.ie/~ygraham/DAseg-wmt-newstest2015.tar.gz -P dev/2015/
	tar -xvf dev/2016/DAseg-wmt-newstest2016.tar.gz -C dev/2016/
	tar -xvf dev/2015/DAseg-wmt-newstest2015.tar.gz -C dev/2015/


task-package: download-task-package untar-task-package unpack-task-package-data

download-task-package:
	wget http://ufallab.ms.mff.cuni.cz/~bojar/wmt17-metrics-task-package.tgz

untar-task-package: download-task-package
	mkdir -p wmt17-metrics-task-package/
	tar -xvf wmt17-metrics-task-package.tgz -C wmt17-metrics-task-package/

unpack-task-package-data:
	$(MAKE) tokenized -e -C wmt17-metrics-task-package/
