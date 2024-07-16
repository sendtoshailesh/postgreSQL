Install the PostgreSQL client. On Amazon Linux 2023, you can use the following commands to download the psql command line tool:
# Install the needed packages to build the client libraries from source
sudo yum install -y gcc readline-devel libicu-devel zlib-devel openssl-devel

# Download the source, you can browse the source code for other PostgreSQL versions (e.g. 16.1 or 16.2)
wget https://ftp.postgresql.org/pub/source/v16.3/postgresql-16.3.tar.gz  # PostgreSQL 16.3
tar -xvzf postgresql-16.3.tar.gz

cd postgresql-16.3

# Set bin dir so that executables are put in /usr/bin where psql and the others are installed by RPM
./configure --bindir=/usr/bin --with-openssl

sudo make -C src/bin install
sudo make -C src/include install
sudo make -C src/interfaces install

