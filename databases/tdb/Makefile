# $MidnightBSD: mports/databases/tdb/Makefile,v 1.2 2011/02/02 20:09:16 laffer1 Exp $

PORTNAME=		tdb
PORTVERSION=		1.2.1
CATEGORIES=		databases
MASTER_SITES=		ftp://ftp.samba.org/pub/%SUBDIR%/ \
			ftp://ca.samba.org/pub/%SUBDIR%/ \
			ftp://de.samba.org/pub/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Trivial Database
LICENSE=		lgpl

CONFLICTS=		*samba-3.*

USE_PYTHON=		yes
USE_GMAKE=		yes
USE_LDCONFIG=		yes
GNU_CONFIGURE=		yes
USE_GNOME=		pkgconfig
USE_AUTOTOOLS=		autoconf autoheader

IPATHS=			-I${WRKSRC}/libreplace
AUTOHEADER_ARGS=	${IPATHS}
AUTOCONF_ARGS=		${IPATHS}

PKGCONFIGDIR?=		${PREFIX}/libdata/pkgconfig
PKGCONFIGDIR_REL?=	${PKGCONFIGDIR:S|^${PREFIX}/||}
PYTHON_SITELIBDIR_REL?=	${PYTHONPREFIX_SITELIBDIR:S|^${PREFIX}/||}

PLIST_FILES=		bin/tdbbackup \
			bin/tdbdump \
			bin/tdbtool \
			include/tdb.h \
			lib/libtdb.a \
			lib/libtdb.so \
			lib/libtdb.so.1 \
			${PKGCONFIGDIR_REL}/tdb.pc \
			${PYTHON_SITELIBDIR_REL}/tdb.so

post-install:
			@${LN} -sf libtdb.so.1 ${PREFIX}/lib/libtdb.so

.include <bsd.port.mk>
