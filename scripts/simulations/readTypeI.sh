basicDir="/home/gte/mabad/"
basicDir="/home/mabad/"
dir=$basicDir"commonc++/main/"
alsoHomo="_AlsoHomo"
name="simulationsDiffAfricanLongHaps"
rec="0.5"
#rec="0.1" 
name="simulationsTypeIDiffAfricanLongHapsRecs"$rec
name="TypeIRec"$rec
#name="simulationsDiffAfricanJan2010"
#name="simulationsDiffYuOneHaplotype"
sampleSize="_Size500"
#minFreq="_minFreq0"
#dir2=$basicDir"bioinformaticsApps/LDTDT/"$name$alsoHomo$sampleSize"/"

dir2=$basicDir"TDT/html/TDTP/results/simulations/"$name"/"

dir3=$dir2
dir4="../../results/simulations/"
shuffled=""
if [ $rec == "0.5" ]
then
shuffled="_shuffled"
fi
testModes="Holdout HalfTraining Training CrossValidation_fold5"
#testModes="Holdout"
testModes="Training"
alpha="01 05 001 005"
#alpha="05"

#common="mTDT_minFreq10.00000 mTDT ScoreTDT_minFreq10.00000 ScoreTDT mTDT1T mTDT2G" # mTDTP LenghtContrastTest SignedRankTest 
common="mTDT mTDT_minFreq10.00000 ScoreTDT ScoreTDT_minFreq10.00000 mTDTP mTDTP_minFreq10.00000 mTDTP_indep mTDTP_indep_minFreq10.00000 ScoreTDTP" # ScoreTDTP_minFreq10.00000"
#common="mTDT2G_cv2 mTDT2G_cv2_minFreq10.00000 mTDT1_cv2 mTDT1_cv2_minFreq10.00000 mTDT1T_cv2 mTDT1T_cv2_minFreq10.00000 mTDT1U_cv2 mTDT1U_cv2_minFreq10.00000 mTDT2G_cv5 mTDT2G_cv5_minFreq10.00000 mTDT1_cv5 mTDT1_cv5_minFreq10.00000 mTDT1T_cv5 mTDT1T_cv5_minFreq10.00000 mTDT1U_cv5 mTDT1U_cv5_minFreq10.00000"
#common="mTDT2G_cv5 mTDT2G_cv5_minFreq10.00000 mTDT1_cv5 mTDT1_cv5_minFreq10.00000 mTDT1T_cv5 mTDT1T_cv5_minFreq10.00000 mTDT1U_cv5 mTDT1U_cv5_minFreq10.00000"
fileTypeI=$dir4"resultsTypeIOneBlock"$name$alsoHomo"_OnlyHetero"$sampleSize$totalPermutations".csv"
rm $fileTypeI
echo -n "MAFSample2 mixProp haplotypeLength "  >> $fileTypeI
for testMode in $testModes
do
for fk in $common
do
for a in $alpha
do
echo -n $testMode"_"$fk"_"$a" " >> $fileTypeI
done
done
done
echo >> $fileTypeI
#echo $filePower
test="TypeIError"
testCont=0


c=0
firstPos=0
length="1 2 4 6 8 10"
#length="1 2 4 6 8"  #4 8 10" #  4 6 8 10" # 10" #2 4 6 8" # 10"
length="2"
for l in $length
do


freq="0.1 0.3 0.5"
#freq="0.1"
mixtureProp="0.5 0.75 0.833"
#mixtureProp="0.833"
#mixtureProp="0.5"
for mix in $mixtureProp
do
for f in $freq
do
#echo $dir2$t"_MAF"$f"mixProp"$mix
#echo  $dir2"TypeIError_MAF"$f"mixProp"$mix
rm tempTypeI
rm temp2TypeI
echo -n $f $mix $l  >> $fileTypeI
for testMode in $testModes
do
for fk in $common
do
$dir"readSimulationsResults" $dir2"TypeIError_MAF"$f"mixProp"$mix$sampleSize$alsoHomo$shuffled"_resultsForTestMode"$testMode"_SWOfSize"$l"AndOffsetOf1_"$fk".mult" tempTypeI
done
done
tr -d '\n' < tempTypeI >> temp2TypeI  # remove \n
cat temp2TypeI >> $fileTypeI
echo >> $fileTypeI
done # for each freq
done # for each mixture
done # for each length
testCont=$[$testCont+1]
echo Results have been saved in $fileTypeI

