module main
import os
import cli

fn print_help() {
	version := os.execute("git rev-parse --short HEAD").output
	print("pm version $version\n\nSimple package manager written in V\n\nhe\tDispaly this help\nin\tInstall package\nrm\tRemove package\nqu\tQuery packages from local database")
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
					execute: fn (cmd cli.Command)! {
						println('still tbd')
						return
					}
				},
				cli.Command{
					name: 'qu'
					execute: fn (cmd cli.Command)! {
						println('still tbd')
						return
					}
				}
		]
	}
	pm.setup()
	pm.parse(os.args)
}
