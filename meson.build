project('tinywm-vala', 'vala', 'c')

add_project_arguments('--debug', language: 'vala')

executable(
    meson.project_name(),
    'tinywm.vala',
    dependencies: [
        dependency('glib-2.0'),
        dependency('x11')
    ],
    install: true,
    link_args: ['-lX11']
)
