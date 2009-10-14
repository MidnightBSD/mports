# $MidnightBSD: mports/databases/gdbm/Makefile,v 1.7 2009/09/20 00:32:18 laffer1 Exp $

PORTNAME=	gdbm
PORTVERSION=	1.8.3
PORTREVISION=	5
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU database manager
LICENSE=        gpl2

USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
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
