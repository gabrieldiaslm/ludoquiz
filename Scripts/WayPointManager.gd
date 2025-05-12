class_name WayPointsManager

extends Node2D

@export var main_path:Node2D
@export var green_path: Array[WayPoint]
@export var purple_path: Array[WayPoint]
@export var blue_path: Array[WayPoint]
@export var red_path: Array[WayPoint]

func GetPositionOfThisPoint(index: int,playerColor:GameManager.PlayerColor)->Vector2:
	var positionLocal:Vector2 = Vector2.ZERO
	match playerColor:
		GameManager.PlayerColor.Green:
			positionLocal = green_path[index].position
			pass
		GameManager.PlayerColor.Purple:
			positionLocal = purple_path[index].position
			pass
		GameManager.PlayerColor.Blue:
			positionLocal = blue_path[index].position
			pass
		GameManager.PlayerColor.Red:
			positionLocal = red_path[index].position
			pass
		pass
	return positionLocal
	
func GetCount(playerColor:GameManager.PlayerColor) -> int:
	match playerColor:
		GameManager.PlayerColor.Green:
			return green_path.size()
		GameManager.PlayerColor.Purple:
			return purple_path.size()
		GameManager.PlayerColor.Blue:
			return blue_path.size()
		GameManager.PlayerColor.Red:
			return red_path.size()
	return -1

func SetPieceToThisWayPoint(index:int, piece:Piece)->void:
	var wayPoint:WayPoint = null
	
	match piece.CurrentPlayerColor:
		GameManager.PlayerColor.Green:
			for item:WayPoint in main_path.get_children():
				if(item == green_path[index]): 
					wayPoint = item;
					pass
				pass
			if index >=52:
				wayPoint = green_path[index]
				pass
		GameManager.PlayerColor.Purple:
			for item:WayPoint in main_path.get_children():
				if(item == purple_path[index]): 
					wayPoint = item;
					pass
				pass
			if index >=52:
				wayPoint = purple_path[index]
				pass
		GameManager.PlayerColor.Blue:
			for item:WayPoint in main_path.get_children():
				if(item == blue_path[index]): 
					wayPoint = item;
					pass
				pass
			if index >=52:
				wayPoint = blue_path[index]
				pass
		GameManager.PlayerColor.Red:
			for item:WayPoint in main_path.get_children():
				if(item == red_path[index]): 
					wayPoint = item;
					pass
				pass
			if index >=52:
				wayPoint = red_path[index]
				pass
		pass
		
	if wayPoint == null:
		push_error("waypoint should not be null!!!")
		pass
	print("set piece :",index," player :",piece.CurrentPlayerColor," Waypoint : ",wayPoint.name)
	piece.CurrentWayPoint = wayPoint
	wayPoint.SetPiece(piece)
	pass
