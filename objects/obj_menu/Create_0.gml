menus = [
    ["Jugar", "Configuraciones", "Salir"], // Menú principal
    ["Ajustar volumen", "Fullscreen / Windowed", "Volver"] // Menú de configuraciones
];

// Variable para controlar en qué menú estás
current_menu = 0; // 0 para menú principal, 1 para configuraciones

// Variable para la selección actual dentro del menú
selected_option = 0;

global.volume = 1; // Volumen inicial al 100%
