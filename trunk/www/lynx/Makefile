# $MidnightBSD$

PORTNAME=	lynx
PORTVERSION=	2.8.8.2
PORTREVISION=	2
CATEGORIES=	www ipv6
MASTER_SITES=	http://invisible-mirror.net/archives/lynx/tarballs/ \
		http://bitrote.org/distfiles/
DISTNAME=	${PORTNAME}${PORTVERSION:R}rel.${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Non-graphical, text-based World-Wide Web client

LICENSE=	gpl2

MAKE_JOBS_UNSAFE=yes

USES=		cpe tar:bzip2
USE_OPENSSL=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}2-8-8
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-zlib --libdir="${L_LIB}" \
		--enable-nsl-fork --enable-persistent-cookies \
		--enable-nested-tables --enable-gzip-help \
		--with-screen=ncursesw
CPE_VERSION=	${PORTVERSION:R}
CPE_UPDATE=	rel.${PORTVERSION:E}


_FAKE_SETUP += DOCSDIR=${FAKE_DESTDIR}${DOCSDIR}
TARGET_DIR=	${DESTDIR}${PREFIX}

OPTIONS_DEFINE=	DEFAULT_COLORS IPV6 NLS SSL
OPTIONS_DEFAULT=	SSL
DEFAULT_COLORS_DESC=	Colors support

.include <bsd.mport.options.mk>

.if empty(PORT_OPTIONS:MNLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS='@comment '
.else
USES+=		gettext iconv
CONFIGURE_ARGS+=--enable-nls --with-libiconv-prefix="${LOCALBASE}"
PLIST_SUB+=	NLS=''
.endif

.if ${PORT_OPTIONS:MIPV6} && !defined(NO_INET6)
CONFIGURE_ARGS+=--enable-ipv6
.else
CONFIGURE_ARGS+=--disable-ipv6
.endif

.if ${PORT_OPTIONS:MSSL}
CONFIGURE_ARGS+=	--with-ssl=${OPENSSLBASE}
.endif

.if ${PORT_OPTIONS:MDEFAULT_COLORS}
CONFIGURE_ARGS+=--enable-default-colors
.endif

.if empty(PORT_OPTIONS:MDOCS)
CONFIGURE_ARGS+=--disable-local-docs
INSTALL_TARGET=	install
DOCSDIR=
L_HELP=
.else
INSTALL_TARGET=	install-full
L_HELP=		${PREFIX}/share/lynx_help
MAKE_ARGS=	helpdir=${L_HELP} docdir=${DOCSDIR}
.endif

MAKEFILE=	makefile

L_LIB=		${PREFIX}/etc

SUB_FILES=	pkg-message

post-install:
.if empty(PORT_OPTIONS:MDOCS)
	[ -f ${L_LIB}/lynx.cfg ] || ${INSTALL} ${L_LIB}/lynx.cfg.sample ${L_LIB}/lynx.cfg
	[ -f ${L_LIB}/lynx.lss ] || ${INSTALL} ${L_LIB}/lynx.lss.sample ${L_LIB}/lynx.lss
.else
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${L_HELP}
.endif
	${CHOWN} ${SHAREOWN}:${SHAREGRP} ${L_LIB}/lynx.cfg

.include <bsd.port.mk>
