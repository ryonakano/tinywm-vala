project('tinywm-vala', 'vala', 'c')

executable(
    meson.project_name(),
    'tinywm.vala',
    dependencies: [
        dependency('glib-2.0'),
        dependency('x11')
    ],
    install: true,
    install_dir: '/usr/bin'
)
