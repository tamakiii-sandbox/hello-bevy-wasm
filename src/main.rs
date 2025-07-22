use bevy::prelude::*;

fn main() {
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

fn setup(mut commands: Commands, asset_server: Res<AssetServer>) {
    commands.spawn(Camera2dBundle::default());
    
    commands.spawn(TextBundle::from_section(
        "Hello, Bevy WASM!",
        TextStyle {
            font_size: 40.0,
            color: Color::WHITE,
            ..default()
        },
    ).with_style(Style {
        position_type: PositionType::Absolute,
        top: Val::Px(50.0),
        left: Val::Px(50.0),
        ..default()
    }));
}