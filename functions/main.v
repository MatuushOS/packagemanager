module functions

import os
import toml
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
