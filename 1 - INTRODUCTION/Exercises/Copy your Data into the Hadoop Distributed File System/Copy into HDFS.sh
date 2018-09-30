cd Downloads
ls
hadoop fs –copyFromLocal words.txt
hadoop fs –ls to
hadoop fs -cp words.txt words2.txt
hadoop fs -ls
hadoop fs -copyToLocal words2.txt
ls
hadoop fs -rm words2.txt
hadoop fs -ls