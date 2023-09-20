<html>
<head>

<?include($_SERVER['DOCUMENT_ROOT'].'/readlanguage.php');$idioma=readLanguage("es");?>
        <META content="3 days" name=Revisit>
        <META content=all name=robots>
        <META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
        <link href="/css/normal.css" rel="stylesheet" type="text/css">

</head>
<body>
<h1>TDT<sub>P</sub>: A highly locus-specific TDT for genome-wide exploration</h1>
<h1>Supplementary material</h1>
<h2>Simulations</h2>
<a href="../simulations/simulations.pdf">Download a detailed description of the way simulations were performed</a>
<br>
<a href="../simulations/simulationsDetails.pdf">Download a detailed description of the configurations used to run msHOT</a>
<br><a href="../trioSampling/">trioSampling: software used to generate trio SNP genotype samples from populations</a>
<br>
<?
$baseDir="results/";
$widthA=Array("1", "2", "4", "6", "8", "10");
$models=Array("One locus", "Two loci: Additive - DomOrDom - RecOrRec disease models", "Two loci: DomAndDom - Threshold - Modified disease models");
$corrections=Array("NoCorrection","Correction", "LowRisk", "RareVariant");
$a=1;
foreach ($corrections as $c)
{
$t=0;
if ($c=="Correction") echo "<h3>Comparisons with test for the small data problem</h3>";
if ($c=="LowRisk") echo "<h3>Results using samples of 500 trios and low relative risks</h3>";
if ($c=="RareVariant") echo "<h3>Comparative power results between different intervals of disease mutation frequencies using samples of 500 trios, low relative risks</h3>";
foreach ($models as $m)
{
if ($c!="RareVariant")
echo "<h3>".$m."</h3>";
if ($c!="RareVariant" || $m=="One locus")
for ($w=0; $w<sizeOf($widthA); $w++)
{
echo "<a href=\"".$baseDir."simulations/simulations.php?correction=".$c."&model=".$t."&length=".$widthA[$w];
//if ($m=="One locus") echo "OneLocus";
//else if ($t==2) {echo "TwoLociA"; $t=0;} 
//else echo "TwoLociB";
//echo "Length".($widthA[$w])."Alpha05.png
echo "\">Figure S".($a).". Simulations for haplotype width ".$widthA[$w]."</a><br>";
$a++;
}
$t++;
}
}
//echo "<br><a href=\"".$baseDir."simulations/simulationsTwoLociBHomo-HeteroAnd2Ho.png\">Human population, coalescent model, two loci, genetic models: domANDdom, threshold, modified</a>";
//echo "<br><a href=\"".$baseDir."simulations/simulationsOneLocusYuHomo-HeteroAnd2Ho.png\">Simplified evolution model, one locus</a>";
//echo "<br><a href=\"".$baseDir."simulations/simulationsTwoLociAYuHomo-HeteroAnd2Ho.png\">Simplified evolution model, two loci, genetic models: additive, domORdom, recORrec</a>";
//echo "<br><a href=\"".$baseDir."simulations/simulationsTwoLociBYuHomo-HeteroAnd2Ho.png\">Simplified evolution model, two loci, genetic models: domANDdom, threshold, modified</a>";
?>
<h2>Real data</h2>
<?
$month="February";
if (isset($_GET['month']))
$month=$_GET["month"];
$year=2009;
if (isset($_GET['year']))
$year=$_GET["year"];
$EMDist=Array("OneDistr", "UTDistr");
$EMRest=Array("NoRestriction", "TriosBasedRestriction");
$PhaseMethod=Array("IgnoreUnknownPhase", "EM-Max", "EM-Freq");
//echo "<a href=\"tdtCont.php?month=".$month."&year=".$year."&type=plots&ext=".$PhaseMethod[0]."_".$EMDist[0]."_".$EMRest[0]."&phased=Phased\">"."Phase solved with EM-Max UTDistr, TriosBasedRestriction".$PhaseMethod[0].", ".$EMDist[0].", ".$EMRest[0]."</a><br>";
$widthA=Array("1", "2", "4", "6", "8", "10");
for ($w=0; $w<sizeOf($widthA); $w++)
echo "<a href=\"tdtCont.php?month=".$month."&year=".$year."&type=maps&ext=".$PhaseMethod[0]."_".$EMDist[0]."_".$EMRest[0]."&phased=Phased&w=".$widthA[$w]."\">Figure S".($w+$a)."</a> CTDT maps for window width of ".$widthA[$w]."<br>";

//echo "<p><a href=\"tdtNoBlocks.php?alpha=0&res=5&ext=IgnoreUnknownPhase_OneDistr_NoRestriction&sampleSize=0&month=February&year=2009">Real data Hapmap 2009 results no blocks</a></li> 
?>

<h2>Data sets</h2>
<a href="/BioData/CrohnPhased.gou">Crohn data set in makeped format</a><br>
<a href="/BioData/chromosome_5CEUFebruary2009Crohn.gou">CEU IHMP data set in makeped format same locus as Crohn data set</a>


<h2>Software</h2>
<a href="software/TDTP2.0.tar.gz">Download source code</a>
<br>
<a href="software/TDTP2.0.gz">Download compiled version for linux 64</a>
<br>
<a href="HowToInstall.html">README</a>


</body>
