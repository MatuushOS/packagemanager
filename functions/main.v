module functions

import os
import toml
import db.sqlite

pub fn print_help() {
	version := os.execute('git rev-parse --short HEAD').output
	print('pm version ${version}\n\nSimple package manager written in V\n\nhelp\t\t\tDispaly this help\ninstall\t\t\tInstall package\nremove\t\t\tRemove package\nquery\t\t\tQuery packages from local database\ncheckconfig\t\tCheck config\nmkrepo\t\t\tCreate repository\n')
}

pub fn install_pkg(pkg string) string {
	println('installing package(s): ${pkg}')
	// get mirrors from config.toml
	parsefile := toml.parse_file('examples/config.toml') or { panic('No such file or directory') }.ast
	mirrors := parsefile.str()
	println('${mirrors}')
	return pkg
}

pub fn parse_config() {
	file := toml.parse_file('examples/config.toml') or { panic('No such file or directory') }.ast
	print('current config:\n\n${file}')
	install_pkg('test')
}

pub fn mkrepo(name string, path string) {
	os.execute('mkdir ${path}; touch ${path}/.pmrepo')
	println('Populating repo database with packages so PM can then see what packages are available')
}
