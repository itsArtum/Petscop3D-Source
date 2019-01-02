///scr_draw_pet_menu(x,y,pet_id_0-9,mode,frame,petobj);

//mode 0 = no wiggle no movement just stationary.
//mode 1 = hovering over option
//mode 2 = move to left
//mode 3 = move to right
//mode 4 = approach center and do text box

var startx = argument0;
var starty = argument1;
var petid = argument2;
var mode = argument3;
var frame = argument4;
var petobj = object_get_name(argument5);
var caught;
//is caught?
var _save_data = ds_map_find_value(obj_manager.save_data,petobj);
if(!is_undefined(_save_data) && _save_data==true) {
    var caught = true;
} else {
    var caught = false;
}
//draw modes
if(mode = 0) {
    if(caught) {
        draw_sprite(spr_pet_button,0,startx,starty);
        draw_sprite(petid,1,startx,starty);
        draw_sprite(petid,2,startx,starty);
    } else {
        draw_sprite(spr_pet_button,0,startx,starty);
        draw_sprite(petid,0,startx,starty);
        draw_sprite(spr_null_pet_menu,2,startx,starty);
    }
}

if(mode = 1) {
    if(caught) {
        draw_sprite(spr_pet_button,1,startx-xmod,starty-ymod);
        draw_sprite_ext(spr_pet_button,2,startx-xmod,starty-ymod,1,1,0,c_white,scr_sine_so(1,1,demotime));
        draw_sprite(petid,1,startx-3-xmod,starty-3-ymod);
        draw_sprite(petid,2,startx-3,starty-3);
        
        if(in = false) {
        if(global.action_pressed) {
            in = true;
            inmove = true;
        }
        }
        
    } else {
        draw_sprite(spr_pet_button,1,startx-xmod,starty-ymod);
        draw_sprite_ext(spr_pet_button,2,startx-xmod,starty-ymod,1,1,0,c_white,scr_sine_so(1,1,demotime));
        draw_sprite(petid,0,startx-3-xmod,starty-3-ymod);
        draw_sprite(spr_null_pet_menu,2,startx-3,starty-3);
        
        if(in = false) {
        if(global.action_pressed) {
            audio_play_sound(snd_pause_error,10,false);
        }
        }
        
    }

}

if(mode = 2) {
    var posx = ease_inout_sine(argument0,-146-32,clamp(frame/28,0,1));

    if(caught) {
        draw_sprite(spr_pet_button,0,posx,starty);
        draw_sprite(petid,1,posx,starty);
        draw_sprite(petid,2,posx,starty);
    } else {
        draw_sprite(spr_pet_button,0,posx,starty);
        draw_sprite(petid,0,posx,starty);
        draw_sprite(spr_null_pet_menu,2,posx,starty);
    }
}

if(mode = 3) {
    var posx = ease_inout_sine(argument0,446+32,clamp(frame/28,0,1));

    if(caught) {
        draw_sprite(spr_pet_button,0,posx,starty);
        draw_sprite(petid,1,posx,starty);
        draw_sprite(petid,2,posx,starty);
    } else {
        draw_sprite(spr_pet_button,0,posx,starty);
        draw_sprite(petid,0,posx,starty);
        draw_sprite(spr_null_pet_menu,2,posx,starty);
    }
}


if(mode = 4) {
    var posx = ease_inout_sine(argument0,72,clamp((frame-32)/28,0,1));
    var posy = ease_inout_sine(argument1,4,clamp((frame-32)/28,0,1));

    if(petid = spr_amber_pet_menu) {
    if (pausepage == 0) pausestr = "Amber is a young ball."
    if (pausepage == 1) pausestr = "She's afraid to leave home. If her#home is good, this is not a problem."
    if (pausepage == 2) pausestr = "She is very heavy, and that makes#her life a little harder, as well as#yours."
    if (pausepage == 3) pausestr = "What's the safest place you can#put her in? You should start#thinking about that."
    pausepageend = 3;
    }
    if(petid = spr_pen_pet_menu) {
    if (pausepage == 0) pausestr = "Pen is an aspiring mathematician."
    if (pausepage == 1) pausestr = "She's entirely deaf. She doesn't#even know what sound is, let alone#music."
    if (pausepage == 2) pausestr = "I don't know what she's doing#here."
    pausepageend = 2;
    }
    if(petid = spr_toneth_pet_menu) {
    if (pausepage == 0) pausestr = "(Enter a description here)"
    if (pausepage == 1) pausestr = "---"
    if (pausepage == 2) pausestr = "- A bird. I think I forgot what#birds look like."
    if (pausepage == 3) pausestr = '- "Funny stupid blob monster"#'+ "says Mike. That's what it is."
    if (pausepage == 4) pausestr = "- Painter. Painting puzzle."
    if (pausepage == 5) pausestr = "- Catch Randice first(?)"
    if (pausepage == 6) pausestr = "- Has broken leg for some reason.#I already hung him on a wall, too#late to take it back. It makes me#think about the dog actually.#Because when the car hit him I#thought " + '"at least it will be over#soon."' + " He survived it, and I was#the only one who still wanted to#put him down.A dog is an innocent" 
    if (pausepage == 7) pausestr = "When that dog wags its tail and it#it appears happy, it's not real."
    if (pausepage == 8) pausestr = "I guess that's toneth then.#toneth toneth toneth toneth#toneth toneth toneth toneth#toneth toneth toneth toneth#toneth toneth toneth toneth#toneth. the end. it's yucky outside."
    pausepageend = 8;
    }
    if(petid = spr_wavey_pet_menu) {
    if (pausepage == 0) pausestr = "(Enter a description here)"
    if (pausepage == 1) pausestr = "---"
    if (pausepage == 2) pausestr = "- Wavey is a small raincloud."
    if (pausepage == 3) pausestr = "- He's a bit absentminded#and needs help to keep#concentrated."
    if (pausepage == 4) pausestr = "- You'll need a lot of#patience with him."
    pausepageend = 4;
    }
    if(petid = spr_randice_pet_menu) {
    if (pausepage == 0) pausestr = "(Enter a description here)"
    if (pausepage == 1) pausestr = "---"
    if (pausepage == 2) pausestr = "- Randice is a well tended#flower."
    if (pausepage == 3) pausestr = "- She needs help from her#friend wavey to stay#healthy."
    if (pausepage == 4) pausestr = "- She's very shy and tends#to hide from new#people she meets."
    if (pausepage == 5) pausestr = "- You should try to help#her with that."
    pausepageend = 5;
    }
    if(petid = spr_roneth_pet_menu) {
    if (pausepage == 0) pausestr = "Roneth is Toneth's baby#half-brother."
    if (pausepage == 1) pausestr = "Because he's younger, he gets to#learn from all of Toneth's#mistakes."
    if (pausepage == 2) pausestr = "That's why he always looks both#ways."
    if (pausepage == 3) pausestr = "He doesn't get into trouble. You#won't have to watch him all the#time. He's good."
    pausepageend = 3;
    }
    if(petid = spr_carenlm_pet_menu) {
    if (pausepage == 0) pausestr = "Care NLM escaped from the#school's basement and wandered#the Newmaker Plane for days."
    if (pausepage == 1) pausestr = "To catch her, you had to lie, but it#may not be a lie forever."
    if (pausepage == 2) pausestr = "You're the Newmaker. You can#turn Care NLM into Care A, and#close the loop."
    pausepageend = 2;
    }
    if(petid = spr_carea_pet_menu) {
    if (pausepage == 0) pausestr = "When the emergency began, you#were all looking for Care A."
    if (pausepage == 1) pausestr = "I told you all, we would never find#Care A. When Care A goes missing,#she goes missing forever."
    if (pausepage == 2) pausestr = "My brother didn't want us to find#him, because he knew we were all#looking for Michael A."
    if (pausepage == 3) pausestr = "I'm back. This is my present for#you."
    if (pausepage == 4) pausestr = "I started it in 1996, for Marvin."
    if (pausepage == 5) pausestr = "If you think they're worth any#effort, see if you can save Care#B, or Care NLM. Care B is in the#school, of course."
    if (pausepage == 6) pausestr = "Fuck you all, and fuck me as well.#Merry Christmas. Check your#bathroom now."
    if (pausepage == 7) pausestr = "- Rainer"
    pausepageend = 7;
    }
    if(petid = spr_careb_pet_menu) {
    if (pausepage == 0) pausestr = "(Enter a description here)"
    if (pausepage == 1) pausestr = "---"
    if (pausepage == 2) pausestr = "- If you think they're worth any#effort, see if you can save Care#B, or Care NLM. Care B is in the#school, of course."
    pausepageend = 2;
    }
    
    if(panim = 60) {
        draw_sprite(spr_pet_textbox,0,0,0);
        draw_set_halign(fa_top);
        draw_set_valign(fa_left);
        draw_set_colour(c_black);
        //draw_text_custom(34,98,string_copy(pausestr,0,pausestrcount),1,c_black )

        draw_text_ext(34,96,string_copy(pausestr,0,pausestrcount),16,100000);
        draw_set_colour(c_white);
        
        if(string_char_at(pausestr,pausestrcount) = "." || string_char_at(pausestr,pausestrcount) = "," || string_char_at(pausestr,pausestrcount) = "?") {
        pausestrcount += .05
        } else {
        pausestrcount += .5;
        }
        
        if(global.action_pressed) {
            if(string_length(string_copy(pausestr,0,pausestrcount)) < string_length(pausestr)) {
                pausestrcount = string_length(pausestr);
            } else if(string_length(string_copy(pausestr,0,pausestrcount)) = string_length(pausestr)) {
                if(pausepage = pausepageend) {
                pausepage = 0;
                pausestrcount = 0;
                inmove = false;
                } else {
                pausepage++;
                pausestrcount = 0;
                }
            }
        }
        
        pausepage = clamp(pausepage,0,pausepageend);
        pausestrcount = clamp(pausestrcount,0,string_length(pausestr));
    }
    var dtime = floor(demotime/360)*(45*8)
    draw_sprite(spr_pet_button,1,posx-xmod,posy-ymod);
    draw_sprite_ext(spr_pet_button,2,posx-xmod,posy-ymod,1,1,0,c_white,scr_sine_so(1,1,demotime));
    draw_sprite(petid,1,posx-3-xmod,posy-3-ymod);
    draw_sprite(petid,2,posx-3,posy-3);
}
