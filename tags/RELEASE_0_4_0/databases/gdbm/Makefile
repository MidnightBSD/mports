# $MidnightBSD: mports/databases/gdbm/Makefile,v 1.9 2011/02/02 20:09:16 laffer1 Exp $

PORTNAME=	gdbm
PORTVERSION=	1.9.1
PORTREVISION=	0
CATEGORIES=	databases
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU database manager
LICENSE=        gpl2

FAKE_OPTS+=	prefixhack

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
DESTDIRNAME=	INSTALL_ROOT

.if defined(WITH_COMPAT)
INSTALL_TARGET=	install install-compat
PLIST_SUB=	GDBM_COMPAT=""
.else
PLIST_SUB=	GDBM_COMPAT="@comment "
.endif

MAN3=		gdbm.3
INFO=		gdbm

pre-everything::
.if !defined(WITH_COMPAT)
	@${ECHO_MSG}
	@${ECHO_MSG} "If you need UNIX dbm/ndbm compatibility functions,"
	@${ECHO_MSG} "use \"make WITH_COMPAT=yes\""
	@${ECHO_MSG}
.endif

post-patch:
	@${REINPLACE_CMD} "s|prefix = @prefix@|prefix = ${TARGETDIR}|" \
			${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e "s|LIBS = @LIBS@ -lc|LIBS = @LIBS@|" \
			-e "s|BINOWN = bin|BINOWN = root|" -e "s|BINGRP = bin|BINGRP = wheel|" \
			-e "s|libgdbm.la libgdbm_compat.la|libgdbm.la libgdbm_compat.la gdbm.info|" \
			${WRKSRC}/Makefile.in

.include <bsd.port.mk>
