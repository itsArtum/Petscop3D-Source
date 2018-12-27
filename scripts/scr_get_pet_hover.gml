///scr_get_pet_hover(xpos,ypos);
xpos = clamp(argument0,0,1);
ypos = clamp(argument1,0,4);
if(in = 0) {
if(xpos = 1 && ypos = 0) {
ds_grid_set(petgrid, 1, 0, 1);
} else {
ds_grid_set(petgrid, 1, 0, 0);
}
if(xpos = 1 && ypos = 1) {
ds_grid_set(petgrid, 1, 1, 1);
} else {
ds_grid_set(petgrid, 1, 1, 0);
}
if(xpos = 1 && ypos = 2) {
ds_grid_set(petgrid, 1, 2, 1);
} else {
ds_grid_set(petgrid, 1, 2, 0);
}
if(xpos = 1 && ypos = 3) {
ds_grid_set(petgrid, 1, 3, 1);
} else {
ds_grid_set(petgrid, 1, 3, 0);
}
if(xpos = 1 && ypos = 4) {
ds_grid_set(petgrid, 1, 4, 1);
} else {
ds_grid_set(petgrid, 1, 4, 0);
}

if(xpos = 0 && ypos = 0) {
ds_grid_set(petgrid, 0, 0, 1);
} else {
ds_grid_set(petgrid, 0, 0, 0);
}
if(xpos = 0 && ypos = 1) {
ds_grid_set(petgrid, 0, 1, 1);
} else {
ds_grid_set(petgrid, 0, 1, 0);
}
if(xpos = 0 && ypos = 2) {
ds_grid_set(petgrid, 0, 2, 1);
} else {
ds_grid_set(petgrid, 0, 2, 0);
}
if(xpos = 0 && ypos = 3) {
ds_grid_set(petgrid, 0, 3, 1);
} else {
ds_grid_set(petgrid, 0, 3, 0);
}
if(xpos = 0 && ypos = 4) {
ds_grid_set(petgrid, 0, 4, 1);
} else {
ds_grid_set(petgrid, 0, 4, 0);
}

}
