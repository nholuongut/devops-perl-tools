# Linux, Web, Anonymizer, SQL ReCaser, Hadoop, Hive, Solr, Big Data & NoSQL Tools

![](https://i.imgur.com/waxVImv.png)
### [View all Roadmaps](https://github.com/nholuongut/all-roadmaps) &nbsp;&middot;&nbsp; [Best Practices](https://github.com/nholuongut/all-roadmaps/blob/main/public/best-practices/) &nbsp;&middot;&nbsp; [Questions](https://www.linkedin.com/in/nholuong/)
<br/>

DevOps, Linux, SQL, Web, Big Data, NoSQL, templates for various programming languages and Kubernetes. All programs have
`--help`.

**Make sure you run `make update` if updating and not just `git pull` as you will often need the latest library
submodule and possibly new upstream libraries**

## Quick Start

### Ready to run Docker image

All programs and their pre-compiled dependencies can be found ready to run on
[DockerHub](https://hub.docker.com/r/nholuongut/tools/).

List all programs:

```bash
docker run nholuongut/perl-tools
```

Run any given program:

```bash
docker run nholuongut/perl-tools <program> <args>
```

### Automated Build from source

installs git, make, pulls the repo and build the dependencies:

```bash
curl -L https://git.io/perl-bootstrap | sh
```

or manually

```bash
git clone https://github.com/nholuongut/devops-perl-tools perl-tools
cd perl-tools
make
```

Make sure to read
[Detailed Build Instructions](https://github.com/nholuongut/devops-perl-tools#detailed-build-instructions)
further down for more information.

#### Optional: Generate self-contained Perl scripts with all dependencies built in to each file for easy distribution

After the `make` build has finished, if you want to make self-contained versions of all the perl scripts with all
dependencies included for copying around, run:

```bash
make fatpacks
```

The self-contained scripts will be available in the `fatpacks/` directory which is also tarred to `fatpacks.tar.gz`.

### Usage

All programs come with a `--help` switch which includes a program description and the list of command line options.

Environment variables are supported for convenience and also to hide credentials from being exposed in the process list
eg. `$PASSWORD`. These are indicated in the `--help` descriptions in brackets next to each option and often have more
specific overrides with higher precedence eg. `$SOLR_HOST` takes priority over `$HOST`.

### DevOps Perl Tools - Inventory

**NOTE: Hadoop HDFS API Tools, Pig => Elasticsearch/Solr, Pig Jython UDFs and authenticated PySpark IPython Notebook
have moved to my [DevOps Python Tools](https://github.com/nholuongut/DevOps-Python-tools) repo**

#### Linux

- `anonymize.pl` - anonymizes your configs / logs from files or stdin (for pasting to Apache Jira tickets or mailing
- lists)
  - anonymizes:
    - hostnames / domains / FQDNs
    - email addresses
    - IP + MAC addresses
    - Kerberos principals
    - [Cisco](https://www.cisco.com) &
      [Juniper](https://www.juniper.net) [ScreenOS](https://www.juniper.net/documentation/product/en_US/screenos)
      configurations passwords, shared keys and SNMP strings
  - `anonymize_custom.conf` - put regex of your Name/Company/Project/Database/Tables to anonymize to `<custom>`
    placeholder tokens indicate what was stripped out (eg. `<fqdn>`, `<password>`, `<custom>`)
  - `--ip-prefix` leaves the last IP octect to aid in cluster debugging to still see differentiated nodes communicating
    with each other to compare configs and log communications
- `diffnet.pl` - simplifies diff output to show only lines added/removed, not moved, from patch files or stdin (pipe
  from standard `diff` or `git diff` commands)
- `xml_diff.pl` / `hadoop_config_diff.pl` - tool to help find differences between XML / Hadoop configs, can diff XML
  from HTTP addresses to diff live running clusters
- `titlecase.pl` - capitalizes the first letter of each input word in files or stdin
- `pdf_to_txt.pl` - converts PDF to text for analytics (see also [Apache PDFBox](https://pdfbox.apache.org/) and
  pdf2text unix tool)
- `java_show_classpath.pl` - shows Java classpaths, one per line, of currently running Java programs
- `flock.pl` - file locking to prevent running the same program twice at the same time. RHEL 6 now has a native version
  of this
- `uniq_order_preserved.pl` - like `uniq` but you don't have to sort first and it preserves the ordering
- `colors.pl` - prints ASCII color code matrix of all foreground + background combinations showing the corresponding
  terminal escape codes to help with tuning your shell
- `matrix.pl` - prints a cool matrix of vertical scrolling characters using terminal tricks
- `welcome.pl` - cool spinning welcome message greeting your username and showing last login time and user to put in
  your shell's `.profile` (there is also a python version in my
  [DevOps Python Tools](https://github.com/nholuongut/DevOps-Python-tools) repo)

#### SQL

Written to help clean up docs and SQL scripts.

I don't even bother writing capitalised SQL code any more I
just run it through this via a vim shortcut
([.vimrc](https://github.com/nholuongut/DevOps-Bash-tools/blob/master/configs/.vimrc)).

- `sqlcase.pl` - capitalizes [SQL](https://en.wikipedia.org/wiki/SQL) code in files or stdin:
  - `*case.pl` - more specific language support for just about every database and SQL-like language out there plus a few
    more non-SQL languages like [Neo4j](https://neo4j.com) [Cypher](https://neo4j.com/developer/cypher-query-language/)
    and [Docker](https://www.docker.com)'s [Dockerfiles](https://docs.docker.com/engine/reference/builder/):
    - `athenacase.pl` - [AWS Athena](https://aws.amazon.com/athena/) SQL
    - `cqlcase.pl` - [Cassandra](http://cassandra.apache.org/) [CQL](http://cassandra.apache.org/doc/latest/cql/)
    - `cyphercase.pl` - [Neo4j](https://neo4j.com) [Cypher](https://neo4j.com/developer/cypher-query-language/)
    - `dockercase.pl` - [Docker](https://www.docker.com) ([Dockerfiles](https://docs.docker.com/engine/reference/builder/))
    - `drillcase.pl` - [Apache Drill](https://drill.apache.org/) SQL
    - `hivecase.pl` - [Hive](https://hive.apache.org) [HQL](https://cwiki.apache.org/confluence/display/Hive/LanguageManual)
    - `impalacase.pl` - [Impala](https://impala.apache.org) SQL
    - `influxcase.pl` - [InfluxDB](https://www.influxdata.com) [InfluxQL](https://docs.influxdata.com/influxdb/v1.7/query_language/spec/)
    - `mssqlcase.pl` - [Microsoft SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server) SQL
    - `mysqlcase.pl` - [MySQL](https://www.mysql.com) SQL
    - `n1qlcase.pl` - [Couchbase](https://www.couchbase.com/) [N1QL](https://www.couchbase.com/products/n1ql)
    - `oraclecase.pl` / `plsqlcase.pl` - [Oracle](https://www.oracle.com/uk/index.html) SQL
    - `postgrescase.pl` / `pgsqlcase.pl` - [PostgreSQL](https://www.postgresql.org) SQL
    - `pigcase.pl` - [Pig](https://pig.apache.org) [Latin](https://pig.apache.org/docs/r0.17.0/basic.html)
    - `prestocase.pl` - [Presto](https://prestosql.io/) SQL
    - `redshiftcase..pl` - [AWS Redshift](https://aws.amazon.com/redshift/) SQL
    - `snowflakecase..pl` - [Snowflake](https://www.snowflake.com) SQL

#### Web

- `watch_url.pl` - watches a given url, outputting status code and optionally selected output
  - Useful for debugging web farms behind load balancers and seeing the distribution to different servers
  - Tip: set a /hostname handler to return which server you're hitting for each request in real-time
  - I also use this a ping replacement to google.com to check
  internet networking in environments where everything except HTTP traffic is blocked
- `watch_nginx_stats.pl` - watches nginx stats via the `HttpStubStatusModule` module

#### Solr

- `solr_cli.pl` - [Solr](https://lucene.apache.org/solr/) CLI tool for fast and easy
  [Solr](https://lucene.apache.org/solr/) / [SolrCloud](https://lucene.apache.org/solr/guide/6_6/solrcloud.html)
  administration. Supports optional environment variables to minimize --switches (can be set permanently in
  `solr/solr-env.sh`). Uses the Solr Cores and Collections APIs, makes Solr administration a lot easier

#### Hadoop Ecosystem

- `ambari_freeipa_kerberos_setup.pl` - Automates Hadoop [Ambari](https://ambari.apache.org/) cluster security Kerberos
  setup of [FreeIPA](https://www.freeipa.org/page/Main_Page) principals and keytab distribution to the cluster nodes
- `hadoop_hdfs_file_age_out.pl` - prints or removes all [Hadoop HDFS](https://hadoop.apache.org/) files in a given
  directory tree older than a specified age
- `hadoop_hdfs_snapshot_age_out.pl` - prints or removes [Hadoop HDFS](https://hadoop.apache.org/) snapshots older than a
  given age or matching a given regex pattern
- `hbase_flush_tables.sh` - flushes all or selected [HBase](https://hbase.apache.org/) tables (useful when bulk loading
  [OpenTSDB](http://opentsdb.net/) with Durability.SKIP_WAL) (there is also a Python version of this in my
  [DevOps Python Tools](https://github.com/nholuongut/DevOps-Python-tools) repo)
- `hive_to_elasticsearch.pl` - bulk indexes structured [Hive](https://hive.apache.org/) tables in
  [Hadoop](https://hadoop.apache.org/) to [Elasticsearch](https://www.elastic.co/) clusters - includes support for
  Kerberos, Hive partitioned tables with selected partitions, selected columns, index creation with configurable
  sharding, index aliasing and optimization
- `hive_table_print_null_columns.pl` - finds [Hive](https://hive.apache.org/) columns with all NULLs (see newer versions
  in [DevOps Python tools](https://github.com/nholuongut/DevOps-Python-tools) repo for [HiveServer2](https://cwiki.apache.org/confluence/display/Hive/HiveServer2+Overview) and [Impala](https://impala.apache.org/))
- `hive_table_count_rows_with_nulls.pl` - counts number of rows containing NULLs in any field
- `pentaho_backup.pl` - script to back up the local [Pentaho](https://marketplace.hitachivantara.com/pentaho/) BA or DI
  Server
- `ibm_bigsheets_config_git.pl` - revision controls
  [IBM BigSheets](https://www.ibm.com/support/knowledgecenter/SSPT3X_3.0.0/com.ibm.swg.im.infosphere.biginsights.analyze.doc/doc/c0057518.html)
  configurations from API to Git
- `datameer_config_git.pl` - revision controls [Datameer](https://www.datameer.com/) configurations from API to Git
- `hadoop_config_diff.pl` - tool to diff configs between [Hadoop](https://hadoop.apache.org/) clusters XML from files or
  live HTTP config endpoints

### Detailed Build Instructions

The `make` command will initialize my library submodule and  use `sudo` to install the required system packages and CPAN
modules. If you want more control over what is installed you must follow the
[Manual Setup](https://github.com/nholuongut/devops-perl-tools#manual-setup) section instead.

#### Perlbrew localized installs

The automated build will use 'sudo' to install required Perl CPAN libraries to the system unless running as root or it
detects being inside Perlbrew. If you want to install some of the common Perl libraries such as `Net::DNS` and `LWP::*`
using your OS packages instead of installing from CPAN then follow the Manual Build section below.

### Manual Setup

Enter the tools directory and run git submodule init and git submodule update to fetch my library repo and then install
the CPAN modules as mentioned further down:

```bash
git clone https://github.com/nholuongut/devops-perl-tools perl-tools
cd tools
git submodule update --init
```

Then proceed to install the CPAN modules below by hand.

#### CPAN Modules

Install the following CPAN modules using the cpan command, using `sudo` if you're not root:

```bash
sudo cpan JSON LWP::Simple LWP::UserAgent Term::ReadKey Text::Unidecode Time::HiRes XML::LibXML XML::Validate ...
```

The full list of CPAN modules is in `setup/cpan-requirements.txt`.

You can install the entire list of cpan requirements like so:

```bash
sudo cpan $(sed 's/#.*//' < setup/cpan-requirements.txt)
```

You're now ready to use these programs.

#### Offline Setup

Download the Tools and Lib git repos as zip files:

[https://github.com/nholuongut/devops-perl-tools/archive/master.zip](https://github.com/nholuongut/devops-perl-tools/archive/master.zip)

[https://github.com/nholuongut/lib/archive/master.zip](https://github.com/nholuongut/lib/archive/master.zip)

Unzip both and move Lib to the `lib` folder under Tools.

```bash
unzip devops-perl-tools-master.zip
unzip lib-master.zip

mv -v devops-perl-tools-master perl-tools
mv -v lib-master lib
mv -vf lib perl-tools/
```

Proceed to install CPAN modules for whichever programs you want to use using your standard procedure - usually an
internal mirror or proxy server to CPAN, or rpms / debs (some libraries are packaged by Linux distributions).

All CPAN modules are listed in the `setup/cpan-requirements.txt` file.

### Configuration for Strict Domain / FQDN validation

Strict validations include host/domain/FQDNs using TLDs which are populated from the official IANA list. This is done
via my [Lib](https://github.com/nholuongut/lib) submodule - see there for details on configuring to permit custom TLDs
like `.local`, `.intranet`, `.vm`, `.cloud` etc. (all already included in there because they're common across companies
internal environments).

### Updating

Run `make update`. This will git pull and then git submodule update which is necessary to pick up corresponding library
updates.

If you update often and want to just quickly git pull + submodule update but skip rebuilding all those dependencies each
time then run `make update-no-recompile` (will miss new library dependencies - do full `make update` if you encounter
issues).

### Testing

[Continuous Integration](https://travis-ci.org/nholuongut/devops-perl-tools) is run on this repo with tests for success
and failure scenarios:

- unit tests for the custom supporting [perl library](https://github.com/nholuongut/lib)
- integration tests of the top level programs using the libraries for things like option parsing
- [functional tests](https://github.com/nholuongut/devops-perl-tools/tree/master/tests) for the top level programs using
  local test data and [Docker containers](https://hub.docker.com/u/nholuongut/)

To trigger all tests run:

```bash
make test
```

which will start with the underlying libraries, then move on to top level integration tests and functional tests using
docker containers if docker is available.


# 🚀 I'm are always open to your feedback.  Please contact as bellow information:
### [Contact ]
* [Name: nho Luong]
* [Skype](luongutnho_skype)
* [Github](https://github.com/nholuongut/)
* [Linkedin](https://www.linkedin.com/in/nholuong/)
* [Email Address](luongutnho@hotmail.com)
* [PayPal.me](https://www.paypal.com/paypalme/nholuongut)

![](https://i.imgur.com/waxVImv.png)
![](Donate.png)
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/nholuong)

# License
* Nho Luong (c). All Rights Reserved.🌟