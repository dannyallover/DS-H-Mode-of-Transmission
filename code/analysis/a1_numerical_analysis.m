(* ::Package:: *)

(* ::Title:: *)
(*Mode of Transmission Numerical Analysis*)


(* ::Section:: *)
(*This notebook takes the mode of tranmission root words of interest and deduces the following information:*)
(*(1) mean amount across all years*)
(*(2) median amount across all years*)
(*(3) total amount across all years*)
(*(4) max amount across all years*)
(*(5) the year in which (4) occurred*)


(* ::Input:: *)
(*(** set directory **)*)


(* ::Input:: *)
(*SetDirectory[ParentDirectory[ParentDirectory[NotebookDirectory[]]]];*)


(* ::Input:: *)
(*Directory[];*)


(* ::Input:: *)
(*(** mot extraction data **)*)


(* ::Input:: *)
(*motExtracted=Import["data/mots/extracted-mots/m4_edge_id_position_sliced-isnad_possible_mots_selected_mot_and_selected_mot_root_word.csv","CSV"];*)


(* ::Input:: *)
(*motExtracted[[;;,1]]=ToExpression[motExtracted[[;;,1]]];*)


(* ::Input:: *)
(*motExtracted[[1]]*)


(* ::Input:: *)
(*edgeMot=Table[{motExtracted[[i,1]],motExtracted[[i,7]]},{i,1,Length[motExtracted],1}];*)


(* ::Input:: *)
(*edgeMot[[1]]*)


(* ::Input:: *)
(*(** edge to time data -- see movement paper for derivation **)*)


(* ::Input:: *)
(*edgeTime=ToExpression[Import["data/time/m6_edge_to_transmission_span.csv","CSV"]];*)


(* ::Input:: *)
(*edgeTime[[1]]*)


(* ::Input:: *)
(*edgeToTime=Association[Table[edgeTime[[i,1]]->{edgeTime[[i,2]],edgeTime[[i,3]]},{i,1,Length[edgeTime],1}]];*)


(* ::Input:: *)
(*edgeToTime[2\[DirectedEdge]415]*)


(* ::Input:: *)
(*(** combine edge, mot pairs with edge time data to get mot, time pairs **)*)


(* ::Input:: *)
(*motTime=Reap[For[i=1,i<=Length[edgeMot],i++,*)
(*If[!KeyExistsQ[edgeToTime,edgeMot[[i,1]]],Continue[];];*)
(*Sow[{edgeMot[[i,2]],edgeToTime[edgeMot[[i,1]]]}];*)
(*]*)
(*][[2]][[1]];*)


(* ::Input:: *)
(*(** selected mots for study **)*)


(* ::Input:: *)
(*wordsOfInterest=ToExpression[Flatten[Import["data/analysis/selected-mots/a0_mots_to_study.csv"]]];*)


(* ::Input:: *)
(*wordsOfInterest*)


(* ::Input:: *)
(*(** calculate the count of each mot across 400 year time span **)*)


(* ::Input:: *)
(*counts=Table[Table[0,{i,1,400,1}],{j,1,Length[wordsOfInterest],1}];*)
(*Monitor[For[i=1,i<=Length[wordsOfInterest],i++,*)
(*woi=ToString[wordsOfInterest[[i]]];*)
(*For[j=1,j<=Length[motTime],j++,*)
(*root=motTime[[j,1]];*)
(*If[ToString[root]!=woi,Continue[]];*)
(*timespan=motTime[[j,2]];*)
(*volume=N[(1/(timespan[[2]]-timespan[[1]]+1))];*)
(*For[z=12+timespan[[1]],z<=12+timespan[[2]],z++,*)
(*If[z>400,Continue[];];*)
(*counts[[i,z]]+=volume;*)
(*];*)
(*]*)
(*],j]*)


(* ::Input:: *)
(*counts[[1]][[;;10]]*)


(* ::Input:: *)
(*(** total volume in each year **)*)


(* ::Input:: *)
(*count=Table[0,{i,1,400,1}];*)
(*Monitor[For[i=1,i<=Length[motTime],i++,*)
(*root=motTime[[i,1]];*)
(*timespan=motTime[[i,2]];*)
(*volume=N[(1/(timespan[[2]]-timespan[[1]]+1))];*)
(*For[j=12+timespan[[1]],j<=12+timespan[[2]],j++,*)
(*If[j>400,Continue[]];*)
(*count[[j]]+=volume;*)
(*];*)
(*],i]*)


(* ::Input:: *)
(*count[[;;10]]*)


(* ::Input:: *)
(*(** desired data **)*)


(* ::Input:: *)
(*dat=Table[{wordsOfInterest[[i]],Ceiling[Max[counts[[i]]]],Ceiling[Mean[counts[[i]]]],Ceiling[Median[counts[[i]]]],Ceiling[Total[counts[[i]]]],100*Max[counts[[i]]/count],Position[counts[[i]]/count,Max[counts[[i]]/count]][[1,1]]-11},{i,1,Length[wordsOfInterest],1}];*)


(* ::Input:: *)
(*dat[[1]]*)


(* ::Input:: *)
(*(** mot to transliteration **)*)


(* ::Input:: *)
(*motTransliteration=Import["data/analysis/selected-mots/a0_mots_to_study_transliterated.csv"];*)


(* ::Input:: *)
(*motTransliteration[[1]]*)


(* ::Input:: *)
(*motToTransliteration=Association[Table[motTransliteration[[i,1]]->motTransliteration[[i,2]],{i,1,Length[motTransliteration],1}]];*)


(* ::Input:: *)
(*motToTransliteration[ToString[\:062d\:062f\:062b]]*)


(* ::Input:: *)
(*For[i=1,i<=Length[dat],i++,*)
(*dat[[i,1]]=motToTransliteration[ToString[dat[[i,1]]]]*)
(*];*)


(* ::Input:: *)
(*dat[[1]]*)


(* ::Input:: *)
(*dat=SortBy[dat,#[[7]]&];*)


(* ::Input:: *)
(*For[i=1,i<=Length[dat],i++,*)
(*dat[[i,6]]=Round[dat[[i,6]],0.001];*)
(*];*)


(* ::Input:: *)
(*(*Export["data/analysis/numerical_analysis/a1_mot_numerical_analysis.csv",dat];*)*)
