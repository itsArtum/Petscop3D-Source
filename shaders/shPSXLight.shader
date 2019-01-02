//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec3 v_vNormal;
varying vec3 v_vPosition;
varying vec3 v_vPosition_uv;
varying vec4 v_vColour;
varying float v_diffuse;
//varrying float v_fog;
uniform vec3 pos;
uniform float radius;
uniform vec3 colour;
uniform vec3 colour_alt;

varying vec3 v_vPosWorld;

// Precise method, which guarantees v = v1 when t = 1.
float lerp(float v0, float v1, float to) {
      return (1.0 - to) * v0 + to * v1;
}

void main()
{
    float factor = 96.0;
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    gl_Position = vec4(gl_Position.xyz,gl_Position.w);
    gl_Position.xy = floor(gl_Position.xy / gl_Position.z * factor) * gl_Position.z / factor;//(floor(gl_Position.x/2.7)*2.7);
    //gl_Position.y = (floor(gl_Position.y/2.7)*2.7);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vPosition = in_Position;
    v_vPosition_uv = vec3(v_vTexcoord * gl_Position.w, gl_Position.w);
    v_vNormal = in_Normal;

    vec4 world_position_o = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    //mat3(model_matrix) * in_position;//careful here
    vec4 world_normal_o = normalize(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Normal.x,in_Normal.y,in_Normal.z,0.0));
 
    vec3 world_position = vec3(world_position_o.x,world_position_o.y,world_position_o.z);
    vec3 world_normal = vec3(world_normal_o.x,world_normal_o.y,world_normal_o.z);
    
    //don't forget to normalize
    //vec3 L = normalize((pos) - world_position);//light direction
    vec4 world_position_b = gm_Matrices[MATRIX_WORLD] * object_space_pos;
    vec3 mw = vec3(world_position_b.x,world_position_b.y,world_position_b.z);
    
    vec3 L = ((pos) - mw);//light direction
    float attenuation = max( 1.0 - length(L)/radius, 0.0);
    float lighting = (dot( normalize(v_vNormal), normalize(L)) * 0.5 + 0.5) * attenuation;
    
    //Lambert term
    //float LdotN = max(0.0, dot(L,world_normal));
    //consider diffuse light color white(1,1,1)
    //all color channels have the same float value
    //float diffuse_a = LdotN;//material_kd * LdotN;
    
    v_diffuse = lighting;
    
    v_vPosWorld = (gm_Matrices[MATRIX_WORLD] * object_space_pos).xyz;

    // Get the fog intendity per-vertex, rather than per-pixel.
    //v_fog = 1.0 - clamp( (distance(v_vPosWorld,pos)/radius),0.0,1.0);
    
    //pass light to fragment shader
    //v_vColour = vec4(diffuse_a,diffuse_a,diffuse_a,in_Colour.a); //+ specular;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec3 v_vPosition_uv;
varying vec3 v_vNormal;
varying vec4 v_vColour;
varying float v_diffuse;
//varrying float v_fog;

uniform vec3 pos;
uniform float radius;
uniform vec3 colour;
uniform vec3 colour_alt;

varying vec3 v_vPosWorld;

// turns out that mix was actually lerp this whole time.

void main()
{
    vec2 uv = v_vPosition_uv.xy / v_vPosition_uv.z;

    //Original Light Code
    /*
    vec4 tempcolor = vec4(colour.x,colour.y,colour.z,1.0);
    float red = mix(colour_alt.x,(tempcolor * texture2D( gm_BaseTexture, uv)).x,v_diffuse);
    float green = mix(colour_alt.y,(tempcolor * texture2D( gm_BaseTexture, uv)).y,v_diffuse);
    float blue = mix(colour_alt.z,(tempcolor * texture2D( gm_BaseTexture, uv)).z,v_diffuse);
    float alpha = (v_vColour * texture2D( gm_BaseTexture, uv)).a;
    */
    
    vec4 tempcolor = vec4(colour.x,colour.y,colour.z,1.0);

    float dist = 1.0 - clamp( (distance(v_vPosWorld,pos)/radius),0.0,1.0);

    // Sample the texture once, and reuse it's values.
    vec4 baseTexture = texture2D( gm_BaseTexture, uv).xyzw;
    
    float red = mix(colour_alt.x, (tempcolor.x * baseTexture.x), dist);
    float green = mix(colour_alt.y, (tempcolor.y * baseTexture.y), dist);
    float blue = mix(colour_alt.z, (tempcolor.z * baseTexture.z), dist);
    float alpha = (v_vColour * baseTexture).a;
    
    gl_FragColor = vec4(red,green,blue,alpha);

}


