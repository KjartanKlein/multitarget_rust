#!/bin/bash
##REMEBER TO CHANGE THE CPU TO WHATEVER YOU ARE USING
cpu="x86_64-unknown-linux-gnu"
pi="arm-unknown-linux-gnueabihf"

declare -a targets=($cpu $pi)

cargo clippy

if cargo check; then
	for i in "${targets[@]}"
	do 
		echo "building $i"
		cargo build --target=$i
	done
fi
