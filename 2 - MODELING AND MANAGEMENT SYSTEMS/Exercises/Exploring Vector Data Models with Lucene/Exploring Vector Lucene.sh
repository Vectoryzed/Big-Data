cd $HOME/Downloads

wget http://archive.apache.org/dist/lucene/java/5.5.0/lucene-5.5.0.tgz

tar -xvzf lucene-5.5.0.tgz
cd Downloads/big-data-2/vector
./runLuceneQuery.sh data
voters
delegates
voters delegates
voters^5 delegates
./runLuceneTFIDF.sh data
voters
delegates
q