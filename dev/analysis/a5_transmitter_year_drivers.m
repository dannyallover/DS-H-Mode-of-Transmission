(* ::Package:: *)

(* ::Title:: *)
(*Mode of Transmission Transmitter Drivers by Year*)


(* ::Section:: *)
(*This notebook maps each mot and year to the transmitter that used it most in that year.*)


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
(*(** transmitter to birth and death date **)*)


(* ::Input:: *)
(*transmitterBDDDFixed=Import["data/time/m5_transmitter_birth_death_range_evaluated_and_birth_assumed.csv","CSV"]*)


(* ::Input:: *)
(*transmitterBDDDFixed[[1]]*)


(* ::Input:: *)
(*transmitterToDates=Association[Table[Floor[transmitterBDDDFixed[[i,1]]]->{transmitterBDDDFixed[[i,2]],transmitterBDDDFixed[[i,3]]},{i,1,Length[transmitterBDDDFixed],1}]];*)


(* ::Input:: *)
(*transmitterToDates[1]*)


(* ::Input:: *)
(*(** get list of transmitters **)*)


(* ::Input:: *)
(*transmitters=VertexList[Flatten[ToExpression[Import["data/base/xxx_city_network_edges.csv","CSV"]],1]];*)


(* ::Input:: *)
(*transmitters[[1]]*)


(* ::Input:: *)
(*(** transmitter to words **)*)


(* ::Input:: *)
(*transmitterToWords=Association[Table[transmitters[[i]]->{},{i,1,Length[transmitters],1}]];*)


(* ::Input:: *)
(*Monitor[For[i=1,i<=Length[edgeMot],i++,*)
(*student=edgeMot[[i,1,2]];*)
(*If[!KeyExistsQ[transmitterToWords,student],Continue[];];*)
(*wordList=transmitterToWords[student];*)
(*wordList=Append[wordList,edgeMot[[i,2]]];*)
(*transmitterToWords[student]=wordList;*)
(*],i];*)


(* ::Input:: *)
(*transmitterToWords[415]*)


(* ::Input:: *)
(*(** selected mots for study **)*)


(* ::Input:: *)
(*wordsOfInterest=ToExpression[Flatten[Import["data/analysis/selected-mots/a0_mots_to_study.csv"]]];*)


(* ::Input:: *)
(*wordsOfInterest*)


(* ::Input:: *)
(*(** narrow to tier 1, 2, and 3 words **)*)


(* ::Input:: *)
(*wordsOfInterest={\:062d\:062f\:062b,\:0639\:0646,\:0642\:0627\:0644,\:0623\:062e\:0628\:0631,\:0623\:0646\:0628\:0623,\:0627\:0646,\:0633\:0645\:0639,\:0633\:0623\:0644,\:0631\:0627\:0649,\:0630\:0643\:0631,\:0642\:0631\:0623,\:0643\:062a\:0628};*)


(* ::Input:: *)
(*(** narrow our study to the first 400 years, forumating 10 year buckets **)*)


(* ::Input:: *)
(*wordTransmitter10YearBuckets=Table[Table[null,{i,1,400/10,1}],{j,1,Length[wordsOfInterest],1}];*)


(* ::Input:: *)
(*Monitor[For[i=1,i<=Length[wordsOfInterest],i++,*)
(*word=ToString[wordsOfInterest[[i]]];*)
(*For[j=1,j<=400/10,j++,*)
(*score=0;*)
(*tt=null;*)
(*startSpan=(j-2)*10;*)
(*endSpan=(j-1)*10;*)
(*For[z=1,z<=Length[transmitters],z++,*)
(*t=transmitters[[z]];*)
(*wordList=transmitterToWords[t];*)
(*count=Count[wordList,word];*)
(*startT=transmitterToDates[t][[1]];*)
(*endT=transmitterToDates[t][[2]];*)
(*actualStart=Max[startSpan,startT];*)
(*actualEnd=Min[endSpan,endT];*)
(*percent=(actualEnd-actualStart)/10;*)
(*If[startT>endSpan||startSpan>endT,percent=0;];*)
(*wordTransmitter10YearBuckets[[i,j]]=tt;*)
(*If[(count*percent)>score,score=(count*percent);tt=t;];*)
(*];*)
(*];*)
(*];,{i,j}]*)


(* ::Input:: *)
(*wordTransmitter10YearBuckets*)


(* ::Input:: *)
(*Length[wordTransmitter10YearBuckets]*)


(* ::Input:: *)
(*dat=Table[{(i-2)*10,(i-1)*10,wordTransmitter10YearBuckets[[1,i]],wordTransmitter10YearBuckets[[2,i]],wordTransmitter10YearBuckets[[3,i]],wordTransmitter10YearBuckets[[4,i]],wordTransmitter10YearBuckets[[5,i]],wordTransmitter10YearBuckets[[6,i]],wordTransmitter10YearBuckets[[7,i]],wordTransmitter10YearBuckets[[8,i]],wordTransmitter10YearBuckets[[9,i]],wordTransmitter10YearBuckets[[10,i]],wordTransmitter10YearBuckets[[11,i]],wordTransmitter10YearBuckets[[12,i]]},{i,1,400/10,1}];*)


(* ::Input:: *)
(*dat[[1]]*)


(* ::Input:: *)
(*dat*)


(* ::Input:: *)
(*(*Export["data/analysis/driving_transmitters/a5_mot_10_year_bucket_driving_transmitters.csv",dat];*)*)
