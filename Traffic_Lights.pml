mtype = {Red, Yellow, Green};
bit Turn = 0;
mtype Color[2];

/*
proctype Light(bit myId) {
	bit otherId = 1 - myId;
	do
	:: (Turn == myId && Color[myId] == Red) -> Color[myId] = Green
	:: (Color[myId] == Green) -> Color[myId] = Yellow
	:: (Color[myId] == Yellow) -> Color[myId] = Red; Turn = otherId
	od
}
*/
proctype Light(bit myId) {
	bit otherId = 1 - myId;
	do
	:: (Turn == myId && Color[myId] == Red) -> Color[myId] = Green
	:: (Color[myId] == Green) -> Color[myId] = Yellow
	:: (Color[myId] == Yellow) -> Color[myId] = Red; Turn = otherId
	od
}

init { 
	Color[0] = Red; 
	Color[1] = Red;
	atomic{run Light(0); run Light(1)}
}

ltl { [](<>( Color[0]==Green )) }
//ltl {[]!(Color[0]==Green && Color[1]==Green)}
