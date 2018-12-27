//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPos;

void main()
{
    float factor = 96.0;
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    //gl_Position = vec4(gl_Position.xyz/gl_Position.w,1.0);
    //gl_Position = vec4(gl_Position.xyz / gl_Position.w, gl_Position.w);
    gl_Position = vec4(gl_Position.xyz,gl_Position.w);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vPos = vec3(v_vTexcoord * gl_Position.w, gl_Position.w);
    gl_Position.xy = floor(gl_Position.xy / gl_Position.z * factor) * gl_Position.z / factor;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~

//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPos;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vPos.xy / v_vPos.z );
}

