PORTNAME=	lynx
DISTVERSION=	2.8.9.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	https://invisible-mirror.net/archives/lynx/tarballs/ \
		https://invisible-island.net/archives/lynx/tarballs/ \
		http://bitrote.org/distfiles/
DISTNAME=	${PORTNAME}${DISTVERSION:R}rel.${DISTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Non-graphical, text-based World-Wide Web client
WWW=		https://lynx.invisible-island.net/

LICENSE=	gpl2

LIB_DEPENDS=	libidn.so:dns/libidn

CONFLICTS=	lynx-2.8.[8-9]d*

USES=		cpe ncurses shebangfix tar:bzip2
SHEBANG_FILES=	samples/mailto-form.pl
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-zlib --libdir="${PREFIX}/etc" \
		--enable-nsl-fork --enable-persistent-cookies \
		--enable-nested-tables --enable-gzip-help \
		--with-screen=ncursesw
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
CPE_VERSION=	${DISTVERSION:R}
CPE_UPDATE=	rel.${DISTVERSION:E}

MAKEFILE=	makefile
L_HELP=		${PREFIX}/share/lynx_help
SUB_FILES=	pkg-message
MAKE_JOBS_UNSAFE=	yes

OPTIONS_DEFINE=	DEFAULT_COLORS IPV6 NLS SSL DOCS EXTERNALS
OPTIONS_DEFAULT=	SSL EXTERNALS
DEFAULT_COLORS_DESC=	Colors support
EXTERNALS_DESC=	External application support
OPTIONS_SUB=	yes

NLS_USES=	gettext iconv
NLS_CONFIGURE_ENABLE=	nls
NLS_CONFIGURE_ON=	${ICONV_CONFIGURE_ARG}

IPV6_CONFIGURE_ENABLE=	ipv6

DEFAULT_COLORS_CONFIGURE_ENABLE=	default-colors

DOCS_CONFIGURE_ENABLE=	local-docs
DOCS_INSTALL_TARGET=	install-full
DOCS_MAKE_ARGS=		helpdir=${L_HELP} docdir=${DOCSDIR}

EXTERNALS_CONFIGURE_ENABLE=externs

SSL_CONFIGURE_ON=	--with-ssl=${OPENSSLBASE}
SSL_USES=		ssl

post-install:
	${RM} ${PREFIX}/share/doc/lynx/test/X
	${RM} ${PREFIX}/share/doc/lynx/test/nobody

post-install-DOCS-on:
# Fix some stage symlinks
.for doc in COPYHEADER COPYING COPYHEADER.asc COPYING.asc
	(cd ${FAKE_DESTDIR}${L_HELP} && ${LN} -sf ../doc/lynx/${doc} .)
.endfor

.include <bsd.port.mk>
