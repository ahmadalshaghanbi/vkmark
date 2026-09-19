glslc = find_program('glslc', native: true)
shaders = [
    'desktop.frag.glsl',
    'desktop.vert.glsl',
    'effect2d-blur.frag.glsl',
    'effect2d-edge.frag.glsl',
    'effect2d.vert.glsl',
    'light-advanced.frag.glsl',
    'light-advanced.vert.glsl',
    'light-basic-tex.frag.glsl',
    'light-basic-tex.vert.glsl',
    'light-basic.frag.glsl',
    'light-basic.vert.glsl',
    'light-cel.frag.glsl',
    'light-phong.frag.glsl',
    'light-phong.vert.glsl',
    'vkcube.frag.glsl',
    'vkcube.vert.glsl',
]

shader_targets = []
shader_debug = get_option('debug')
shader_options = [ '--target-env=vulkan1.0' ]
if shader_debug
  shader_options += '-g'
endif

foreach file : shaders
    parts = file.split('.')
    partlen = parts.length()

    if partlen < 3
        error('Malformed shader filename {}'.format(file))
    endif

    basename   = []
    shadertype = parts[partlen - 2]
    extension  = '.'.join([ parts[partlen - 2], parts[partlen - 1] ])
    stage = ''

    if shadertype == 'vert' or shadertype == 'vertex'
        stage = 'vertex'
    elif shadertype == 'frag' or shadertype == 'fragment'
        stage = 'fragment'
    elif shadertype == 'cmp' or shadertype == 'comp' or shadertype == 'cpt' or shadertype == 'cmpt'
        stage = 'compute'
    endif

    shader_targets += custom_target(
        file.underscorify() + '_' + shadertype + '_spv',
        input:   file,
        output:  '@BASENAME@.spv',
        command: [ glslc ] + shader_options + [ '-fshader-stage=' + stage, '-o', '@OUTPUT@', '@INPUT@' ],
        build_by_default: true,
        install: true,
        install_dir: join_paths([get_option('datadir'), 'vkmark/shaders'])
    )
endforeach

