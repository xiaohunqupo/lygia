/*
function: gaussianBlur1D_fast13
original_author: Matt DesLauriers
description: adapted versions of gaussian fast blur 13 from https://github.com/Jam3/glsl-fast-gaussian-blur
use: gaussianBlur1D_fast13(<sampler2D> texture, <float2> st, <float2> pixel_direction)
options:
    - SAMPLER_FNC(TEX, UV): optional depending the target version of GLSL (texture2D(...) or texture(...))
    - GAUSSIANBLUR1D_FAST13_TYPE
    - GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(POS_UV)
*/

#ifndef SAMPLER_FNC
#define SAMPLER_FNC(TEX, UV) tex2D(TEX, UV)
#endif

#ifndef GAUSSIANBLUR1D_FAST13_TYPE
#ifdef GAUSSIANBLUR_TYPE
#define GAUSSIANBLUR1D_FAST13_TYPE GAUSSIANBLUR_TYPE
#else
#define GAUSSIANBLUR1D_FAST13_TYPE float4
#endif
#endif

#ifndef GAUSSIANBLUR1D_FAST13_SAMPLER_FNC
#ifdef GAUSSIANBLUR_SAMPLER_FNC
#define GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(POS_UV) GAUSSIANBLUR_SAMPLER_FNC(POS_UV)
#else
#define GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(POS_UV) SAMPLER_FNC(tex, POS_UV)
#endif
#endif

#ifndef FNC_GAUSSIANBLUR1D_FAST13
#define FNC_GAUSSIANBLUR1D_FAST13
GAUSSIANBLUR1D_FAST13_TYPE gaussianBlur1D_fast13(in sampler2D tex, in float2 st, in float2 offset) {
    float2 off1 = float2(1.411764705882353,1.411764705882353) * offset;
    float2 off2 = float2(3.2941176470588234, 3.2941176470588234) * offset;
    float2 off3 = float2(5.176470588235294, 5.176470588235294) * offset;
    GAUSSIANBLUR1D_FAST13_TYPE color = GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(st) * .1964825501511404;
    color += GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(st + (off1)) * .2969069646728344;
    color += GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(st - (off1)) * .2969069646728344;
    color += GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(st + (off2)) * .09447039785044732;
    color += GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(st - (off2)) * .09447039785044732;
    color += GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(st + (off3)) * .010381362401148057;
    color += GAUSSIANBLUR1D_FAST13_SAMPLER_FNC(st - (off3)) * .010381362401148057;
    return color;
}
#endif