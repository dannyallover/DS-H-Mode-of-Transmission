(* ::Package:: *)

(* ::Title:: *)
(*Mode of Transmission Words*)


(* ::Section:: *)
(*This notebook deduces the mode of transmission words found in our corpus.*)


(* ::Text:: *)
(*note: we got the mode of transmission words by following this process:*)
(*	(1) put known mode of transmission words in a list*)
(*	(2) using (1) do a string match on sliced isnad text*)
(*	(3) for any unparsed isnad text, manually investigate and add mot word to (1)*)
(*	(4) once all isnad text is parsed do manual validation*)
(*		note: in doing (4) we came up with a set of heuristics to improve accuracy for parsing (e.g. in our 			validation we found that some mots should have lower priority (e.g. \:0623\:0646), so we categorize the words 			accordingly) -- see the next notebook for more details *)
(*	(5) lastly, we find that many mots can be derived by simply following certain patterns:*)
(*		a) alif replacement: replace \:0623 with \:0627 and \:0627 with \:0623 to generate new mots*)
(*		b) insert letters in the front: add \:0648, \:0641, \:0644, \:0641\:0648, \:0648\:0641, \:0648\:0648, \:0641\:0641, \:0644\:0623, \:0644\:0627, \:064a, and \:0628 to the front of existing mots*)
(*	extra note: we find that sometimes mots take on multiple words (e.g. fee katabee) but we limited it to 		one word.*)


(* ::Input:: *)
(*(** set directory **)*)


(* ::Input:: *)
(*SetDirectory[ParentDirectory[ParentDirectory[ParentDirectory[NotebookDirectory[]]]]];*)


(* ::Input:: *)
(*Directory[];*)


(* ::Input:: *)
(*(**we will show the results of the above process below**)*)


(* ::Input:: *)
(*(** main mode of transmission words**)*)


(* ::Input:: *)
(*mots=ToExpression[Flatten[Import["data/mots/mot-corpus/m0_main_mots.csv"]]];*)


(* ::Input:: *)
(*mots*)


(* ::Input:: *)
(*Length[mots]*)


(* ::Input:: *)
(*(** low priority mode of transmission words**)*)


(* ::Input:: *)
(*motsLowPriority=ToExpression[Flatten[Import["data/mots/mot-corpus/m0_low_priority_mots.csv"]]];*)


(* ::Input:: *)
(*motsLowPriority*)


(* ::Input:: *)
(*Length[motsLowPriority]*)


(* ::Input:: *)
(*(** derived (from main mots) mode of transmission words**)*)


(* ::Input:: *)
(*motsDerived=ToExpression[Import["/Users/dannyhalawi/Desktop/other/research/mode-of-transmission/data/mots/mot-corpus/m0_derived_main_mots.csv"]];*)


(* ::Input:: *)
(*motsDerived*)


(* ::Input:: *)
(*Length[motsDerived]*)
