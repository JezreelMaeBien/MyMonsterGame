
/*
 * PlayerEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class PlayerEntity: SESpriteEntity
{
	SESprite target;
	int w;
	int h;
	int wp;
	int hp;
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();
		rsc.prepare_image("Mypacman", "cutepacman1", w*0.1, h*0.1);
		target=add_sprite_for_image(SEImage.for_resource("Mypacman"));
		wp = target.get_width();
		hp = target.get_height();
		target.move(w*0.5, h*0.5);
	}

	public void tick(TimeVal now, double delta) {
		base.tick(now, delta);
		target.move(MainScene.x, MainScene.y);		
	}
	public void cleanup() {
		base.cleanup();
	}
}
