# Spiludviklingsprojekt
Udviklet af Simon S, Rolf og Holger

Dette er vores repository til DDU SO6 projektet, hvor at vi udvikler et spil til undervisningsbrug omkring raketter.

Programmet ligger både som en processsing fil, hvori man kan se koden og køre det selv, samt som en .exe fil, hvis man bare vil køre spillet.

Hvis at man vil køre koden selv i processing skal man benytte følgende libraries:


I vores kode har vi følgende funktioner
Til Raket objekt er der følgende get funktioner:
- getCurrentmass() 
    currentmass returnere en float med vægten af raketten
- getDeltaV()
    deltaV er et fysik begreb der omhandler hvor meget energi raketten har tilbage, det bliver returneret som float
- getAltitude()
    Denne funktion benyttes til at finde højden over den planet der har størst tyngdekraft (den der er tættest på). Returnere et float
- getThrottle()
    returnere et int med hvor mange procent throttle der er nu.
- getLocation()
    returnere en PVector med rakettens nuværende lokation
- getNearestplanet()
    returnere en string med navnet på den nærmeste planet
- getFuel()
    returnere hvor mange procent brændstof der er tilbage

Der er følgende set funktioner:
- setThrottle(int x)
    sætter throttelen til den nye givne int.
- setTurn(float x)
    ændrer retningen med x grader.

og der er følgende funktioner:
- engine()
    beregner motorkraften
- gravity()
    beregner tyngdekraften
- drag()
    beregner luftmodstanden
- forces()
    ligger alle tidligere krafter sammen og beregner hastighed og placering

Til Planet objekt er der følgende get funktioner:
- getPosition
    returnere positionsvektoren for planeten
- getRadius()
    returnere radiusvektoren for planeten
- getRadiusMag()
    returnere størrelsen af radiusvektoren for planeten
- getAirdensity()
    returnere densiteten af luften ved nurværende højde
- getMass()
    returnere massen af planeten