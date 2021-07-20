local g = vim.g

g.dashboard_default_executive = 'telescope'

g.dashboard_custom_footer = { '' }

g.dashboard_custom_header = {
    '     ⣠⣾⣦⡀                    ⣷⣄     ',
    '   ⣠⣾⣿⣿⣿⣿⣦⡀                  ⣿⣿⣷⣄   ',
    ' ⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀                ⣿⣿⣿⣿⣷⣄ ',
    ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀              ⣿⣿⣿⣿⣿⣿ ',
    ' ⣿⣿⣿⣿⣿⣿⠈⠻⣿⣿⣿⣿⣿⣿⣦⡀            ⣿⣿⣿⣿⣿⣿ ',
    ' ⣿⣿⣿⣿⣿⣿  ⠈⠻⣿⣿⣿⣿⣿⣿⣦⡀          ⣿⣿⣿⣿⣿⣿ ',
    ' ⣿⣿⣿⣿⣿⣿    ⠈⠻⣿⣿⣿⣿⣿⣿⣦⡀        ⣿⣿⣿⣿⣿⣿ ',
    ' ⣿⣿⣿⣿⣿⣿      ⠈⠻⣿⣿⣿⣿⣿⣿⣦⡀      ⣿⣿⣿⣿⣿⣿ ',
    ' ⣿⣿⣿⣿⣿⣿        ⠈⠻⣿⣿⣿⣿⣿⣿⣦⡀    ⣿⣿⣿⣿⣿⣿ ',
    ' ⣿⣿⣿⣿⣿⣿          ⠈⠻⣿⣿⣿⣿⣿⣿⣦⡀  ⣿⣿⣿⣿⣿⣿ ',
    ' ⣿⣿⣿⣿⣿⣿            ⠈⠻⣿⣿⣿⣿⣿⣿⣦⡀⣿⣿⣿⣿⣿⣿ ',
    ' ⣿⣿⣿⣿⣿⣿              ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
    ' ⠙⢿⣿⣿⣿⣿                ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋ ',
    '   ⠙⢿⣿⣿                  ⠈⠻⣿⣿⣿⣿⡿⠋   ',
    '     ⠙⢿                    ⠈⠻⡿⠋     ',
}

g.dashboard_custom_section = {
    a = {
        description = { '  Find File                 SPACE p' },
        command = 'Telescope find_files',
    },
    b = {
        description = { '  Recents                   SPACE o' },
        command = 'Telescope oldfiles',
    },
    c = {
        description = { '  New File                  SPACE n' },
        command = 'DashboardNewFile',
    },
}
