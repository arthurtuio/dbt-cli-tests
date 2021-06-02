from pyspark.sql import SparkSession

spark = SparkSession.builder \
  .master("local") \
  .appName("parquet_example") \
  .getOrCreate()
df = spark.read.parquet('parquet_files/easy_core_contatos_ctrl')
df.printSchema()
# df.show()
