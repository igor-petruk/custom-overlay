EAPI="4"

CHROMIUM_LANGS="am ar bg bn ca cs da de el en_GB es es_LA et fa fi fil fr gu he
	hi hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt_BR pt_PT ro ru sk sl sr
	sv sw ta te th tr uk vi zh_CN zh_TW"

inherit chromium eutils multilib unpacker

DESCRIPTION="SRWare Iron Browser"
HOMEPAGE="http://www.google.com/chrome"

SRC_BASE="https://www.srware.net/downloads/iron-linux"
SRC_PACK="iron-linux"
SRC_URI="amd64? ( ${SRC_BASE}-64.tar.gz ) x86? ( ${SRC_BASE}.tar.gz )"

LICENSE="BSD"
KEYWORDS="-* ~amd64 ~x86"
IUSE="+plugins"
RESTRICT=""

SLOT="0"

RDEPEND="
	app-arch/bzip2
	app-misc/ca-certificates
	dev-libs/atk
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/libgcrypt
	dev-libs/nspr
	dev-libs/nss
	gnome-base/gconf:2
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	net-print/cups
	sys-apps/dbus
	|| ( >=sys-devel/gcc-4.4.0[-nocxx] >=sys-devel/gcc-4.4.0[cxx] )
	virtual/udev
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:2
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXScrnSaver
	x11-libs/pango
	x11-misc/xdg-utils
"

QA_PREBUILT="*"
S=${WORKDIR}

pkg_setup() {
	use amd64 && SRC_PACK="${SRC_PACK}-64"
	IRON_SOURCE="${SRC_PACK}/"
	chromium_suid_sandbox_check_kernel_config
}

src_install() {
	pushd "${IRON_SOURCE}locales" > /dev/null || die
	chromium_remove_language_paks
	popd
	
	mkdir -p "${D}opt/${SRC_PACK}" || die
	mv "${SRC_PACK}" "${D}opt/" || die
	fperms go-w "/opt/${SRC_PACK}/libavcodec.so.52" || die
	fperms go-w "/opt/${SRC_PACK}/libavutil.so.50" || die
	fperms go-w "/opt/${SRC_PACK}/libavformat.so.52" || die

	mkdir -p "${D}usr/bin" || die
	dosym "/opt/${SRC_PACK}/iron" "/usr/bin/iron" || die
}

any_cpu_missing_flag() {
	local value=$1
	grep '^flags' /proc/cpuinfo | grep -qv "$value"
}

pkg_preinst() {
	chromium_pkg_preinst
}

pkg_postinst() {
	chromium_pkg_postinst
}
