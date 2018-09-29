all: task-package

download-task-package:
	wget http://ufallab.ms.mff.cuni.cz/~bojar/wmt17-metrics-task-package.tgz

untar-task-package: download-task-package
	mkdir -p wmt17-metrics-task-package/
	tar -xvf wmt17-metrics-task-package.tgz -C wmt17-metrics-task-package/
