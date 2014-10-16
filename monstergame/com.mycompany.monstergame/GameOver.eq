
/*
 * GameOver
 * Created by Eqela Studio 2.0b7.4
 */

public class GameOver : SEScene
{
	SESprite text;
	String display;
	SESprite mbg2;
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		
		rsc.prepare_image("mymainbg","GOpacman", get_scene_width(), get_scene_height());
		mbg2 = add_sprite_for_image(SEImage.for_resource("mymainbg"));
		mbg2.move(0,0);

	
		rsc.prepare_font("myfont","Segoe UI color=#ecf0f1 outline-color=#34495e", 70);
		display = "Score = %d".printf().add(Primitive.for_integer(MainScene.score)).to_string();
		text = add_sprite_for_text(display, "myfont");
		text.move((get_scene_width()*0.5)-(text.get_width()*0.5),(get_scene_height()*0.5)-(text.get_height()*0.5));		
	}
	public void on_pointer_press(SEPointerInfo pi) {
		base.on_pointer_move(pi);		
	}
	public void cleanup() {
		base.cleanup();
	}
}
