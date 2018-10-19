Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'dices',
		'boardLength',
		'positions',
		'state'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withDices: aDiceCollection onBoardOfLength: aBoardLength playedBy: aPlayerCollection [

	^ self new
		initializeWithDices: aDiceCollection
		onBoardOfLength: aBoardLength
		playedBy: aPlayerCollection
]

{ #category : #accessing }
Game >> boardLength [

	^ boardLength
]

{ #category : #playing }
Game >> changePositionOf: aPlayer by: aNumberOfPlaces [

	self
		changePositionOf: aPlayer
		to: (self positionOf: aPlayer) + aNumberOfPlaces
]

{ #category : #playing }
Game >> changePositionOf: aPlayer to: aPosition [

	positions at: aPlayer put: aPosition
]

{ #category : #testing }
Game >> hasEnded [

	^ state hasEnded
]

{ #category : #initialization }
Game >> initializeWithDices: aDiceCollection onBoardOfLength: aBoardLength playedBy: aPlayerCollection [

	dices := aDiceCollection.
	boardLength := aBoardLength.
	state := PlayerTurn following: (CircularIterator over: aPlayerCollection).
	positions := Dictionary new
]

{ #category : #accessing }
Game >> positionOf: aPlayer [

	^ positions at: aPlayer ifAbsentPut: [ 1 ]
]

{ #category : #playing }
Game >> rollDicesFor: aPlayer [

	state assertIsTurnOf: aPlayer.
	self changePositionOf: aPlayer by: (dices sumNumbers: #roll).
	state := state nextStateFor: self
]

{ #category : #accessing }
Game >> winner [

	^ state winner
]
