#include "../volumeMaterial.glsl"

/*
contributors: Shadi El Hajj
description: |
    Volume Material Constructor.
use:
    - void volumeMaterialNew(out <volumeMaterial> _mat)
    - <volumeMaterial> volumeMaterialNew()
license: MIT License (MIT) Copyright (c) 2024 Shadi EL Hajj
*/

#ifndef FNC_VOLUME_MATERIAL_NEW
#define FNC_VOLUME_MATERIAL_NEW

void volumeMaterialNew(out VolumeMaterial _mat) {
    _mat.scattering   = vec3(1.0, 1.0, 1.0);
    _mat.absorption   = vec3(1.0, 1.0, 1.0);
    _mat.sdf     = RAYMARCH_MAX_DIST;

}

VolumeMaterial volumeMaterialNew() {
    VolumeMaterial mat;
    volumeMaterialNew(mat);
    return mat;
}

VolumeMaterial volumeMaterialNew(vec3 scattering, vec3 absorption, float sdf) {
    VolumeMaterial mat = volumeMaterialNew();
    mat.scattering = scattering;
    mat.absorption = absorption;
    mat.sdf = sdf;
    return mat;
}

VolumeMaterial volumeMaterialNew(vec3 scattering, float sdf) {
    return volumeMaterialNew(scattering, vec3(0.0, 0.0, 0.0), sdf);
}

#endif
