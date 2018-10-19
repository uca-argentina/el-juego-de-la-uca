Class {
	#name : #FixedNumberProvider,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'Instance Creation' }
FixedNumberProvider class >> returning: anInteger [

	^ self new initializeReturning: anInteger
]

{ #category : #accessing }
FixedNumberProvider >> changeNumberTo: anInteger [

	value := anInteger
]

{ #category : #initialization }
FixedNumberProvider >> initializeReturning: anInteger [

	value := anInteger
]

{ #category : #accessing }
FixedNumberProvider >> nextInt: anInteger [

	^ value
]
