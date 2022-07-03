dnf install -y @postgresql:12 glibc-langpack-en
echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf
echo "host all all 0.0.0.0/0 trust" >> /var/lib/pgsql/data/pg_hba.conf
systemctl enable postgresql
