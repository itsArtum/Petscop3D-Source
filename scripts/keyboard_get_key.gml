///keyboard_get_key(row,coloumn);
var w = argument0;
var h = argument1;

var char_store = ds_grid_create(13, 6);

for(var i = 0; i <= 12; i++;){
    ds_grid_set(char_store,i,0,chr(65+i));
    ds_grid_set(char_store,i,1,chr(78+i));
    ds_grid_set(char_store,i,2,chr(97+i));
    ds_grid_set(char_store,i,3,chr(110+i));
    ds_grid_set(char_store,clamp(i,0,9),4,chr(clamp(i,0,9)+48));
}
ds_grid_set(char_store,10,4," ");
ds_grid_set(char_store,11,4,".");
ds_grid_set(char_store,12,4,"!");

ds_grid_set(char_store,0,5,"?");
ds_grid_set(char_store,1,5,",");
ds_grid_set(char_store,2,5,";");
ds_grid_set(char_store,3,5,":");
ds_grid_set(char_store,4,5,'"');
ds_grid_set(char_store,5,5,"'");
ds_grid_set(char_store,6,5,"(");
ds_grid_set(char_store,7,5,")");
ds_grid_set(char_store,8,5,"/");
ds_grid_set(char_store,9,5,"-");
ds_grid_set(char_store,10,5,"+");
ds_grid_set(char_store,11,5,"DEL");
ds_grid_set(char_store,12,5," ");

return ds_grid_get(char_store,clamp(w,0,12),clamp(h,0,5));
//return char_store[# w, h];
ds_grid_destroy(char_store);
