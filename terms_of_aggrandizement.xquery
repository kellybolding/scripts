xquery version "1.0";
declare namespace ead = "urn:isbn:1-931666-22-9";
declare copy-namespaces no-preserve, inherit;

import module namespace functx="http://www.functx.com" 
    at "http://www.xqueryfunctions.com/xq/functx-1.0-doc-2007-01.xq";
    
(: Reports on "terms of aggrandizement" in bioghist notes within a directory of EAD files. Edit the file path to run. :)
(: Inspired by Jarrett Drake's 2016 talk "RadTech Meets RadArch: Towards A New Principle for Archives and Archival Description." :)
(: Code and all faults courtesy of Kelly Bolding. :)

declare variable $ead as document-node()+ := collection("file:///C:/path/to/directory/of/eads?recurse=yes;select=*.xml");
<results>
{
for $bioghist in $ead//ead:ead/ead:archdesc/ead:bioghist[ead:p[matches(string(.), '(\s|^)(influential|renowned|not(able|ed)|distinguished|reputable|prestigious|prominent|significant|respected|expert|important|prolific|ambitious|great(est)?|successful|wealthy?|fortune|famous|interesting|father\sof\s(the|American)|man\sof\sletters|genius|foremost|acclaimed|popular|celebrated|esteemed|(pre)?eminent|talented|exclusive)(\s|$)', 'i')]]
return 

        <collection>
                <collectioncode>{data($bioghist/ancestor::ead:archdesc/ead:did/ead:unitid)}</collectioncode>
                <title>{data($bioghist/ancestor::ead:archdesc/ead:did/ead:unittitle)}</title>
                <origination>{data($bioghist/ancestor::ead:archdesc/ead:did/ead:origination/*)}</origination>
                <bioghist>{data($bioghist)}</bioghist>
        </collection>
        }
       </results>