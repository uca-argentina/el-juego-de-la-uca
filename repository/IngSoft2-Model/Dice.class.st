Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'numberProvider',
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Dice class >> withSides: aNumberOfSides [

	^ self withSides: aNumberOfSides numbersProvidedBy: Random new
]

{ #category : #'instance creation' }
Dice class >> withSides: aNumberOfSides numbersProvidedBy: aNumberProvider [

	^ self new
		initializeWithSides: aNumberOfSides
		numbersProvidedBy: aNumberProvider
]

{ #category : #initialization }
Dice >> initializeWithSides: aNumberOfSides numbersProvidedBy: aNumberProvider [

	sides := aNumberOfSides.
	numberProvider := aNumberProvider
]

{ #category : #accessing }
Dice >> roll [

	^ numberProvider nextInt: sides
]

{ #category : #accessing }
Dice >> sides [

	^ sides
]
