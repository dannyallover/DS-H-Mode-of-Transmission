(* ::Package:: *)

(* ::Title:: *)
(*Mode of Transmission Extraction*)


(* ::Section:: *)
(*This notebook takes the sliced isnad associated with each edge and extracts the mode of transmission (e.g. \:062d\:062f\:062b\:0646\:064a) that was used, as well as it maps it to its root mode of transmission word.*)


(* ::Input:: *)
(*(** set directory **)*)


(* ::Input:: *)
(*SetDirectory[ParentDirectory[ParentDirectory[ParentDirectory[NotebookDirectory[]]]]];*)


(* ::Input:: *)
(*Directory[];*)


(* ::Input:: *)
(*(** previous work: edge, hadith-id, transmission text of interest, position in isnad **)*)


(* ::Input:: *)
(*edgeTransmissionText=Import["data/sliced-isnad/m3_edge_id_sliced-isnad_and_position.csv","CSV"];*)


(* ::Input:: *)
(*edgeTransmissionText[[;;,1]]=ToExpression[edgeTransmissionText[[;;,1]]];*)


(* ::Input:: *)
(*edgeTransmissionText[[1]]*)


(* ::Input:: *)
(*(** the number of transmissions that we could potentially extract a mot from because the transmissions were labeled by GK **)*)


(* ::Input:: *)
(*numTransmissions=Length[edgeTransmissionText]*)


(* ::Input:: *)
(*(** import mode of transmission words **)*)


(* ::Input:: *)
(*mots=ToExpression[Flatten[Import["data/mots/mot-corpus/m0_main_mots.csv"]]];*)


(* ::Input:: *)
(*mots*)


(* ::Input:: *)
(*Length[mots]*)


(* ::Input:: *)
(*motsLowPriority=ToExpression[Flatten[Import["data/mots/mot-corpus/m0_low_priority_mots.csv"]]];*)


(* ::Input:: *)
(*motsLowPriority*)


(* ::Input:: *)
(*Length[motsLowPriority]*)


(* ::Input:: *)
(*motsDerived=ToExpression[Import["data/mots/mot-corpus/m0_derived_main_mots.csv"]];*)


(* ::Input:: *)
(*motsDerived=motsDerived[[;;,1]];*)


(* ::Input:: *)
(*motsDerived*)


(* ::Input:: *)
(*Length[motsDerived]*)


(* ::Input:: *)
(*(**create main mot list and low priority mot list**)*)


(* ::Input:: *)
(*motsAll=DeleteDuplicates[Flatten[{mots,motsDerived}]];*)
(*motsLowPriorityAll=DeleteDuplicates[motsLowPriority];*)


(* ::Input:: *)
(*(**mode of transmission words to root words**)*)


(* ::Input:: *)
(*motRoot=ToExpression[Import["data/mots/root-mots/m1_all_mots_root_words.csv","CSV"]];*)


(* ::Input:: *)
(*motToRoot=Association[Table[motRoot[[i,1]]->motRoot[[i,2]],{i,1,Length[motRoot],1}]];*)


(* ::Input:: *)
(*motToRoot[\:0648\:0642\:064a\:0644]*)


(* ::Input:: *)
(*(**data: {edge, hadith id, position in isnad, cut hadith text, possible mode of transmissions, mode of transmission selected, mode of transmission selected root word}**)*)


(* ::Input:: *)
(*successfullyParsed=0;*)
(*couldntParse=0;*)


(* ::Input:: *)
(*edgeMot=Reap[Monitor[For[i=1,i<=Length[edgeTransmissionText],i++,*)
(*edge=edgeTransmissionText[[i,1]];*)
(*id=edgeTransmissionText[[i,2]];*)
(*text=edgeTransmissionText[[i,3]];*)
(*textLength=StringLength[text];*)
(*position=edgeTransmissionText[[i,4]];*)
(*pMots={};*)
(**)
(*(**extract mots**)*)
(*For[j=1,j<=Length[motsAll],j++,*)
(*If[!StringContainsQ[text," "<>ToString[motsAll[[j]]]<>" "],Continue[]];*)
(*mot=ToString[motsAll[[j]]];*)
(*motLen=StringLength[mot];*)
(*positions=Flatten[StringPosition[text,mot]];*)
(*For[w=1,w<=Length[positions],w+=2,*)
(*pos=positions[[w]];*)
(*(**colon heuristic: if it's preceded by a colon that means we give it high priority to offset quote mots**)*)
(*index=pos+motLen+1;*)
(*If[index<textLength,colon=StringTake[text,{index,index}],colon=""];*)
(*If[colon==":",pos=pos+1000000];*)
(*pMots=Append[pMots,{mot,pos,motLen}];*)
(*];*)
(*];*)
(**)
(*(**low priority heuristic: if no mot is extracted check for low priority mots**)*)
(*If[pMots=={},*)
(*For[j=1,j<=Length[motsLowPriorityAll],j++,*)
(*If[!StringContainsQ[text," "<>ToString[motsLowPriorityAll[[j]]]<>" "],Continue[]];*)
(*mot=ToString[motsLowPriorityAll[[j]]];*)
(*motLen=StringLength[mot];*)
(*positions=Flatten[StringPosition[text,mot]];*)
(*For[w=1,w<=Length[positions],w+=2,*)
(*pos=positions[[w]];*)
(*(**colon heuristic: if it's preceded by a colon that means we give it high priority to offset quote mots**)*)
(*index=pos+motLen+1;*)
(*If[index<textLength,colon=StringTake[text,{index,index}],colon=""];*)
(*If[colon==":",pos=pos+1000000];*)
(*pMots=Append[pMots,{mot,pos,motLen}];*)
(*];*)
(*];*)
(*];*)
(**)
(*(**previous cut heuristic: if there's no mot, sometimes it's the case that it's because both mot's were in the previous transmission**)*)
(*If[pMots=={}&&Length[prevMots]>=2&&prevId==id,pMots=prevMots[[2;;]]];*)
(**)
(*(**if there's still no mot, then go to next transmission**)*)
(*If[pMots=={},couldntParse++;Continue[];];*)
(**)
(*(**if multiple mots are extracted, sort and grab the first one**)*)
(*pMots=SortBy[pMots,#[[2]]&];*)
(*allpMots=pMots;*)
(**)
(*(**save these two values for cut heuristic**)*)
(*prevMots=pMots;*)
(*prevId=id;*)
(**)
(*pos=pMots[[1,2]];*)
(*pMots=Reap[For[k=1,k<=Length[pMots],k++,If[pMots[[k,2]]==pos,Sow[pMots[[k]]]]]][[2]][[1]];*)
(*pMots=Reverse[SortBy[pMots,#[[3]]&]];*)
(**)
(*selectedMot=pMots[[1,1]];*)
(*Sow[{edge,id,position,text,allpMots[[;;,1]],selectedMot,motToRoot[ToExpression[selectedMot]]}];*)
(*successfullyParsed++;*)
(*],i]][[2]][[1]];*)


(* ::Input:: *)
(*edgeMot[[1]]*)


(* ::Input:: *)
(*(**here are the percentage that we successfully parsed; we could not parse either when we did not locate the correct mode of transmission word or if there was a lack thereof**)*)
(*percentageSuccessfullyParsed=N[((numTransmissions-couldntParse)/numTransmissions)]*100*)


(* ::Input:: *)
(*(**export data**)*)


(* ::Input:: *)
(*(*Export["data/mots/extracted-mots/m4_edge_id_position_sliced-isnad_possible_mots_selected_mot_and_selected_mot_root_word.csv",edgeMot];*)*)
