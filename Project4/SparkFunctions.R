library(tidyverse)
library(sparklyr)
library(DBI)

# Collection of useful Spark functions

# Connect to local Spark cluster. Local Spark cluster is ideal for development.
# Return:
#    Spark connection.
Spark.ConnectLocal <- function() {
    sc <- spark_connect(master = "local", version = "3.2.2")
    return (sc)
}

# Connect to Edge node in Spark cluster. See https://therinspark.com/connections.html#connections for details.
# Parameters:
#   master: cluster manager
#   home: 
# Return:
#    Spark connection.
Spark.ConnectEdge <- function(master, home = NULL) {
    sc <- NULL
    if (! is.null(home)) {
        sc <- spark_connect(master = master, spark_home = home)
    }
    else {
        sc <- spark_connect(master = master)
    }
    return (sc)
}

S# Connect to standalone node in Spark cluster. See https://therinspark.com/connections.html#connections for details.
# Parameters:
#   hostname: hostname of standalone cluster.
#   port: port
# Return:
#    Spark connection.
park.ConnectStandalone <- function(hostname, port) {
    sc <- spark_connect(master = paste0("spark://", hostname, ":", port))
    return (sc)
}

# 
# Disconnect from cluster.
# Parameters:
#   sc: Spark connection
#
Spark.Disconnect <- function(sc) {
    spark_disconnect(sc)
}

# 
# Launch Web interface to cluster.
# Parameters:
#   sc: Spark connection
#
Spark.Web <- function(sc) {
    spark_web(sc)
}
