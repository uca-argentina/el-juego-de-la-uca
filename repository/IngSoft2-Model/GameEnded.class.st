Class {
	#name : #GameEnded,
	#superclass : #Object,
	#instVars : [
		'player'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
GameEnded class >> withWinner: aPlayer [

	^ self new initializeWithWinner: aPlayer
]

{ #category : #testing }
GameEnded >> hasEnded [

	^ true
]

{ #category : #initialization }
GameEnded >> initializeWithWinner: aPlayer [

	player := aPlayer
]

{ #category : #accessing }
GameEnded >> winner [

	^ player
]
