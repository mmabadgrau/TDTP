#echo $1 $2 $3 $4 $5
#exit 0
basicDir="/home/gte/mabad/"
basicDir="/home/mabad/"
dir=$basicDir"genome/main/"
dir2=$basicDir"bioinformaticsApps/LDTDT/simulationsDiffAfricanLongHaps"
#dir2=$basicDir"bioinformaticsApps/LDTDT/simulationsDiffGeneralNew/"
#dir2=$basicDir"bioinformaticsApps/LDTDT/simulationsDiffAfricanLongHapsLowRisk"
#dir2=$basicDir"bioinformaticsApps/LDTDT/simulationsDiffAfricanLowRiskRareVariant"
dir3=$basicDir"TDT/html/TDTP/results/simulations/power/normalVariant/"
dir3=$basicDir"TDT/html/TDTP/results/simulations/power/rareVariant/"
dir3=$basicDir"TDT/html/TDTP/results/simulations/power/size200/"

sampleSize="_Size500"
sampleSize=""
onlyHetero=1
alsoHomoT="_AlsoHomo"
alsoHomoT=""
#testMode=2
dir2=$dir2$alsoHomoT$sampleSize"/"
pr=24
testModes="1 2 3 4" 
testModes="1"  # cross validation
testsModes="4" # half training
testModes="3" # training
testInside=1
testInside=0
folds="2 5"
fold="1"
for fold in $folds
do
for testMode in $testModes
do
rec="0.0000000 0.0000500 0.0001000 0.0002000 0.0004000 0.0008000 0.0016000 0.0032000"
rec="0.0000000 0.0000500 0.0001000 0.0001500 0.0002000 0.0002500 0.0003000 0.0003500 0.0004000 0.0004500 0.0005000"

rec="0.0000000 0.0000500 0.0001000 0.0001500 0.0002000 0.0002500 0.0003000 0.0003500 0.0004000 0.0004500 0.0005000"
rec="0.0003500 0.0004500"
rec="0.0000000 0.0000500 0.0001000 0.0001500 0.0002000 0.0002500 0.0003000 0.0003500 0.0004000 0.0004500 0.0005000 0.0008000 0.0016000 0.0032000"
#rec="0.0000000"
#rec="0.0008000 0.0016000 0.0032000"
#rec="0.0000000 0.0000500 0.0001000 0.0002000 0.0004000 0.0008000 0.0016000 0.0032000"
#rec="0.0000000 0.0000500 0.0001000 0.0001500 0.0002000 0.0002500 0.0003000 0.0003500 0.0004000 0.0004500 0.0005000 0.0008000 0.0016000 0.0032000"
#rec="0.0001500 0.0002500 0.0003000 0.0003500 0.0004500 0.0005000"
#rec="0.0001000" # 0.0004500 0.0005000"
#rec="0.0001500"



onlyHetero=1
alsoHomoT="_AlsoHomo"
totalSamples=100
#totalPermutations=1000
#totalPermutations=100
maxHap=1
cd $dir2
processes=0
test="PowerTwoLoci PowerOneLocus"
#test="PowerOneLocus"
#test="PowerTwoLoci"
#test="PowerTwoLoci PowerOneLocus"
#test="TypeIError"
c=0
#length="10 8 6 4 2 1"
length="1 2 10"
length="2 4 6"
length="10 8 6 4 2 1"
#length="10"
#length="8 6 4 2 1"
#length="1 2 4 6 8"
for l in $length
do
testCont=0
testCont=1
#testCont=2
for t in $test
do 
for recCont in $rec
do
model="Additive DomOrDom DomAndDom RecOrRec Threshold Modified"
#model="DomOrDom DomAndDom RecOrRec Threshold Modified"
#model="RecOrRec"
#model="RecOrRec"
RR="2 4 6 8 10"
RR="10"
RR="2 4 6 8 10"
#RR="1.2 1.6 2.0 2.4 2.6"
#RR="8"
for RRCont in $RR
do
modelCont=1
#modelCont=4
for m in $model
do
if [ $testCont == 1 -o $modelCont == 1 -o $modelCont == 2 -o $modelCont == 4 ]
then
error=1
file=$dir2$t"Rec"$recCont"_RR"$RRCont"_"$m$sampleSize$alsoHomoT"_resultsForTestMode"$testModeT"_SWOfSize"$l"AndOffsetOf1_mTDT2G.mult"
#echo $file
rm $file
if [ ! -f $file ]
then
echo $dir"makeTUGWAS" $dir2$t"Rec"$recCont"_RR"$RRCont"_"$m$sampleSize$alsoHomoT"_" $totalSamples $2 $3 $4 $5 0 $l $l 1 $onlyHetero 0 100 3 0 
error= $dir"makeTUGWAS" $dir2$t"Rec"$recCont"_RR"$RRCont"0000_"$m$sampleSize$alsoHomoT"_" $totalSamples $2 $3 $4 $5 0 $l $l 1 $onlyHetero 0 100  $testMode $fold $testInside 0 0 $dir3  &
#exit 0
echo $dir2$t"Rec"$recCont"_RR"$RRCont"_"$m$alsoHomoT
fi
#if [ $error != 0 ]
#then
#exit 0
#fi
processes=$[$processes+1]
if [ $(($processes%$pr)) == 0 ]
then
wait
fi
fi # end for each correct model
modelCont=$[$modelCont+1]
done # for each model
done # for each RR
done # for each recombination rate
testCont=$[$testCont+1]
done
#c=$[$c+1]
done
done # for each testMode
done # number of folds
