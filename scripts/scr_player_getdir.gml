///scr_player_getdir();
{
    var angry_angle = 0;
    switch(obj_player_rpg.rot){
        case spr_player_left:
            angry_angle = 0;
        break;
        case spr_player_move_left:
            angry_angle = 0;
        break;
        case spr_player_up:
            angry_angle = 90;
        break;
        case spr_player_move_up:
            angry_angle = 90;
        break;
        case spr_player_right:
            angry_angle = 180;
        break;
        case spr_player_move_right:
            angry_angle = 180;
        break;
        case spr_player_down:
            angry_angle = 270;
        break;
        case spr_player_move_down:
            angry_angle = 270;
        break;
    }
    return angry_angle;
}
