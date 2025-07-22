use bevy::prelude::*;
use wasm_bindgen::prelude::*;

#[wasm_bindgen(start)]
pub fn run() {
    App::new()
        .add_plugins(DefaultPlugins.set(WindowPlugin {
            primary_window: Some(Window {
                title: "Hello Bevy WASM".into(),
                canvas: Some("#bevy".into()),
                ..default()
            }),
            ..default()
        }))
        .add_systems(Startup, setup)
        .run();
}

fn setup(mut commands: Commands) {
    commands.spawn(Camera2d);
    
    commands.spawn((
        Text::new("Hello, Bevy WASM!"),
        TextFont {
            font_size: 40.0,
            ..default()
        },
        TextColor(Color::WHITE),
        Node {
            position_type: PositionType::Absolute,
            top: Val::Px(50.0),
            left: Val::Px(50.0),
            ..default()
        },
    ));
}