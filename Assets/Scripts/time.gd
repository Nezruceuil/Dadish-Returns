extends Control

@onready var time_1: Label = $time_1
@onready var time_2: Label = $time_2
@onready var time_3: Label = $time_3
@onready var time_4: Label = $time_4
@onready var time_5: Label = $time_5
@onready var time_6: Label = $time_6
@onready var time_7: Label = $time_7
@onready var time_8: Label = $time_8
@onready var time_9: Label = $time_9
@onready var time_10: Label = $time_10
@onready var time_11: Label = $time_11
@onready var time_12: Label = $time_12
@onready var time_13: Label = $time_13
@onready var time_14: Label = $time_14
@onready var time_15: Label = $time_15
@onready var time_16: Label = $time_16
@onready var time_17: Label = $time_17
@onready var time_18: Label = $time_18
@onready var time_19: Label = $time_19
@onready var time_20: Label = $time_20
@onready var time_21: Label = $time_21
@onready var time_22: Label = $time_22
@onready var time_23: Label = $time_23
@onready var time_24: Label = $time_24
@onready var time_25: Label = $time_25
@onready var time_26: Label = $time_26
@onready var time_27: Label = $time_27
@onready var time_28: Label = $time_28
@onready var time_29: Label = $time_29
@onready var time_30: Label = $time_30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_1.text = str(PlayerData.times[0]*0.01)
	time_2.text = str(PlayerData.times[1]*0.01)
	time_3.text = str(PlayerData.times[2]*0.01)
	time_4.text = str(PlayerData.times[3]*0.01)
	time_5.text = str(PlayerData.times[4]*0.01)
	time_6.text = str(PlayerData.times[5]*0.01)
	time_7.text = str(PlayerData.times[6]*0.01)
	time_8.text = str(PlayerData.times[7]*0.01)
	time_9.text = str(PlayerData.times[8]*0.01)
	time_10.text = str(PlayerData.times[9]*0.01)
	time_11.text = str(PlayerData.times[10]*0.01)
	time_12.text = str(PlayerData.times[11]*0.01)
	time_13.text = str(PlayerData.times[12]*0.01)
	time_14.text = str(PlayerData.times[13]*0.01)
	time_15.text = str(PlayerData.times[14]*0.01)
	time_16.text = str(PlayerData.times[15]*0.01)
	time_17.text = str(PlayerData.times[16]*0.01)
	time_18.text = str(PlayerData.times[17]*0.01)
	time_19.text = str(PlayerData.times[18]*0.01)
	time_20.text = str(PlayerData.times[19]*0.01)
	time_21.text = str(PlayerData.times[20]*0.01)
	time_22.text = str(PlayerData.times[21]*0.01)
	time_23.text = str(PlayerData.times[22]*0.01)
	time_24.text = str(PlayerData.times[23]*0.01)
	time_25.text = str(PlayerData.times[24]*0.01)
	time_26.text = str(PlayerData.times[25]*0.01)
	time_27.text = str(PlayerData.times[26]*0.01)
	time_28.text = str(PlayerData.times[27]*0.01)
	time_29.text = str(PlayerData.times[28]*0.01)
	time_30.text = str(PlayerData.times[29]*0.01)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
