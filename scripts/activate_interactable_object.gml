///activate_interactable_object();

var interactable = instance_place(x,y,obj_interactable);

// if we have input and there is a interactable
if (global.action_pressed && interactable != noone) {
    with (interactable) {
        event_user(0);
    }
}
