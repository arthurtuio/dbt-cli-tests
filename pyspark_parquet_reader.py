from pyspark.sql import SparkSession
spark = SparkSession.builder \
  .master("local") \
  .appName("parquet_example") \
  .getOrCreate()
df = spark.read.parquet('parquet_files/easy_disc_mailing_new_list')
df.printSchema()
# df.show()
