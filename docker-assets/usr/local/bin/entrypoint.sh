#!/bin/bash

# Set our ruby paths
for path in $(gem env gempath | sed 's|:| |g')
do 
	export PATH="$path/bin:$PATH"
done

if [ $# -eq 0 ]
then
	echo "How come things that happen to stupid people, keep happening to me?"
else
	exec "$@"
fi
