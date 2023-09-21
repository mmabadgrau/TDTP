#echo $1 $2 $3 $4 $5
#exit 0
recs="0.1 0.5"
recs="0.5"
for rec in $recs
do
basicDir="/home/gte/mabad/"
basicDir="/home/mabad/"
dir=$basicDir"genome/main/"
dir2=$basicDir"bioinformaticsApps/LDTDT/simulationsDiffAfricanLongHaps"
dir2=$basicDir"bioinformaticsApps/LDTDT/simulationsTypeIDiffAfricanLongHapsRec"$rec
dir3=$basicDir"TDT/html/TDTP/results/simulations/TypeIRec"$rec"/"
#dir2=$basicDir"bioinformaticsApps/LDTDT/simulationsDiffYuOneHaplotype/"
#dir2=$basicDir"bioinformaticsApps/LDTDT/simulationsDiffAfricanJan2010/"
sampleSize="_Size500"
onlyHetero=1
alsoHomoT="_AlsoHomo"
dir2=$dir2$alsoHomoT$sampleSize"/"
pr=9
returnPValues="0 1"
returnPValues="1"
verticalOutput=0
ext="mult"
for returnPVals in $returnPValues
do
if [ $returnPVals == 1 ]
then
verticalOutput=1
ext="pVal"
fi
processes=0
alsoHomoT="_AlsoHomo"
totalSamples=1000 # 000 # 10000
if [ $rec == "0.5" ]
then
shuffled="_shuffled"
totalSamples=100 # 0 # 3000 # 10000
#totalSamples=1000
else
shuffled=""
fi
echo totalsam $totalSamples
totalPermutations=0
maxHap=1
cd $dir2
test="TypeIError"
c=0
#length="10 8 6 4 2 1"
length="1 2 10"
length="2 4 6"
length="1 2 4 6 8 10"
#length="8 6 4 2 1"
#length="1 2 4 6"
length="1 2 4 6 8 10" 
length="2"
for l in $length
do
freq="0.1 0.3 0.5"
#freq="0.3 0.5"
mixtureProp="0.5 0.75 0.833"
#mixtureProp="0.833"
#mixtureProp="0.5"
for mix in $mixtureProp
do
for f in $freq
do
#echo $dir3$test"_MAF"$f"mixProp"$mix
file=$dir3$test"_MAF"$f"mixProp"$mix$sampleSize$alsoHomoT"_resultsForTestModeTraining_SWOfSize"$l"AndOffsetOf1_mTDT2G_cv"$fold"."$ext
#echo $file
if [ -f $file ]
then
rm $file
fi
if [ ! -f $file ]
then
#rm "resMAF"$f"minProp"$mix"size"$l 
#echo "resMAF"$f"minProp"$mix"size"$l
#echo error= $dir"makeTUGWAS" $dir2$test"_MAF"$f"mixProp"$mix$sampleSize$alsoHomoT"_" $totalSamples $2 $3 $4 $5 0 $l $l 1 $onlyHetero 0 $totalPermutations $testMode $fold 1 0
error= $dir"makeTUGWAS" $dir2$test"_MAF"$f"mixProp"$mix$sampleSize$alsoHomoT$shuffled"_" $totalSamples $2 $3 $4 $5 0 $l $l 1 $onlyHetero 0 $totalPermutations 3 0 0 $verticalOutput $returnPVals  $dir3 #  &   # >& "resMAF"$f"minProp"$mix"size"$l  &
exit 0
processes=$[$processes+1]
fi
if [ $(($processes%$pr)) == 0 ]
then
wait
fi
done
done
done
done
done
