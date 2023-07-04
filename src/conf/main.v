module main

import toml
import os

fn main() {
	mut file := os.open('/home/matus/proj/pm/src/conf/config.toml') or {
		panic('No such file or directory')
	}
	print('current config:\n\n${file}')
}
