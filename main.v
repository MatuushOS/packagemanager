module main

import os
import cli
import toml
import net.http
import readline { read_line }

struct Answer {
}

fn yesno(yes bool, no bool) string {
	mut r := read_line('Do you want to install ${package}? (y/n/h): ').str
	if &r == y {
		return yes
	} else if r == n {
		return no
		exit('SIGTERM')
	} else if &r == h {
		print('y\tyes\nn\t\no\nh\thelp')
	}
}

fn print_help() {
	version := os.execute('git rev-parse --short HEAD').output
	print('pm version ${version}\n\nSimple package manager written in V\n\nhe\tDispaly this help\nin\tInstall package\nrm\tRemove package\nqu\tQuery packages from local database\ncc\tCheck config\n')
	yesno(true)
}

fn parse_config() {
	file := toml.parse_file('examples/config.toml') or { panic('No such file or directory') }.ast
	print('current config:\n\n${file}')
}

fn main() {
	mut pm := cli.Command{
		name: 'pm'
		description: 'Simple package manager written in V'
		execute: fn (cmd cli.Command) ! {
			print_help()
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
					parse_config()
					return
				}
			},
		]
	}
	pm.setup()
	pm.parse(os.args)
}
