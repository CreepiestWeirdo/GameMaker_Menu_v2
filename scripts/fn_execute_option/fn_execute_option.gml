function execute_option() {
    if (current_menu == 0) { // Menú principal
        if (selected_option == 0) {
            room_goto(rm_game); // Cambiar a la room de juego
        } else if (selected_option == 1) {
            current_menu = 1; // Ir al menú de configuraciones
            selected_option = 0;
        } else if (selected_option == 2) {
            game_end(); // Salir del juego
        }
    } else if (current_menu == 1) { // Menú de configuraciones
        if (selected_option == 0) { // Ajustar volumen
            // El ajuste de volumen se maneja con el mouse, ver más abajo
        } else if (selected_option == 1) { // Fullscreen / Windowed
            window_set_fullscreen(!window_get_fullscreen());
        } else if (selected_option == 2) {
            current_menu = 0;
            selected_option = 0;
        }
    }
}