module main
import os
import cli
import net

fn print_help() {
	version := os.execute("git rev-parse --short HEAD").output
	print("pm version $version\n\nSimple package manager written in V\n\n-h\tDispaly this help\n-i\tInstall package\n-r\tRemove package\n-q\tQuery packages from local database")
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
				name: '-i'
				execute: fn (cmd cli.Command) ! {
					println('hello subcommand')
					return
				}
			},
				cli.Command{
						name: '-i'
						execute: fn (cmd cli.Command) ! {
							println('tbd')
							return
						}
				},
			]
	}
	pm.setup()
	pm.parse(os.args)
}
