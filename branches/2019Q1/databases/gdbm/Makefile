# $MidnightBSD$

PORTNAME=	gdbm
PORTVERSION=	1.13
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU database manager

LICENSE=        gpl3

FAKE_OPTS+=	prefixhack

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		libtool:keepla iconv readline
DESTDIRNAME=	INSTALL_ROOT

MAKE_JOBS_UNSAFE=	yes

INFO=		gdbm

OPTIONS_DEFINE=	COMPAT NLS
OPTIONS_SUB=	yes
COMPAT_DESC=	Enable dbm/ndbm compatibility

COMPAT_CONFIGURE_ENABLE=	libgdbm-compat
NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} "s|prefix = @prefix@|prefix = ${TARGETDIR}|" \
			${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e "s|LIBS = @LIBS@ -lc|LIBS = @LIBS@|" \
		-e "s|BINOWN = bin|BINOWN = root|" -e "s|BINGRP = bin|BINGRP = wheel|" \
		-e "s|libgdbm.la libgdbm_compat.la|libgdbm.la libgdbm_compat.la gdbm.info|" \
			${WRKSRC}/Makefile.in

.include <bsd.port.mk>
