///save_demo();
var file = file_text_open_write("demo.demo");

for(var i = 0; i < ds_list_size(recordedinputs); i++){
    file_text_write_string(file,ds_list_find_value(recordedinputs,i));
    file_text_writeln(file);
}
//close file
file_text_close(file);
//delete list
ds_list_destroy(recordedinputs);
