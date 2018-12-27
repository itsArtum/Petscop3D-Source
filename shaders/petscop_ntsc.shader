attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vFragCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vFragCoord = in_Position.xy;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
float HorizonalBlur = 0.0004;
float VerticalBlur  = 0.0002;
float ColorBlur     = 0.0015;
float Squigliness   = 0.005;

uniform sampler2D mult;
uniform sampler2D squig;
uniform sampler2D overlay;
uniform float squiginv;

vec4 blur(sampler2D image, vec2 uv, float size1, float size2){
    vec2 tc0 = uv + vec2(       0.0,   size2*4.0);
    vec2 tc1 = uv + vec2( size1    ,  -size2*3.0);
    vec2 tc2 = uv + vec2( size1*2.0,  -size2*2.0);
    vec2 tc3 = uv + vec2( size1*3.0,   size2    );
    vec2 tc4 = uv + vec2( size1*4.0,         0.0);
    vec2 tc5 = uv + vec2(-size1    ,  -size2*4.0);
    vec2 tc6 = uv + vec2(-size1*2.0,   size2*2.0);
    vec2 tc7 = uv + vec2(-size1*3.0,  -size2    );
    vec2 tc8 = uv + vec2(-size1*4.0,         0.0);

    vec4 col0 = texture2D(image, tc0);
    vec4 col1 = texture2D(image, tc1);
    vec4 col2 = texture2D(image, tc2);
    vec4 col3 = texture2D(image, tc3);
    vec4 col4 = texture2D(image, tc4);
    vec4 col5 = texture2D(image, tc5);
    vec4 col6 = texture2D(image, tc6);
    vec4 col7 = texture2D(image, tc7);
    vec4 col8 = texture2D(image, tc8);

    vec4 sum = (col0 + col1 + col2 + col3 + col4 + col5 + col6 + col7 + col8) / 9.0;

    return sum;
}

vec4 multfunc(vec4 img1, vec4 img2)
{
    if(img1.r > 0.5) { img1.r = 1.0 - ((1.0 - img1.r) * (1.0 - img2.r) * 2.0); } else { img1.r = img1.r * img2.r * 2.0; }
    if(img1.g > 0.5) { img1.g = 1.0 - ((1.0 - img1.g) * (1.0 - img2.g) * 2.0); } else { img1.g = img1.g * img2.g * 2.0; }
    if(img1.b > 0.5) { img1.b = 1.0 - ((1.0 - img1.b) * (1.0 - img2.b) * 2.0); } else { img1.b = img1.b * img2.b * 2.0; }
    return img1;
}

void main()
{
    vec2 uv = v_vTexcoord;
    vec4 col = blur(gm_BaseTexture, uv, HorizonalBlur, VerticalBlur) * texture2D(mult, uv) * 2.0;
    uv += vec2(((texture2D(squig, uv * 0.46875).g - 0.5) * squiginv) * (col.g - col.r) * Squigliness, 0.0);
    col = blur(gm_BaseTexture, uv, HorizonalBlur, VerticalBlur);
    vec4 blr = blur(gm_BaseTexture, uv, ColorBlur, VerticalBlur);
    gl_FragColor = multfunc((blr + (col.r + col.g + col.b - blr.r - blr.g - blr.b) / 3.0) * texture2D(mult, uv) * 2.0,  texture2D(overlay, uv * 0.46875));
}
