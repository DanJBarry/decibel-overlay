# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A utility for managing BetterDiscord on Linux"
HOMEPAGE="https://github.com/bb010g/betterdiscordctl/"

EGIT_COMMIT="7bd71530117c280842d6496928acace0674f1f52"
EGIT_REPO_URI="https://github.com/bb010g/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=net-libs/nodejs-11.14.0:=[npm]"

src_prepare() {
	sed -i 's/^DISABLE_UPGRADE=$/DISABLE_UPGRADE=yes/' betterdiscordctl || die
	eapply_user
}

src_install() {
	exeinto "/usr/bin"
	newexe "${S}/betterdiscordctl" betterdiscordctl || die
	insinto "/usr/share/licenses/${PN}"
	doins "${S}/LICENSE.md"
}
