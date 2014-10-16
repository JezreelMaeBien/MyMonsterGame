
/*
 * MonsterEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class MonsterEntity: SESpriteEntity
{
	SESprite monster;
	int w;
	int h;
	int wp;
	int hp;
	int mx;
	int my;
	int npx;
	int npy;
	double speed;
	double chance;
	SESprite text;
	public void initialize(SEResourceCache rsc) {

		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();
		chance = Math.random(0, 100);
		if(chance <= 25){
			rsc.prepare_image("MyMonster", "blue", w*0.1, h*0.1);
			monster=add_sprite_for_image(SEImage.for_resource("MyMonster"));
		}
		else if(chance <= 50)
		{
			rsc.prepare_image("MyMonster2", "red", w*0.1, h*0.1);
			monster=add_sprite_for_image(SEImage.for_resource("MyMonster2"));
		}
		else if(chance <= 75)
		{
			rsc.prepare_image("MyMonster3", "red", w*0.1, h*0.1);
			monster=add_sprite_for_image(SEImage.for_resource("MyMonster3"));
		}
		else if(chance <= 100)
		{
			rsc.prepare_image("MyMonster4", "green", w*0.1, h*0.1);
			monster=add_sprite_for_image(SEImage.for_resource("MyMonster4"));
		}							
		
		wp = monster.get_width();
		hp = monster.get_height();
		mx = monster.get_x();
		my = monster.get_y();
		npx = MainScene.x;
		npy = MainScene.y;
		monster.move(Math.random(0, w), Math.random(0, h));
		speed = Math.random(100, 200);
		rsc.prepare_font("myfont","arial bold color=#003300", 40);
	}	
	public void tick(TimeVal now, double delta) {
		base.tick(now, delta);
		monster.move(monster.get_x()+(MainScene.x-monster.get_x())/speed, monster.get_y()+(MainScene.y-monster.get_y())/speed);
		speed--;
		if(speed <= 10) {
			speed = Math.random(50, 100);
		}
		wp = monster.get_width();
		hp = monster.get_height();
		mx = monster.get_x();
		my = monster.get_y();
		npx = MainScene.x;
		npy = MainScene.y;
		if(npx >= mx && npx <= wp+mx) {
			if(npy >= my && npy <= hp+my) {
				game_over();				
			}
		}
	}
	public void game_over() {
		String display = "Game Over!";
		text = add_sprite_for_text(display, "myfont");
		text.move(get_scene_width()*0.5, get_scene_height()*0.5);
		MainScene.gameover = true;
	}

	public void cleanup() {
		base.cleanup();
	}	
}
