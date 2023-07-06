module main

import os
import cli
import toml
import readline
import net.http
import net

fn print_help() {
	version := os.execute('git rev-parse --short HEAD').output
	print('pm version ${version}\n\nSimple package manager written in V\n\nhe\tDispaly this help\nin\tInstall package\nrm\tRemove package\nqu\tQuery packages from local database\ncc\tCheck config\n')
}

fn install_pkg(pkg []int) []int {
	println('installing package(s): ${pkg}')
	// get mirrors from config.toml
	mirrors := toml.parse_file('examples/config.toml') or { panic('No such file or directory') }.ast

	return pkg
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
