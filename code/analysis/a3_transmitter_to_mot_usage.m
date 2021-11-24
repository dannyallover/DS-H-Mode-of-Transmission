(* ::Package:: *)

(* ::Title:: *)
(*Transmitter Usage of Different Mode of Transmissions*)


(* ::Section:: *)
(*This notebook investigates the number of different mode of transmission words used by the transmitters.*)


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
(*(** number of words used by each transmitter **)*)


(* ::Input:: *)
(*numberOfWordsUsed=Table[Length[transmitterToWord[transmitters[[i]]]],{i,1,Length[transmitters],1}]*)


(* ::Input:: *)
(*(** dat: # of words, # of transmitters **)*)


(* ::Input:: *)
(*dat=Sort[Tally[numberOfWordsUsed]]*)


(* ::Input:: *)
(*Export["data/analysis/transmitter_to_mot_usage/a3_transmitter_usage_of_different_mots.csv",dat];*)
