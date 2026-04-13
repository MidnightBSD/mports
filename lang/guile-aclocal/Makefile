PORTNAME=	guile-aclocal
CATEGORIES=	lang scheme
PKGNAMESUFFIX=
DISTNAME=	guile-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MASTERDIR=	${.CURDIR}/../guile3

NO_ARCH=	yes
NO_BUILD=	yes

PLIST=		# disable MASTERDIR's plist
PLIST_FILES=	${PREFIX}/share/aclocal/guile.m4

do-install:
	${MKDIR} ${PREFIX}/share/aclocal/
	${INSTALL_DATA} ${WRKSRC}/meta/guile.m4 ${PREFIX}/share/aclocal/

.include "${MASTERDIR}/Makefile"
