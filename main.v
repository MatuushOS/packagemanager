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
				name: 'install'
				execute: fn (cmd cli.Command) ! {
					println('tbd')
					return
				}
			},
			cli.Command{
				name: 'remove'
				execute: fn (cmd cli.Command) ! {
					println('still tbd')
					return
				}
			},
			cli.Command{
				name: 'query'
				execute: fn (cmd cli.Command) ! {
					println('still tbd')
					return
				}
			},
			cli.Command{
				name: 'update'
				execute: fn (cmd cli.Command) ! {
					functions.update_mirrors()
					return
				}
			},
			cli.Command{
				name: 'mkrepo'
				description: 'Create database for repository'
				execute: fn (cmd cli.Command) ! {
					name := read_line("What's the name of your repo?: ")!
					path := read_line("What's the path where you have packages?: ")!
					// functions.make_repo('${name}', '${path}')
					return
				}
			},
		]
	}
	pm.setup()
	pm.parse(os.args)
}
