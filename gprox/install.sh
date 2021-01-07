#!/bin/bash

{
    set -e
    set -u

    ##################
    # Install gprox #
    ##################

    # Every package should define these 6 variables
    pkg_cmd_name="gprox"

    pkg_dst_cmd="$HOME/.local/bin/gprox"
    pkg_dst="$pkg_dst_cmd"

    pkg_src_cmd="$HOME/.local/opt/gprox-v$WEBI_VERSION/bin/gprox"
    pkg_src_dir="$HOME/.local/opt/gprox-v$WEBI_VERSION"
    pkg_src="$pkg_src_cmd"

    # pkg_install must be defined by every package
    pkg_install() {
        # ~/.local/opt/gprox-v0.99.9/bin
        mkdir -p "$(dirname $pkg_src_cmd)"

        # mv ./gprox-*/gprox ~/.local/opt/gprox-v0.99.9/bin/gprox
        mv ./gprox-*/gprox "$pkg_src_cmd"
    }

    # pkg_get_current_version is recommended, but (soon) not required
    pkg_get_current_version() {
        # 'gprox --version' has output in this format:
        #       gprox 0.99.9 (rev abcdef0123)
        # This trims it down to just the version number:
        #       0.99.9
        echo $(gprox --version 2>/dev/null | head -n 1 | cut -d ' ' -f 2)
    }

}