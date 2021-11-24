(* ::Package:: *)

(* ::Title:: *)
(*Sliced Isnad + Text Cleaning*)


(* ::Section:: *)
(*This notebook slices up the text in an isnad and maps each edge to the respective text portion. We additionally remove any extra characters (e.g. numbers, slashes) as well as all short vowels.*)


(* ::Input:: *)
(*(** set directory **)*)


(* ::Input:: *)
(*SetDirectory[ParentDirectory[ParentDirectory[NotebookDirectory[]]]];*)


(* ::Input:: *)
(*Directory[];*)


(* ::Input:: *)
(*(** hadith id to text **)*)


(* ::Input:: *)
(*AbsoluteTiming[gkHadiths=Import["data/base/xxx_all_gk_hadiths.tsv","TSV"]];*)


(* ::Input:: *)
(*gkHadiths[[1]]*)


(* ::Input:: *)
(*gkHadiths[[1,4]]*)


(* ::Input:: *)
(*gkHadiths[[1,6]]*)


(* ::Input:: *)
(*idToText=Association[Table[gkHadiths[[i,6]]->ToString[gkHadiths[[i,4]]],{i,1,Length[gkHadiths],1}]];*)


(* ::Input:: *)
(*idToText["1_1"]*)


(* ::Input:: *)
(*(** single isnad hadiths **)*)


(* ::Input:: *)
(*singleIsnadIds=Flatten[Import["data/base/xxx_single_isnad_producing_hadith_ids.tsv","TSV"]];*)


(* ::Input:: *)
(*singleIsnadIds[[1]]*)


(* ::Input:: *)
(*(** hadith ids to edges **)*)


(* ::Input:: *)
(*idEdges=Import["data/base/xxx_book-number-hadith-number_edges.csv","CSV"];*)


(* ::Input:: *)
(*idEdges[[;;,2]]=ToExpression[idEdges[[;;,2]]];*)


(* ::Input:: *)
(*idEdges[[1]]*)


(* ::Input:: *)
(*idToEdges=Association[Table[idEdges[[i,1]]->idEdges[[i,2]],{i,1,Length[idEdges],1}]];*)


(* ::Input:: *)
(*idToEdges["1_1"]*)


(* ::Input:: *)
(*(** aside investigation **)*)


(* ::Input:: *)
(*idToText["1_98"]*)


(* ::Input:: *)
(*idToEdges["1_98"]*)


(* ::Input:: *)
(*idToText["1_99"]*)


(* ::Input:: *)
(*idToEdges["1_99"]*)


(* ::Input:: *)
(*idToText["1_100"]*)


(* ::Input:: *)
(*idToEdges["1_100"]*)


(* ::Input:: *)
(*idToText["1_101"]*)


(* ::Input:: *)
(*idToEdges["1_101"]*)


(* ::Input:: *)
(*(** mapping edges to transmission text in isnads **)*)


(* ::Input:: *)
(*id=singleIsnadIds[[1]]*)
(*text=idToText[id]*)
(*edges=idToEdges[id]*)


(* ::Input:: *)
(*(** prophet edge **)*)


(* ::Input:: *)
(*StringCases[text,RegularExpression["L"<>ToString[edges[[1,2]]]<>" (.*?)"<>"/27"]]*)


(* ::Input:: *)
(*(** middle edges **)*)


(* ::Input:: *)
(*StringCases[text,RegularExpression["L"<>ToString[edges[[2,2]]]<>" (.*?)"<>"L"<>ToString[edges[[2,1]]]]]*)


(* ::Input:: *)
(*(** terminal edge **)*)


(* ::Input:: *)
(*StringCases[text,RegularExpression[" (.*?)"<>"L"<>ToString[edges[[4,1]]]]]*)


(* ::Input:: *)
(*(** desired data: edge, hadith-id, transmission text of interest, position in isnad **)*)


(* ::Input:: *)
(*edgeTransmissionText=Reap[Monitor[For[i=1,i<=Length[singleIsnadIds],i++,*)
(*id=singleIsnadIds[[i]];*)
(*If[!KeyExistsQ[idToText,id],Continue[];];*)
(*If[!KeyExistsQ[idToEdges,id],Continue[];];*)
(*text=idToText[id];*)
(*edges=idToEdges[id];*)
(*For[j=1,j<=Length[edges],j++,*)
(*edge=edges[[j]];*)
(*(**no 3000,3001,3002,1311 (mursal, munqati, etc)**)*)
(*If[edge[[1]]==30000||edge[[1]]==30001||edge[[1]]==30002||edge[[1]]==1311,Continue[]];*)
(*If[edge[[2]]==30000||edge[[2]]==30001||edge[[2]]==30002||edge[[2]]==1311,Continue[]];*)
(*(**terminal edge**)*)
(*If[j==Length[edges],cut=StringCases[text,RegularExpression[" (.*?)"<>"L"<>ToString[edge[[1]]]]]];*)
(*(**middle edges**)*)
(*If[j<Length[edges],cut=StringCases[text,RegularExpression["L"<>ToString[edge[[2]]]<>" (.*?)"<>"L"<>ToString[edge[[1]]]]]];*)
(*(**prophet edge**)*)
(*If[j==1,cut=StringCases[text,RegularExpression["L"<>ToString[edge[[2]]]<>" (.*?)"<>"/27"]]];*)
(*If[cut=={},Continue[]];*)
(*Sow[{edge,id,cut[[1]],j}];*)
(*]],i]][[2]][[1]];*)


(* ::Input:: *)
(*edgeTransmissionText[[1]]*)


(* ::Input:: *)
(*(** non arabic letters found in our data **)*)


(* ::Input:: *)
(*nonArabicChars=Flatten[Import["data/characters/m2_non_arabic_characters.csv","CSV"]];*)


(* ::Input:: *)
(*nonArabicChars=Table[ToString[nonArabicChars[[i]]],{i,1,Length[nonArabicChars],1}];*)


(* ::Input:: *)
(*nonArabicChars*)


(* ::Input:: *)
(*(** we want colons to indicate quotations **)*)


(* ::Input:: *)
(*nonArabicChars=DeleteCases[nonArabicChars,":"];*)


(* ::Input:: *)
(*(** short vowels **)*)


(* ::Input:: *)
(*tashkeel=Flatten[Import["data/characters/m2_tashkeel.csv","CSV"]];*)


(* ::Input:: *)
(*tashkeel*)


(* ::Input:: *)
(*(** removing all non-arabic related characters and additionally the tashkeel **)*)


(* ::Input:: *)
(*textCleaned=Reap[Monitor[For[i=1,i<=Length[edgeTransmissionText],i++,*)
(*(*** removing non arabic letters ***)*)
(*text=edgeTransmissionText[[i,3]];*)
(*textNNA=text;*)
(*For[j=1,j<=Length[nonArabicChars],j++,*)
(*textNNA=StringReplace[textNNA,nonArabicChars[[j]]->" "];*)
(*];*)
(*(*** put spaces between colons for quote heuristic ***)*)
(*textNNA=StringReplace[textNNA,":"->" : "];*)
(*changed=True;*)
(*(*** removing uncessary spaces ***)*)
(*While[changed,*)
(*textNNAC=StringReplace[textNNA,"  "->" "];*)
(*If[textNNAC==textNNA,changed=False];*)
(*textNNA=textNNAC;*)
(*];*)
(**)
(*(*** removing short vowels (tashkeel) ***)*)
(*textNT=textNNA;*)
(*For[j=1,j<=Length[tashkeel],j++,*)
(*textNT=StringReplace[textNT,tashkeel[[j]]->""];*)
(*];*)
(*(*** put spaces between colons for quote heuristic ***)*)
(*textNT=StringReplace[textNT,":"->" : "];*)
(*changed=True;*)
(*(*** removing uncessary spaces ***)*)
(*While[changed,*)
(*textNTC=StringReplace[textNT,"  "->" "];*)
(*If[textNTC==textNT,changed=False];*)
(*textNT=textNTC;*)
(*];*)
(**)
(*Sow[{textNNA,textNT}];*)
(*],i]][[2]][[1]];*)


(* ::Input:: *)
(*textCleaned[[1]]*)


(* ::Input:: *)
(*edgeTransmissionText[[;;,3]]=textCleaned[[;;,2]];*)


(* ::Input:: *)
(*edgeTransmissionText[[1]]*)


(* ::Input:: *)
(*(** remove any empty text **)*)


(* ::Input:: *)
(*lenBefore=Length[edgeTransmissionText]*)


(* ::Input:: *)
(*edgeTransmissionText=Reap[For[i=1,i<=Length[edgeTransmissionText],i++,*)
(*If[edgeTransmissionText[[i,3]]==" ",Continue[]];*)
(*Sow[edgeTransmissionText[[i]]]*)
(*]][[2]][[1]];*)


(* ::Input:: *)
(*removed=lenBefore-Length[edgeTransmissionText]*)


(* ::Input:: *)
(*(** export data **)*)


(* ::Input:: *)
(*(*Export["data/sliced-isnad/m3_edge_id_sliced-isnad_and_position.csv",edgeTransmissionText];*)*)
