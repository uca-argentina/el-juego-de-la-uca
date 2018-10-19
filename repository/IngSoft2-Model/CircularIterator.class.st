Class {
	#name : #CircularIterator,
	#superclass : #Object,
	#instVars : [
		'iteratee',
		'currentIndex'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CircularIterator class >> over: aCollection [

	^ self new initializeOver: aCollection
]

{ #category : #accessing }
CircularIterator >> current [

	^ iteratee at: currentIndex
]

{ #category : #initialization }
CircularIterator >> initializeOver: aCollection [

	iteratee := aCollection asOrderedCollection.
	currentIndex := 1
]

{ #category : #accessing }
CircularIterator >> next [

	currentIndex := currentIndex + 1.
	currentIndex > iteratee size
		ifTrue: [ currentIndex := 1 ].
	^ self current
]
