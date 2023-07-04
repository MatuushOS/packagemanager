module main
import os
import cli
import net
fn print_help() {
	version := os.execute("")
	print("pm version\n\Simple package manager written in V\n\n-h\tDispaly this help\n-i\tInstall package\n-r\tRemove package\n-q\tQuery packages from local database")
}
fn main() {
	mut app := cli.Command{
		name: 'pm'
		description: 'Simple package manager written in V'
		execute: fn (cmd cli.Command) ! {
			print_help()
			return
		}
		commands: [
				cli.Command{
				name: 'sub'
				execute: fn (cmd cli.Command) ! {
					println('hello subcommand')
					return
				}
			},
		]
	}
	app.setup()
	app.parse(os.args)
}
