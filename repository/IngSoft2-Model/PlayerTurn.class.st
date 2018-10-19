Class {
	#name : #PlayerTurn,
	#superclass : #Object,
	#instVars : [
		'turnOrder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PlayerTurn class >> following: aTurnOrder [

	^ self new initializeFollowing: aTurnOrder
]

{ #category : #testing }
PlayerTurn >> assertIsTurnOf: aPlayer [

	turnOrder current = aPlayer
		ifFalse: [ GameException
				signal: ('<1s> can not play on turn of <2s>' expandMacrosWith: aPlayer with: turnOrder current) ]
]

{ #category : #testing }
PlayerTurn >> hasEnded [

	^ false
]

{ #category : #initialization }
PlayerTurn >> initializeFollowing: aTurnOrder [

	turnOrder := aTurnOrder
]

{ #category : #accessing }
PlayerTurn >> nextStateFor: aGame [

	^ (aGame positionOf: turnOrder current) > aGame boardLength
		ifTrue: [ GameEnded withWinner: turnOrder current ]
		ifFalse: [ turnOrder next.
			PlayerTurn following: turnOrder ]
]

{ #category : #accessing }
PlayerTurn >> winner [

	GameException signal: 'game is not finished yet'
]
