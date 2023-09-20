<html>

<head>

<?include($_SERVER['DOCUMENT_ROOT'].'/readlanguage.php');$idioma=readLanguage("es");?>
        <META content="3 days" name=Revisit>
        <META content=all name=robots>
        <META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
        <link href="/css/normal.css" rel="stylesheet" type="text/css">

</head>
<body>
<h1>Multimarker TDT maps</h1>

<?
$month="February";
if (isset($_GET['month']))
$month=$_GET["month"];
$year=2009;
if (isset($_GET['year']))
$year=$_GET["year"];
$res=1;
if (isset($_GET['res']))
$res=$_GET["res"];
else $res=1;
if (isset($_GET['ext']))
$ext=$_GET['ext'];
else $ext="EM-Freq";
$phased="";
if (isset($_GET['phased']))
$phased=$_GET['phased'];
$typ="";
if (isset($_GET['type']))
$typ=$_GET['type'];
$w=0;
if (isset($_GET['w']))
$w=$_GET['w'];

$size=100;

if ($typ=="plots") $t=".calFunction";
else $t="Alpha0PTDT";

#echo "<h2>Haplotype inference method: ".$ext."</h2>";
if ($phased=="Phased")
echo "<h2>Phased using EM-Max, UT distr, trios restriction</h2>";
?>
<h4>Color codes:</h4>
TDT results:
<ul>
<li><font color=red>Red: mTDT<sub>P</sub></li>
<li><font color=blue>Blue: mTDT<sub></sub></li>
<li><font color=green>Green: mTDT<sub>Y</sub></li>
<li><font color=cyan>Cyan: mTDT<sub>YP</sub></li>
<li><font color=purple>Purple: mTDT<sub>L1</sub></li>
<li><font color=#9C0606>Scarlet: mTDT<sub>L2</sub></li>
<li><font color=violet>Violet: mTDT<sub>E</sub></li>
<li><font color=orange>Orange: mTDT<sub>1T</sub></li>
<li><font color=pink>Pink: mTDT<sub>1U</sub></li>
<li><font color=black>Black: mTDT<sub>LC</sub></li>
<li><font color=brown>Brown: mTDT<sub>SR</sub></li>
</ul>
</ul> <font color=black>

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
$files=Array("Crohn", "EVI5", "IL2R" , "IL7R",  "HLA",  "KIAA0350", "CD226", "CD58", "IRF5");
$chrom=Array("5", "1", "10", "5", "6", "16", "18" ,"1", "7");
$widthA=Array("1", "2", "4", "6", "8", "10");
echo "<table>";
for ($cont=0; $cont<sizeof($chrom); $cont++)
{
$fileGWAS=$files[$cont];
for ($width=0; $width<sizeof($widthA); $width++)
if ($w==0 || $widthA[$width]==$w)
{
echo "\n<tr><td>Width: ";
echo $widthA[$width];
echo "</td></tr>";
echo "<tr><td>".$files[$cont]."</td></tr>";
for ($type=0; $type<2; $type++)
{
if ($type==0) echo "<tr>";
echo "<td>";
if ($type==0) echo "<h4>Affected</h4>"; else if ($typ=="plots") echo "<h4>Hapmap</h4>";
echo "</td>";
if ($type==1) echo "</tr><tr>";
}
for ($type=0; $type<2; $type++)
if ($type==0 || $typ=="plots")
{
echo "\n<td><a href=\"tdtCont.php?res=".($res/2)."&ext=".$ext."&month=".$month."&year=".$year."&type=".$typ."&phased=Phased&w=".$w."\"><img src=\"/~clados/repGenome/research/TDT/html/TDTP/results/realData/";
if ($type==0)
if ($files[$cont]=="Crohn")
echo "Crohn".$phased."_noBlocks";
else echo "ms_".$chrom[$cont]."CEU".$month.$year.$fileGWAS.$phased."_noBlocks";
else echo "chromosome".$chrom[$cont]."_CEU".$month.$year.$files[$cont].$phased."_noBlocks";
echo "_w".$widthA[$width];
echo  ".mult".$ext.$t.".png\" height=".$size/$res."px border=0></a></td>\n";
if ($type==1) echo "</tr>";
}
}
}
?>
</table>

</body>
</html> 

