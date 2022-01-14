#!/bin/bash

adds () {
#	adds= add silencieux
	unset SOMME
	
	pterm=$1
	sterm=$2
#	echo pterm + sterm $((pterm+sterm)) 

	export SOMME=$((pterm+sterm))

#	echo pterm + sterm =$((SOMME))

}
add () {

        unset SOMME

        pterm=$1
        sterm=$2
#       echo pterm + sterm $((pterm+sterm)) 

        export SOMME=$((pterm+sterm))
 
	echo pterm + sterm =$((SOMME))

}
sub () {

	unset DIFFERENCE

	pterm=$1
	sterm=$2
	echo pterm - sterm $((pterm-sterm))

	 export DIFFERENCE=$((pterm-sterm))


}
muls () {
#	muls=multiplication silenceuse
	unset PRODUIT

	pterm=$1
	sterm=$2
	
	produit=0
	
	
	for index in `seq 1 $sterm`
	do
	#	produit=$((pterm+produit))
		adds $pterm $produit
		produit=$SOMME
	done
	
	echo 'pterm * sterm =' $produit

	export PRODUIT=$produit


}
mul () {

        unset PRODUIT

        pterm=$1
        sterm=$2

        produit=0


        for index in `seq 1 $sterm`
        do
        #       produit=$((pterm+produit))
                adds $pterm $produit
                produit=$SOMME
        done

        echo 'pterm * sterm =' $produit

        export PRODUIT=$produit


}

puissance () {

	unset PUISSANCE
	ndp=$1
	#ndp = nombre de la puissance
	exposant=$2
	
	produit=1
	
	
	for index in `seq 1 $exposant`
	do
	#	produit=$((ndp*produit))
		muls $ndp $produit
		produit=$PRODUIT
	
	done
	
	echo 'ndp puissance exposant =' $produit
	
	export PUISSANCE=$produit


}
div () {

	unset QUOTIENT

	dividende=$1
	diviseur=$2

	if [ "$dddiviseur" -eq 0 ]
        then
                echo "'Division par 0 interdite !!!"
                return 1
        fi


	quotient=0

	while [ "$dividende" -ge "$diviseur" ]
	do
		dividende=$(("dividende - diviseur"))
		quotient=$((quotient+1)) 
		echo 'division =' $quotient
	
	done

	echo 'division =' $quotient

	export QUOTIENT=$quotient

}
dddiv () {
#	dddiv= dix decimales division
	
	unset DQUOTIENT

	dddividende=$1
	dddiviseur=$2

	if [ "$dddiviseur" -eq 0 ]
	then
		echo "'Division par 0 interdite !!!"
		return 1
	fi


	quotient=0
	quotient2=0

        while [ "$dddividende" -ge "$dddiviseur" ]
        do
                dddividende=$(("dddividende - dddiviseur"))
                quotient=$((quotient+1))
#                echo 'dddivision =' $quotient
	done

#	echo 'crash test' $dddividende

	while [ "$dddividende" -gt 0 -a "$dddividende" -lt "$dddiviseur" -a "$quotient2" -lt 1000000000 ]
	do
		mul $dddividende 10
		dddividende=$PRODUIT
		
		 mul $quotient2 10
                quotient2=$PRODUIT


		 while [ "$dddividende" -ge "$dddiviseur" ]
		 do
                	dddividende=$(("dddividende - dddiviseur"))
			quotient2=$((quotient2+1))
#			echo dddividende=$dddividende quotient2=$quotient2
        	done

	done


        echo 'division =' $quotient ',' $quotient2

        export QUOTIENT=$quotient','$quotient2

}
