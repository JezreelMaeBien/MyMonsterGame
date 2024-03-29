
/*
 * MainScene.eq
 * Generated by Eqela Studio 2.0b7.4
 */

public class MainScene : SEScene
{
	SESprite Background;
	int SceneWidth;
	int SceneHeight;
	public static int x;
	public static int y;
	public static double Player_height;
	public static double Player_width;
	SEEntity player;
	SESprite text;
	public static int score = 0;
	String display;
	public static bool gameover = false;
	public void initialize(SEResourceCache rsc) {

		int i;
		base.initialize(rsc);
		SceneWidth = get_scene_width();
		SceneHeight = get_scene_height();

		rsc.prepare_image("mybg", "background", SceneWidth, SceneHeight);
		Background = add_sprite_for_image(SEImage.for_resource("mybg"));
		Background.move(0,0);
		player = add_entity(new PlayerEntity());
		for(i = 0; i < 7; i++) {
			add_entity(new MonsterEntity());	
		}
		//AudioClipManager.play("mysound");		
		rsc.prepare_font("myfont","arial bold color=#F8F8FF", 40);
		display = "Score = %d".printf().add(Primitive.for_integer(score)).to_string();
		text = add_sprite_for_text(display, "myfont");
		text.move(0, get_scene_height()-text.get_height());
	}	
	public void on_pointer_move(SEPointerInfo pi) {
		base.on_pointer_move(pi);
		x = pi.get_x();
		y = pi.get_y();
		score++;
		display = "Score = %d".printf().add(Primitive.for_integer(score)).to_string();
		text.set_text(display,"myfont");
		if(gameover == true) {
			switch_scene(new GameOver());
		}		
	}
	
	public void cleanup() {
		base.cleanup();
	}
}
