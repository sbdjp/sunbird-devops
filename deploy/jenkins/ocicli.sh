#!/bin/bash
wget https://objectstorage.us-ashburn-1.oraclecloud.com/p/Zmq9G_F8c1WrdBbExvTzrC0AXmBJPyT8YUGsMWPWHzU9QRXCC8BpszDUSqcGGYMV/n/apaccpt03/b/sunbird-oci/o/ocicli.tar.gz
sudo tar xzf ocicli.tar.gz -C /usr/local/bin
sudo ln -s /usr/local/bin/oci/oci /usr/bin/oci
rm ocicli.tar.gz
