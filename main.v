module main

import os
import cli
import toml
import readline { read_line }
import net.http
import db.sqlite

fn print_help() {
	version := os.execute('git rev-parse --short HEAD').output
	print('pm version ${version}\n\nSimple package manager written in V\n\nhe\tDispaly this help\nin\tInstall package\nrm\tRemove package\nqu\tQuery packages from local database\ncc\tCheck config\n')
}

fn install_pkg(pkg string) string {
	println('installing package(s): ${pkg}')
	// get mirrors from config.toml
	parsefile := toml.parse_file('examples/config.toml') or { panic('No such file or directory') }.ast
	mirrors := parsefile.str()
	println('${mirrors}')
	return pkg
}

fn parse_config() {
	file := toml.parse_file('examples/config.toml') or { panic('No such file or directory') }.ast
	print('current config:\n\n${file}')
	install_pkg('test')
}

fn mkrepo(name string, path string) {
	os.create('${path}/repo.db') or { panic('file exists') }
	sqlite.connect('${path}/repo.db') or { panic('No such file or directory') }
	println('Populating repo database with packages so PM can then see what packages are available')
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
			cli.Command{
				name: 'mkrepo'
				description: 'Create database for repository'
				execute: fn (cmd cli.Command) ! {
					name := read_line("What's the name of your repo?: ")
					path := read_line("What's the path where you have packages?: ")
					mkrepo('${name}', '${path}')
					return
				}
			},
		]
	}
	pm.setup()
	pm.parse(os.args)
}
