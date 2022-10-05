#region Particle Type

//Glass Particle
var _glass = part_type_create();

part_type_sprite(_glass, spr_glassParticle, false, true, false);
part_type_life(_glass, 20, 40);
part_type_gravity(_glass, 0.2, 270);
part_type_size(_glass, 1.2, 1.2, -0.04, 0);

part_type_speed(_glass, 2, 8, 0, 0);
part_type_direction(_glass, 0, 180, 0, 0);
part_type_orientation(_glass, 0, 0, 0, 0, true);



global.ptGlass = _glass;

//// Trail Particle
//var _p = part_type_create();

//part_type_shape(_p, pt_shape_circle);
//part_type_life(_p, 40, 50);
//part_type_size(_p, 0.4, 0.4, -0.02, 0.05);

//global.ptTrail = _p;

//// Set as step
//part_type_step(global.ptBasic, 1, global.ptTrail);

//// Death explosion
//var _p = part_type_create();

//part_type_shape(_p, pt_shape_flare);
//part_type_life(_p, 30, 40);
//part_type_size(_p, 0.3, 0.4, 0.08, 0);
//part_type_alpha3(_p, 0.8, 1, 0);
//part_type_blend(_p, true);

//global.ptDeathExplosion = _p;

////Set as death
//part_type_death(global.ptBasic, 1, global.ptDeathExplosion);

#endregion