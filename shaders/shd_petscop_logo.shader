attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                    // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec3 v_vNormal;
varying vec3 v_vPos;
varying vec4 v_vColour;

void main()
{
    float factor = 96.0;
    vec4 object_space_pos = vec4( in_Position.xyz, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    gl_Position = vec4(gl_Position.xyz,gl_Position.w);
    
    v_vTexcoord = in_TextureCoord;
    v_vNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal,0.0)).xyz;
    v_vPos = vec3(v_vTexcoord * gl_Position.w, gl_Position.w);
    v_vColour = in_Colour;
    
    gl_Position.xy = floor(gl_Position.xy / gl_Position.z * factor) * gl_Position.z / factor;
    //gl_Position.y = (ceil(gl_Position.y/1.7)*1.7);
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec3 v_vNormal;
varying vec3 v_vPosition;
varying vec4 v_vColour;

void main()
{
    vec3 dir = vec3( 0.0, 0.8, 0.6);//Light direction
    vec3 col = vec3( 1.0, 1.0, 1.0);//Light color
    float lighting = dot( normalize(v_vNormal), normalize(dir)) * 0.5 + 0.5;//Calculate lighting
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord) * vec4( lighting * col, 1.0);
}
