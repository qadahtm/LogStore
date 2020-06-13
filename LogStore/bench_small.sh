NKEYS=900000
NREADS=40000
NTHREADS=1
NOPEN_FILES=500
SKEW=0.9 
WARM_RATIO=0.45
COLLECT_STATS=1
VALUE_SIZE=1024
READ_PCT=0.1
LL_DB=/disks/data/logstore
DB_DIR=/disks/ssd/logstore
BLOOM_BITS_SIZE=16
STATS_INT=1000
WRITE_BUFF_SIZE=4000
echo $WRITE_BUFF_SIZE
# Clean
rm /disks/data/logstore/*; rm /disks/ssd/logstore/*
#make clean; make -j4 all db_bench


# Run RO Benchmark
#/usr/bin/time -v ./db_bench --db=$DB_DIR --ll_db=$LL_DB --benchmarks=fillbatch,stats,warmlogstore,pause,stats,warmcache,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats --num=$NKEYS --reads=$NREADS --threads=$NTHREADS --compression_ratio=0.99 --value_size=$VALUE_SIZE --bloom_bits=$BLOOM_BITS_SIZE --open_files=$NOPEN_FILES --stats_interval=$STATS_INT --warm_ratio=$WARM_RATIO --advise_random_on_open=1 --zipf_skew=$SKEW --use_statistics=$COLLECT_STATS
/usr/bin/time -v ./db_bench --db=$DB_DIR --ll_db=$LL_DB --benchmarks=fillbatch,stats,warmlogstore,pause,stats,warmcache,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats --num=$NKEYS --reads=$NREADS --threads=$NTHREADS --compression_ratio=0.99 --value_size=$VALUE_SIZE --bloom_bits=$BLOOM_BITS_SIZE --open_files=$NOPEN_FILES --stats_interval=$STATS_INT --warm_ratio=$WARM_RATIO --advise_random_on_open=1 --zipf_skew=$SKEW --use_statistics=$COLLECT_STATS --write_buffer_size=$WRITE_BUFF_SIZE

# Run WO Benchmark
#/usr/bin/time -v ./db_bench --db=$DB_DIR --ll_db=$LL_DB --benchmarks=fillbatch,stats,pause,warmcache,stats,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,genzipfinput,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats,writezipf,stats --num=$NKEYS --reads=$NREADS --threads=$NTHREADS --compression_ratio=0.99 --value_size=$VALUE_SIZE --bloom_bits=$BLOOM_BITS_SIZE --open_files=$NOPEN_FILES --stats_interval=100000 --warm_ratio=$WARM_RATIO --advise_random_on_open=1 --zipf_skew=$SKEW --use_statistics=$COLLECT_STATS

# Run RW Benchmark
#/usr/bin/time -v ./db_bench --db=$DB_DIR --ll_db=$LL_DB --benchmarks=fillbatch,stats,warmlogstore,pause,stats,warmcache,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readzipfinput,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats,genzipfinput,readwritezipf,stats --num=$NKEYS --reads=$NREADS --threads=$NTHREADS --compression_ratio=0.99 --value_size=$VALUE_SIZE --bloom_bits=$BLOOM_BITS_SIZE --open_files=$NOPEN_FILES --stats_interval=100000 --warm_ratio=$WARM_RATIO --advise_random_on_open=1 --zipf_skew=$SKEW --use_statistics=$COLLECT_STATS --read_pct=$READ_PCT

# Run RANDOM Benchmark
#/usr/bin/time -v ./db_bench --db=$DB_DIR --ll_db=$LL_DB --benchmarks=fillbatch,stats,warmcache,stats,readrandom,stats,readrandom,stats,readrandom,stats,readrandom,stats,readrandom,stats,readrandom,stats --num=$NKEYS --reads=$NREADS --threads=$NTHREADS --compression_ratio=0.99 --value_size=$VALUE_SIZE --bloom_bits=$BLOOM_BITS_SIZE --open_files=$NOPEN_FILES --stats_interval=100000 --warm_ratio=$WARM_RATIO --advise_random_on_open=1 --zipf_skew=$SKEW --use_statistics=$COLLECT_STATS