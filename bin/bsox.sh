# !/bin/bash
# batch sox 

indir=""
outdir=""
infile_opt=""
outfile_opt=""
effect_opt=""
status="in"

if [[ "$#" -lt 3 ]]; then
    echo "The number of parameters should be more than 2"
    exit 1
fi


# parse args
for opt in "$@"
do
    if [[ "$status" == "in" ]]; then
        if [ ! -d "$opt" ]; then
            infile_opt="${infile_opt} ${opt}"
        else
            indir=${opt}
            status="out"
        fi
    elif [[ "$status" == "out" ]]; then
        if [[ ! -d "$opt" ]]; then
            outfile_opt="${infile_opt} ${opt}"
        else
            outdir=${opt}
            status="effect"
        fi
    else
        if [[ ! -d "$opt" ]]; then
            effect_opt="${effect_opt} ${opt}"
        else
            echo "Usage"
            exit 1
        fi
    fi
done


if [[ -z $indir ]] || [[ -z $outdir ]]; then
    echo "Usage"
    exit 1
fi


filelist=`ls $indir`

for infile in $filelist
do
    cmd="sox $infile_opt $indir/$infile $outfile_opt $outdir/$infile $effect_opt"
    echo $cmd
    `$cmd`
done

