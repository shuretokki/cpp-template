project(
  'project',
  'cpp',
  version : '0.1',
  meson_version : '>= 1.3.0',
  default_options : [
    'cpp_std=c++23',
    'warning_level=3',
    'buildtype=debugoptimized',
  ]
)

exe = executable( 'project',
  'src/main.cpp',
  dependencies: [
    dependency('spdlog'),
  ],
  install : true,
)

