///replay_demo();

//reg
//end demo

var i;
        for (i = 0; i < 30; i += 1)
        {
            if(!is_undefined(ds_map_find_value(replayinputs,string(reStep+i)+" end_demo"))) {
            instance_create(0,0,obj_end_demo);
            }

        }

//bumpers
global.r2_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.r2_key")))
global.r1_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.r1_key")))
global.l2_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.l2_key")))
global.l1_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.l1_key")))
//face buttons
global.square_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.square_key")))
global.action_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.action_key")))
global.circle_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.circle_key")))
global.triangle_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.triangle_key")))
//start and select
global.start_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.start_key")))
global.select_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.select_key")))
//arrows
global.right_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.right_key")))
global.left_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.left_key")))
global.up_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.up_key")))
global.down_key = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.down_key")))

//pressed

//bumpers
global.r2_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.r2_pressed")))
global.r1_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.r1_pressed")))
global.l2_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.l2_pressed")))
global.l1_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.l1_pressed")))
//face buttons
global.square_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.square_pressed")))
global.action_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.action_pressed")))
global.circle_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.circle_pressed")))
global.triangle_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.triangle_pressed")))
//start and select
global.start_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.start_pressed")))
global.select_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.select_pressed")))
//arrows
global.right_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.right_pressed")))
global.left_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.left_pressed")))
global.up_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.up_pressed")))
global.down_pressed = (!is_undefined(ds_map_find_value(replayinputs,string(reStep)+" global.down_pressed")))
