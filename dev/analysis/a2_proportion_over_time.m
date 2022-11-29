(* ::Package:: *)

(* ::Title:: *)
(*Mode of Transmission Proportion over Time*)


(* ::Section:: *)
(*This notebook takes the mode of transmission root words and tracks the proportion in which that word occurs in each year, repeating this process across our 400 year time span.*)


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
(*(** turn counts into ratios and add years **)*)


(* ::Input:: *)
(*dat=Reap[For[i=1,i<=Length[counts],i++,*)
(*data=counts[[i]]/count;*)
(*data=Table[{j-12,data[[j]]},{j,1,Length[data],1}];*)
(*data=Insert[data,{year,ratio},1];*)
(*Sow[data];*)
(*]][[2]][[1]];*)


(* ::Input:: *)
(*dat[[1]][[;;10]]*)


(* ::Input:: *)
(*(** export desired data in accordance to the word's tier **)*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear1/a2_qal_proportion_in_each_year.csv",dat[[3]]];*)*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear1/a2_hdth_proportion_in_each_year.csv",dat[[2]]]*);*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear1/a2_'en_proportion_in_each_year.csv",dat[[1]]];*)*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear2/a2_akhbr_proportion_in_each_year.csv",dat[[4]]];*)*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear2/a2_anba_proportion_in_each_year.csv",dat[[5]]]*);*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear2/a2_an_proportion_in_each_year.csv",dat[[7]]];*)*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear3/a2_sal_proportion_in_each_year.csv",dat[[9]]];*)*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear3/a2_sm'e_proportion_in_each_year.csv",dat[[6]]];*)*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear3/a2_dkr_proportion_in_each_year.csv",dat[[10]]]*);*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear3/a2_raa_proportion_in_each_year.csv",dat[[8]]];*)*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear3/a2_qra_proportion_in_each_year.csv",dat[[11]]];*)*)


(* ::Input:: *)
(*(*Export["data/analysis/proportions/tear3/a2_ktb_proportion_in_each_year.csv",dat[[12]]];*)*)
