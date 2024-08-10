function fn_handle_input() {
    // Navegación con el teclado
    if (keyboard_check_pressed(vk_up)) {
        selected_option = max(0, selected_option - 1);
    }
    if (keyboard_check_pressed(vk_down)) {
        selected_option = min(array_length(menus[current_menu]) - 1, selected_option + 1);
    }

    // Navegación con el mouse
    var _m_y = device_mouse_y_to_gui(0); // Obtener posición del mouse en coordenadas de GUI
    for (var _i = 0; _i < array_length(menus[current_menu]); _i++) {
        if (_m_y > 100 + _i * 40 && _m_y < 100 + (_i + 1) * 40) {
            selected_option = _i;
            if (mouse_check_button_pressed(mb_left)) {
                execute_option();
            }
        }
    }
	
	 // Ajuste de volumen con el teclado
    if (current_menu == 1 && selected_option == 0) {
        if (keyboard_check(vk_left)) {
            global.volume = max(0, global.volume - 0.01); // Disminuir volumen
        }
        if (keyboard_check(vk_right)) {
            global.volume = min(1, global.volume + 0.01); // Aumentar volumen
        }
        // Aplicar el ajuste de volumen
        audio_master_gain(global.volume);
    }
	
    // Selección de opción con Enter
    if (keyboard_check_pressed(vk_enter)) {
        execute_option();
    }
	// Ajustar volumen con el mouse
    if (current_menu == 1 && selected_option == 0) {
        var _m_x = device_mouse_x_to_gui(0);
        var _volume_bar_x1 = 400;
        var _volume_bar_x2 = 600; // Rango de la barra de volumen
        if (_m_x > _volume_bar_x1 && _m_x < _volume_bar_x2 && mouse_check_button(mb_left)) {
            global.volume = (_m_x - _volume_bar_x1) / (_volume_bar_x2 - _volume_bar_x1);
            audio_master_gain(global.volume);
        }
    }
}