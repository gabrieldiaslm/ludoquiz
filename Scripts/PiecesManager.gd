class_name PiecesManager
extends Node2D

@export var BluePieces : PlayerPiecesGroup
@export var PurplePieces : PlayerPiecesGroup
@export var GreenPieces : PlayerPiecesGroup
@export var RedPieces : PlayerPiecesGroup
	
func IsGameOver() -> bool:
	for player in get_children():
		if player is PlayerPiecesGroup and player.HasThisPlayerCompleted():
			return true
	return false

func GetPieceGroupBasedOnType(playerColor:GameManager.PlayerColor)->PlayerPiecesGroup:
	match playerColor:
		GameManager.PlayerColor.Green:
			return GreenPieces
		GameManager.PlayerColor.Purple:
			return PurplePieces
		GameManager.PlayerColor.Blue:
			return BluePieces
		GameManager.PlayerColor.Red:
			return RedPieces
		_:
			return null
		


func HasThisPlayerUnlockedTurn(playerColor:GameManager.PlayerColor)-> bool:
	match playerColor:
		GameManager.PlayerColor.Green:
			return GreenPieces.HasUnlockedAnyPiece()
		GameManager.PlayerColor.Purple:
			return PurplePieces.HasUnlockedAnyPiece()
		GameManager.PlayerColor.Blue:
			return BluePieces.HasUnlockedAnyPiece()
		GameManager.PlayerColor.Red:
			return RedPieces.HasUnlockedAnyPiece()

	return false

func PlayAnimationByPlayerIndex(playerColor:GameManager.PlayerColor)->void:
	
	match playerColor:
		GameManager.PlayerColor.Green:
			GreenPieces.PlayAllPieceAnimation()
			pass
		GameManager.PlayerColor.Purple:
			PurplePieces.PlayAllPieceAnimation()
			pass
		GameManager.PlayerColor.Blue:
			BluePieces.PlayAllPieceAnimation()
			pass
		GameManager.PlayerColor.Red:
			RedPieces.PlayAllPieceAnimation()
			pass
	pass

func StopAnimation()->void:
	GreenPieces.StopAllPieceAnimation()
	PurplePieces.StopAllPieceAnimation()
	BluePieces.StopAllPieceAnimation()
	RedPieces.StopAllPieceAnimation()
	pass
