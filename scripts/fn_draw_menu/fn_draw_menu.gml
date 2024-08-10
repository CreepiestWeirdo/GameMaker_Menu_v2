function fn_draw_menu() {
    draw_clear(c_black);
    var _menu = menus[current_menu];

    for (var _i = 0; _i < array_length(_menu); _i++) {
        if (_i == selected_option) {
            draw_set_color(c_yellow);
        } else {
            draw_set_color(c_white);
        }
        draw_text(100, 100 + _i * 40, _menu[_i]);
    }

    // Mostrar barra y valor de volumen si estás en la opción de ajustar volumen
    if (current_menu == 1 && selected_option == 0) {
        draw_text(100, 100 + selected_option * 40, "Ajustar Volumen: " + string(round(global.volume * 100)) + "%");
        
        // Dibujar barra de volumen
        var _volume_bar_x1 = 400;
        var _volume_bar_x2 = 600;
        var _bar_y = 100 + selected_option * 40;
        draw_set_color(c_white);
        draw_rectangle(_volume_bar_x1, _bar_y + 10, _volume_bar_x2, _bar_y + 20, false);
        draw_set_color(c_yellow);
        draw_rectangle(_volume_bar_x1, _bar_y + 10, _volume_bar_x1 + global.volume * (_volume_bar_x2 - _volume_bar_x1), _bar_y + 20, false);
    }
}