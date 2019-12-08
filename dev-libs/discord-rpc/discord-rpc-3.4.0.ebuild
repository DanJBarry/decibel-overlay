# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib

DESCRIPTION="Discord RPC lib"
HOMEPAGE="https://github.com/discordapp/discord-rpc"
SRC_URI="https://github.com/discordapp/discord-rpc/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/rapidjson"
RDEPEND="${DEPEND}"

src_prepare() {
	sed 's:Werror:fpic:g' -i "${S}/src/CMakeLists.txt"
	default
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=OFF
		-DBUILD_SHARED_LIBS=NO
	)

	cmake-multilib_src_configure
}
