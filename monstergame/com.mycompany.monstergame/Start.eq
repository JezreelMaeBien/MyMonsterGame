

/*
 * Start
 * Created by Eqela Studio 2.0b7.4
 */

public class Start : SEScene
{
	SESprite text;
	String display;
	SESprite mbg;
	
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
			rsc.prepare_image("Mymainbg","mainbg", get_scene_width(), get_scene_height());
				mbg = add_sprite_for_image(SEImage.for_resource("Mymainbg"));
		mbg.move(0,0);
		rsc.prepare_font("myfont","Segoe UI color=#ecf0f1 outline-color=#34495e", 70);
		display = "Click to Play!";
		text = add_sprite_for_text(display, "myfont");
		text.move((get_scene_width()*0.5)-(text.get_width()*0.5),(get_scene_height()*0.5)-(text.get_height()*0.5));		
	}

	public void cleanup() {
		base.cleanup();
	}
	public void on_pointer_press(SEPointerInfo pi) {
		base.on_pointer_press(pi);
		switch_scene(new MainScene());
	}	
}
