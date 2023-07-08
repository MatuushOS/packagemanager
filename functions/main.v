module functions

import os
import toml
import net.http

pub fn print_help() {
	version := os.execute('git rev-parse --short HEAD').output
	print('pm version ${version}\n\nSimple package manager written in V\n\nhelp\t\t\tDispaly this help\ninstall\t\t\tInstall package\nremove\t\t\tRemove package\nquery\t\t\tQuery packages from local database\nupdate\t\t\tCheck config\nmkrepo\t\t\tCreate repository\n')
}

pub fn update_mirrors() {
	current_config := toml.parse_file('examples/config.toml') or { panic(err) }
	mirrors := current_config.value('mirrors').string()
	println('Updating mirrors')
	http.download_file('${mirrors}', 'repo-archive.tar.xz') or { panic('No internet') }
}
