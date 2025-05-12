extends Node

enum GameStateEnum {Null,PlayerCanRollDice,PlayerSelectPiece,GameOver}
enum PieceStateEnum {InLobby,InWayPoint,InHouse}
enum PlayerColor {Green,Purple,Blue,Red}

var GameCurrentState = GameStateEnum.PlayerCanRollDice

signal OnGameCurrentStateChange(updatedGameState:GameStateEnum)
signal OnPlayerSelectPiece(value:Piece) #this is in use please do not remove it.

func UpdateGameCurrentState(updateGameCurrentState:GameStateEnum):
	GameCurrentState = updateGameCurrentState
	OnGameCurrentStateChange.emit(GameCurrentState)
	pass
