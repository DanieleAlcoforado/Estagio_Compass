import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
import gs_array_to_cols
import gs_split

args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

S3bucket_node1 = glueContext.create_dynamic_frame.from_catalog(
    database="trusted-data-14/10",
    table_name="df_crime_trusted_csv",
    transformation_ctx="S3bucket_node1",
)

SplitString_node1697536141668 = S3bucket_node1.gs_split(colName="genero", pattern="','")

ArrayToColumns_node1697536351325 = SplitString_node1697536141668.gs_array_to_cols(
    colName="genero", colList="gen1,gen2,gen3,gen4"
)

trustedcrime_node1697536472659 = glueContext.write_dynamic_frame.from_options(
    frame=ArrayToColumns_node1697536351325,
    connection_type="s3",
    format="glueparquet",
    connection_options={
        "path": "s3://data-lake-daniele/Trusted/2023-10-14/parquet/",
        "partitionKeys": [],
    },
    format_options={"compression": "snappy"},
    transformation_ctx="trustedcrime_node1697536472659",
)

job.commit()
