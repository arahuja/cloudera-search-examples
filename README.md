## Cloudera Search Examples

### Pubmed Abstract Search

### Pubmed Abstract JSON

### Creating a Solr collection

To generate sample configuration run the following solrct command.

```sh
solrctl instancedir --generate pubmed-conf
```

Once you've created the sample configuration, you will edit schema.xml to have the appropriate field and field type information.  Additionally you can edit solrconfig to change the default search query field or add additional handlers.

After creating the config, push it to Zookeeper with 

```sh
solrctl instancedir --create pubmed pubmed-conf
```

To update the configuration at any point you can do
```sh
solrctl instancedir --update pubmed pubmed-conf
```

Then you can create a collection associated with that configuration
```sh
solrctl --solr http://<your-domain-here>:8983/solr collection --create pubmed
```

## Runnning batch indexing on Hadoop

### Setting up a morphline configuration

```sh
TODO
```

### Batch Indexing MR Job

```
hadoop jar /opt/cloudera/parcels/CDH/lib/solr/contrib/mr/search-*-job.jar \
org.apache.solr.hadoop.MapReduceIndexerTool 
-D 'mapred.child.java.opts=-Xmx500m' 
--morphline-file pubmed-morphline.conf
--output-dir hdfs://<your-namenode-here>/path/to/output
--verbose 
--go-live 
--zk-host <your-zk-host-here>:2181/solr 
--collection pubmed 
<your-namenode-here>/path/to/input
