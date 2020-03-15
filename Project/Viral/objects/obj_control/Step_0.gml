
if (keyboard_check_pressed(ord("R")))
    game_restart();
    
if (keyboard_check_pressed(vk_escape))
    game_end();
    
if (keyboard_check(vk_control) && keyboard_check_pressed(ord("I")))
{
    screen_save(working_directory+"Screenshot_"+string(current_time)+".png");
    show_debug_message("Screenshot saved.")
}
