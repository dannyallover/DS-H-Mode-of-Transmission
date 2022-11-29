(* ::Package:: *)

(* ::Title:: *)
(*Character Extraction*)


(* ::Section:: *)
(*This notebook deduces the alphabet letters, tashkeel, and non arabic characters in our corpus.*)


(* ::Input:: *)
(*(** set directory **)*)


(* ::Input:: *)
(*SetDirectory[ParentDirectory[ParentDirectory[NotebookDirectory[]]]];*)


(* ::Input:: *)
(*Directory[];*)


(* ::Input:: *)
(*(** all hadiths **)*)


(* ::Input:: *)
(*AbsoluteTiming[gkHadiths=Import["data/base/xxx_all_gk_hadiths.tsv","TSV"]];*)


(* ::Input:: *)
(*gkHadiths[[1]]*)


(* ::Input:: *)
(*gkHadiths[[1,4]]*)


(* ::Input:: *)
(*Characters[gkHadiths[[1,4]]]*)


(* ::Input:: *)
(*allChars=Monitor[Table[Characters[gkHadiths[[i,4]]],{i,1,Length[gkHadiths],1}],i];*)


(* ::Input:: *)
(*allChars=Flatten[allChars];*)


(* ::Input:: *)
(*allChars[[1]]*)


(* ::Input:: *)
(*allChars=DeleteDuplicates[allChars];*)


(* ::Input:: *)
(*allChars=Sort[allChars]*)


(* ::Input:: *)
(*Length[allChars]*)


(* ::Input:: *)
(*allChars*)


(* ::Input:: *)
(*(** manually placing into categories **)*)


(* ::Input:: *)
(*alphabet=Flatten[{allChars[[32;;56]],allChars[[58;;67]]}]*)


(* ::Input:: *)
(*Length[alphabet]*)


(* ::Input:: *)
(*tashkeel=Flatten[{allChars[[31]],allChars[[68;;75]]}]*)


(* ::Input:: *)
(*Length[tashkeel]*)


(* ::Input:: *)
(*nonArabic=Flatten[{allChars[[;;30]],allChars[[57]],allChars[[76;;99]]}]*)


(* ::Input:: *)
(*Length[nonArabic]*)


(* ::Input:: *)
(*(** export data **)*)


(* ::Input:: *)
(*(*Export["data/characters/m2_alphabet_letters.csv",alphabet];*)*)


(* ::Input:: *)
(*(*Export["data/characters/m2_tashkeel.csv",tashkeel];*)*)


(* ::Input:: *)
(*(*Export["data/characters/m2_non_arabic_characters.csv",nonArabic];*)*)
