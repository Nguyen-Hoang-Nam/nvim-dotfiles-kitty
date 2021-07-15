local g = vim.g

g.dashboard_default_executive = 'telescope'

g.dashboard_custom_footer = { '' }

-- g.dashboard_custom_header = {
-- 	' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
-- 	' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
-- 	' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
-- 	' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
-- 	' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
-- 	' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
-- }

-- Credit https://github.com/filipekiss/dotfiles/blob/7ddece0a1a4e5099146d7c96fff077c86e4d320a/config/vim/.vim/after/plugin/startify.vim
g.dashboard_custom_header = {
	'      .            .      ',
	"    .,;'           :,.    ",
	'  .,;;;,,.         ccc;.  ',
	".;c::::,,,'        ccccc: ",
	'.::cc::,,,,,.      cccccc.',
	".cccccc;;;;;;'     llllll.",
	'.cccccc.,;;;;;;.   llllll.',
	".cccccc  ';;;;;;'  oooooo.",
	"'lllllc   .;;;;;;;.oooooo'",
	"'lllllc     ,::::::looooo'",
	"'llllll      .:::::lloddd'",
	'.looool       .;::coooodo.',
	"  .cool         'ccoooc.  ",
	'    .co          .:o:.    ',
	"      .           .'      ",
}

g.dashboard_custom_section = {
	a = {
		description = { '🍎  Find File                 SPACE p' },
		command = 'Telescope find_files',
	},
	b = {
		description = { '🫐  Recents                   SPACE o' },
		command = 'Telescope oldfiles',
	},
	c = {
		description = { '🥝  New File                  SPACE n' },
		command = 'DashboardNewFile',
	},
}
