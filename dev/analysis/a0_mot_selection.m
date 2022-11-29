(* ::Package:: *)

(* ::Title:: *)
(*Mode of Transmission Selection*)


(* ::Section:: *)
(*There are many mode of transmission words in our corpus. We want to analyze the most prevalent mode of transmission words. Here we deduce them by selecting the most popular mode of transmission words.*)


(* ::Input:: *)
(*(** set directory **)*)


(* ::Input:: *)
(*SetDirectory[ParentDirectory[ParentDirectory[NotebookDirectory[]]]];*)


(* ::Input:: *)
(*Directory[];*)


(* ::Input:: *)
(*(** all root mots**)*)


(* ::Input:: *)
(*motsRoots=ToExpression[Import["/Users/dannyhalawi/Desktop/other/research/mode-of-transmission/data/mots/root-mots/m1_all_mots_root_words.csv"]];*)


(* ::Input:: *)
(*motsRoots[[1]]*)


(* ::Input:: *)
(*roots=DeleteDuplicates[motsRoots[[;;,2]]];*)


(* ::Input:: *)
(*roots[[1]]*)


(* ::Input:: *)
(*(** number of root mots **)*)


(* ::Input:: *)
(*Length[roots]*)


(* ::Input:: *)
(*(** tranmsission to selected mot **)*)


(* ::Input:: *)
(*tMots=Import["data/mots/extracted-mots/m4_edge_id_position_sliced-isnad_possible_mots_selected_mot_and_selected_mot_root_word.csv"];*)


(* ::Input:: *)
(*tMots[[1]]*)


(* ::Input:: *)
(*(** calculate the count of each root **)*)


(* ::Input:: *)
(*rootToCount=Association[Table[roots[[i]]->0,{i,1,Length[roots],1}]];*)


(* ::Input:: *)
(*For[i=1,i<=Length[tMots],i++,*)
(*root=tMots[[i,7]];*)
(*root=ToExpression[root];*)
(*rootToCount[root]++;*)
(*];*)


(* ::Input:: *)
(*rootCount=Table[{roots[[i]],rootToCount[roots[[i]]]},{i,1,Length[roots],1}];*)


(* ::Input:: *)
(*rootCount=Reverse[SortBy[rootCount,#[[2]]&]];*)


(* ::Input:: *)
(*rootCount[[1]]*)


(* ::Input:: *)
(*(** select the top 26 words to for analysis **)*)


(* ::Input:: *)
(*wordsSelected=rootCount[[;;26,1]];*)


(* ::Input:: *)
(*wordsSelected*)


(* ::Input:: *)
(*(*Export["data/analysis/selected-mots/a0_mots_to_study.csv",wordsSelected];*)*)
