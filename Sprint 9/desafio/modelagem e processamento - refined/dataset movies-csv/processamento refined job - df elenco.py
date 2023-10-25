import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

S3bucket_node1 = glueContext.create_dynamic_frame.from_catalog(
    database="trusted-data-14/10",
    table_name="df_elenco_csv",
    transformation_ctx="S3bucket_node1",
)

ChangeSchema_node1697496659516 = ApplyMapping.apply(
    frame=S3bucket_node1,
    mappings=[
        ("idfilme", "long", "idfilme", "long"),
        ("generoartista", "string", "generoartista", "string"),
        ("nomeartista", "string", "nomeartista", "string"),
    ],
    transformation_ctx="ChangeSchema_node1697496659516",
)

AmazonS3_node1697496869380 = glueContext.write_dynamic_frame.from_options(
    frame=ChangeSchema_node1697496659516,
    connection_type="s3",
    format="glueparquet",
    connection_options={
        "path": "s3://data-lake-daniele/Trusted/2023-10-14/parquet/",
        "partitionKeys": [],
    },
    format_options={"compression": "snappy"},
    transformation_ctx="AmazonS3_node1697496869380",
)

job.commit()
