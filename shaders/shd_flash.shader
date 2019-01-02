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
uniform float _zpos;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    //gl_Position = vec4(gl_Position.xyz/gl_Position.w,1.0);
    //gl_Position = vec4(gl_Position.xyz / gl_Position.w, gl_Position.w);
    gl_Position = vec4(gl_Position.xyz,gl_Position.w);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vPos = vec3(v_vTexcoord * gl_Position.w, gl_Position.w);
    
    float factor = 96.0;
    gl_Position.xy = floor(gl_Position.xy / gl_Position.z * factor) * gl_Position.z / factor;
    
    if(_zpos < 0.0) {
    gl_Position.z = 1.0;
    } else {
    gl_Position.z = gl_Position.z;
    }
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float _alpha;

void main()
{
    vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);
    if (Color.a != 0.0)
    {
    gl_FragColor = vec4(Color.r*_alpha, Color.g*_alpha, Color.b*_alpha, 1.0);
    }
}

