mkdir -p 2016/
mkdir -p 2015/
wget http://www.computing.dcu.ie/~ygraham/DAseg-wmt-newstest2016.tar.gz -P 2016/
wget http://www.computing.dcu.ie/~ygraham/DAseg-wmt-newstest2015.tar.gz -P 2015/
tar -xvf 2016/DAseg-wmt-newstest2016.tar.gz -C 2016/
tar -xvf 2015/DAseg-wmt-newstest2015.tar.gz -C 2015/
