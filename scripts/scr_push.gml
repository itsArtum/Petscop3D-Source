///scr_push
//if (place_meeting(x+rl_vel/2, y+fb_vel/2, obj_bucket)) {

var whatbucket = instance_place(x+(sign(rl_vel)*8), y+(sign(fb_vel)*8), obj_bucket)
//if (place_meeting(x+(sign(hspd)*8), y+(sign(vspd)*8), obj_bucket)) {
if(instance_exists(whatbucket)){
    if (p3dc_check(collision_player, x+(sign(rl_vel)*8), y+(sign(fb_vel)*8), z+16, whatbucket.collision_bucket, whatbucket.x, whatbucket.y, whatbucket.z)) {
        pushing = true;
        show_debug_message("pushing!");
        
        if(sign(rl_vel) == 0 && sign(fb_vel) == 0){
            if(sndpushingplay == true){
                audio_sound_gain(sndpushing,0,48);
                sndpushingplay = false;
            }
        }
        
        var bucket = instance_place(x+(sign(rl_vel)*8), y+(sign(fb_vel)*8), obj_bucket)
            with (bucket) {
                    if (!p3dc_check(collision_bucket, x+obj_player_rpg.rl_vel, y, z+16, global.collision_map, 0, 0, 0) && !place_meeting(x+obj_player_rpg.rl_vel,y,obj_wall)) {
                        x += obj_player_rpg.rl_vel;
                        if(sign(obj_player_rpg.rl_vel) != 0){
                            if(obj_player_rpg.sndpushingplay == false){
                                audio_sound_gain(obj_player_rpg.sndpushing,1,1);
                                obj_player_rpg.sndpushingplay = true;
                            }
                        }
                        obj_player_rpg.rl_vel /= 1.4;
                    } else {
                    //if there is a solid object in the way maybe we overshot it, so take baby steps.
                        while (!p3dc_check(collision_bucket, x+sign(obj_player_rpg.rl_vel), y, z+16, global.collision_map, 0, 0, 0) && !place_meeting(x+sign(obj_player_rpg.rl_vel),y,obj_wall)) {
                            x += sign(obj_player_rpg.rl_vel);
                        }
                        //finally there is a solid object in front of us.
                        obj_player_rpg.rl_vel = 0;
                    }
                    
                    if (!p3dc_check(collision_bucket, x, y+obj_player_rpg.fb_vel, z+16, global.collision_map, 0, 0, 0) && !place_meeting(x,y+obj_player_rpg.fb_vel,obj_wall)) {
                        y += obj_player_rpg.fb_vel;
                        if(sign(obj_player_rpg.fb_vel) != 0){
                            if(obj_player_rpg.sndpushingplay == false){
                                audio_sound_gain(obj_player_rpg.sndpushing,1,1);
                                obj_player_rpg.sndpushingplay = true;
                            }
                        }
                        obj_player_rpg.fb_vel /= 1.4;
                    } else {
                    //if there is a solid object in the way maybe we overshot it, so take baby steps.
                        while (!p3dc_check(collision_bucket, x, y+sign(obj_player_rpg.fb_vel), z+16, global.collision_map, 0, 0, 0) && !place_meeting(x,y+sign(obj_player_rpg.fb_vel),obj_wall)) {
                            y += sign(obj_player_rpg.fb_vel);
                        }
                        //finally there is a solid object in front of us.
                        obj_player_rpg.fb_vel = 0;
                    }
            }
    }else{
        if(sndpushingplay == true){
            audio_sound_gain(sndpushing,0,48);
            sndpushingplay = false;
        }
    }
}else{
    if(sndpushingplay == true){
        audio_sound_gain(sndpushing,0,48);
        sndpushingplay = false;
    }
}
