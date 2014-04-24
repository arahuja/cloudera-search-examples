

## Cloudera Search Examples

### Pubmed Abstract Search

### Pubmed Abstract JSON

### Creating a Solr collection

```sh
solrctl instancedir --generate pubmed

```

```sh
solrctl instancedir --update pubmed pubmed
```

To update the configuration at any point you can do
```sh
solrctl instancedir --create pubmed pubmed
solrctl --solr http://<your-domain-here>:8983/solr collection --create pubmed
```

## Runnning batch indexing on Hadoop

### Setting up a morphline configuration

### Batch Indexing MR Job

```
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

### Basic Cloudera Example