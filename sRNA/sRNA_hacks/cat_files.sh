for sample_dir in Raw_317_*/
do
    pushd $sample_dir || exit
    cat *_R1_*.gz > $sample_dir.fastq.gz
    rm *_R1_*.gz 
    popd
done
