project('tinywm-vala',
    'vala', 'c',
    default_options: ['optimization=s', 'warning_level=1'])

add_project_arguments(['-pedantic'], language: 'c')

executable(
    meson.project_name(),
    'tinywm.vala',
    dependencies: [
        dependency('glib-2.0'),
        dependency('x11')
    ],
    link_args: ['-lX11']
)
