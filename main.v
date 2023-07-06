module main

import os
import cli
import readline { read_line }
import functions

fn main() {
	mut pm := cli.Command{
		name: 'pm'
		description: 'Simple package manager written in V'
		execute: fn (cmd cli.Command) ! {
			functions.print_help()
			return
		}
		commands: [
			cli.Command{
				name: 'in'
				execute: fn (cmd cli.Command) ! {
					println('tbd')
					return
				}
			},
			cli.Command{
				name: 'rm'
				execute: fn (cmd cli.Command) ! {
					println('still tbd')
					return
				}
			},
			cli.Command{
				name: 'qu'
				execute: fn (cmd cli.Command) ! {
					println('still tbd')
					return
				}
			},
			cli.Command{
				name: 'cc'
				execute: fn (cmd cli.Command) ! {
					functions.parse_config()
					return
				}
			},
			cli.Command{
				name: 'mkrepo'
				description: 'Create database for repository'
				execute: fn (cmd cli.Command) ! {
					name := read_line("What's the name of your repo?: ")!
					path := read_line("What's the path where you have packages?: ")!
					functions.mkrepo('${name}', '${path}')
					return
				}
			},
		]
	}
	pm.setup()
	pm.parse(os.args)
}
