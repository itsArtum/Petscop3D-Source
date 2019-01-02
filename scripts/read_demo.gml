///read_demo();

//create struct
replayinputs = ds_map_create();
//open file
var file = file_text_open_read("demo.demo");

//loop data
while(!file_text_eof(file)) {
    var num = file_text_read_real(file);
    var str = file_text_read_string(file);
    file_text_readln(file);
    var line = string(num) + str;
    ds_map_add(replayinputs, line, 1);
    show_debug_message(line);
}
//close file
file_text_close(file);
