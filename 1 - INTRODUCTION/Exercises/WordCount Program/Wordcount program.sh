hadoop jar /usr/jars/hadoop-examples.jar
hadoop fs -ls
hadoop jar /usr/jars/hadoop-examples.jar wordcount
hadoop jar /usr/jars/hadoop-examples.jar wordcount words.txt out
hadoop fs –ls
hadoop fs -ls out
hadoop fs –copyToLocal out/part-r-00000 local.txt
more local.txt