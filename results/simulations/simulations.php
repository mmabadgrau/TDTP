<html>
<head>

<?include($_SERVER['DOCUMENT_ROOT'].'/readlanguage.php');$idioma=readLanguage("es");?>
        <META content="3 days" name=Revisit>
        <META content=all name=robots>
        <META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
        <link href="/css/normal.css" rel="stylesheet" type="text/css">

</head>
<body>
<h1>Multimarker TDTs</h1>


<?
$model=0;
if (isset($_GET['model']))
$model=$_GET['model'];

$correction="NoCorrection";
if (isset($_GET['correction']))
$correction=$_GET['correction'];

$length=1;
if (isset($_GET['length']))
$length=$_GET['length'];

$models=Array("One disease susceptibility locus", "Two disease susceptibility loci: Additive - DomOrDom - RecOrRec disease models", "Two disease susceptibility loci: DomAndDom - Threshold - Modified disease models");
echo "<h2>".$models[$model]."</h2>";
?>
<h4>Color codes:</h4>
TDT results:
<ul>
<? if ($correction=="NoCorrection")
echo "<li><font color=red>Red: mTDT<sub>P</sub></li>
<li><font color=blue>Blue: mTDT<sub></sub></li>
<li><font color=green>Green: mTDT<sub>1T</sub></li>
<li><font color=brown>Brown: mTDT<sub>SR</sub></li>
<li><font color=violet>Violet: mTDT<sub>E</sub></li>
<li><font color=black>Black: mTDT<sub>LC</sub></li>";
if ($correction=="Correction")
echo "<li><font color=red>Red: mTDT<sub>P</sub></li>
<li><font color=green>Green: mTDT<sub>Y</sub></li>
<li><font color=cyan>Cyan: mTDT<sub>YP</sub></li>
<li><font color=purple>Purple: mTDT<sub>L1</sub></li>
<li><font color=scarlet>Scarlet: mTDT<sub>L2</sub></li>";
if ($correction=="LowRisk" || $correction=="RareVariant")
echo "<li><font color=red>Red: mTDT<sub>P</sub></li>
<li><font color=blue>Blue: mTDT<sub></sub></li>
<li><font color=green>Green: mTDT<sub>Y</sub></li>";
?>
</ul>
</ul> <font color=black>
<?if ($correction=="RareVariant")
echo "<ul><li>Continuous line: Common variants</li><li>Lines with diamonds: Rare variants</li></ul>";
?>
<?
/*$files=Array("crohnOriginal", "chromosome5_CEUMarch2008WithCrohnReduced");

for ($cont=0; $cont<2; $cont++)
{
echo "<tr><td>".$files[$cont].":<br>";
echo "<a href=\"tdt.php?alpha=".$alpha."&res=".($res/2)."&ext=".$ext."&sampleSize=".$sampleSize."\"> ";
echo "<img src=\"../realSamples/".$files[$cont].".mult".$ext."Alpha".$alpha.".png\" height=".$size[$cont]/$res."px></a>";
echo "</td></tr>";
}
*/

//if ($m=="One locus") echo "OneLocus";
//else if ($t==1) {echo "TwoLociA"; $t=0;} 
//else echo "TwoLociB";
//echo "Length".($widthA[$w])."Alpha05.png

$simulations="simulations";
if ($correction=="Correction") $simulations=$simulations."Correction";
if ($correction=="LowRisk") $simulations=$simulations."LowRisk";
if ($correction=="RareVariant") $simulations=$simulations."LowRiskRareVariant";
else
{
if ($model==0) $simulations=$simulations."OneLocus"; 
else if ($model==1) $simulations=$simulations."TwoLociA";
else $simulations=$simulations."TwoLociB";
}
//echo "sim:".$simulations;
//echo "model is: ".$model;
echo "\n<img src=\"".$simulations."Length".$length."Alpha05.png\" height=1800px border=0>\n";
?>

</body>
</html> 

