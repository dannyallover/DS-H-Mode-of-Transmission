(* ::Package:: *)

(* ::Title:: *)
(*Mode of Transmission Root Words*)


(* ::Section:: *)
(*This notebook takes the derived mode of transmission words and matches them to the corresponding root word, automatically. After, we manually validate the results.*)


(* ::Input:: *)
(*(** set directory **)*)


(* ::Input:: *)
(*SetDirectory[ParentDirectory[ParentDirectory[ParentDirectory[NotebookDirectory[]]]]];*)


(* ::Input:: *)
(*Directory[];*)


(* ::Input:: *)
(*(** root words for main mots -- we manually assigned the root words here **)*)


(* ::Input:: *)
(*motsRoot=ToExpression[Import["data/mots/root-mots/m1_main_mots_root_words.csv","CSV"]];*)


(* ::Input:: *)
(*motsRoot[[1]]*)


(* ::Input:: *)
(*(** root words for low priority mots -- we manually assigned the root words here **)*)


(* ::Input:: *)
(*motsLowPriorityRoot=ToExpression[Import["data/mots/root-mots/m1_low_priority_root_words.csv","CSV"]];*)


(* ::Input:: *)
(*motsLowPriorityRoot[[1]]*)


(* ::Input:: *)
(*(** root words for derived mots -- we manually assigned the root words here **)*)


(* ::Input:: *)
(*motsDerivedRoot=ToExpression[Import["data/mots/root-mots/m1_derived_main_mots_root_words.csv"]];*)


(* ::Input:: *)
(*motsDerivedRoot[[1]]*)


(* ::Input:: *)
(*(** note: after this, we did a manual validation **)*)


(* ::Input:: *)
(*(** all mots to root words **)*)


(* ::Input:: *)
(*allMotsRoot=Flatten[{motsRoot,motsLowPriorityRoot,motsDerivedRoot},1];*)


(* ::Input:: *)
(*allMotsRoot[[1]]*)


(* ::Input:: *)
(*Length[allMotsRoot]*)


(* ::Input:: *)
(*(*Export["data/mots/root-mots/m1_all_mots_root_words.csv",allMotsRoot];*)*)
