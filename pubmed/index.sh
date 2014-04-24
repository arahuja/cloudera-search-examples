#!/usr/bin/sh

hadoop jar /opt/cloudera/parcels/CDH/lib/solr/contrib/mr/search-*-job.jar \
org.apache.solr.hadoop.MapReduceIndexerTool 
-D 'mapred.child.java.opts=-Xmx500m' 
--morphline-file pubmed_morphline.conf
--output-dir hdfs://<your-namenode-here>/path/to/output
--verbose 
--go-live 
--zk-host <your-zk-host-here>:2181/solr 
--collection pubmed 
<your-namenode-here>/path/to/input
