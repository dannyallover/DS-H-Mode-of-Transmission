(* ::Package:: *)

(* ::Title:: *)
(*Mode of Transmission Usage by Transmitters*)


(* ::Section:: *)
(*This notebook maps the mode of transmission words to two values:*)
(*(1) the number of transmitters who used it*)
(*(2) the average number of uses across the transmitters*)


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
(*(** transmitter to word **)*)


(* ::Input:: *)
(*transmitters=DeleteDuplicates[motExtracted[[;;,1]][[;;,1]]];*)


(* ::Input:: *)
(*transmitters[[1]]*)


(* ::Input:: *)
(*transmitterToWord=Association[Table[transmitters[[i]]->{},{i,1,Length[transmitters],1}]];*)


(* ::Input:: *)
(*Monitor[For[i=1,i<=Length[edgeMot],i++,*)
(*teacher=edgeMot[[i,1,1]];*)
(*wordList=transmitterToWord[teacher];*)
(*wordList=DeleteDuplicates[Append[wordList,edgeMot[[i,2]]]];*)
(*transmitterToWord[teacher]=wordList;*)
(*],i];*)


(* ::Input:: *)
(*transmitterToWord[99999]*)


(* ::Input:: *)
(*(** selected mots for study **)*)


(* ::Input:: *)
(*wordsOfInterest=ToExpression[Flatten[Import["data/analysis/selected-mots/a0_mots_to_study.csv"]]];*)


(* ::Input:: *)
(*wordsOfInterest*)


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
(*(**dat: mot, number of transmitters used, percent of transmitters used **)*)


(* ::Input:: *)
(*dat=Reap[For[i=1,i<=Length[wordsOfInterest],i++,*)
(*word=wordsOfInterest[[i]];*)
(*count=0;*)
(*For[j=1,j<=Length[transmitters],j++,*)
(*words=transmitterToWord[transmitters[[j]]];*)
(*If[!MemberQ[ToExpression[words],ToExpression[word]],Continue[];];*)
(*count++;*)
(*];*)
(*Sow[{motToTransliteration[ToString[word]],count,Round[100*(count/Length[transmitters]),0.001]}];*)
(*]][[2]][[1]];*)


(* ::Input:: *)
(*dat[[1]]*)


(* ::Input:: *)
(*dat=Reverse[SortBy[dat,#[[3]]&]];*)


(* ::Input:: *)
(*dat*)


(* ::Input:: *)
(*(*Export["data/analysis/mot_to_transmitter_usage/a4_mot_to_transmitter_usage.csv",dat];*)*)
