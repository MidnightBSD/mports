# $MidnightBSD: mports/devel/fam/Makefile,v 1.4 2011/05/21 21:19:50 laffer1 Exp $
# $FreeBSD: ports/devel/fam/Makefile,v 1.35 2008/08/20 00:56:36 ade Exp $

PORTNAME=	fam
PORTVERSION=	2.6.10
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	ftp://oss.sgi.com/projects/fam/download/
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A file alteration monitor
LICENSE=	gpl2

CFLAGS+=	-Wno-deprecated

USE_AUTOTOOLS=	aclocal automake autoconf libtool
AUTOMAKE_ARGS=	-c -a
USE_GMAKE=	yes
USE_LDCONFIG=	yes
ACLOCAL_ARGS=	-I "${ACLOCAL_DIR}" -I ${LOCALBASE}/share/aclocal
SUB_FILES=	pkg-message

MAN1=		fam.1m
MAN3=		fam.3x

CONFLICTS=	gamin-[0-9]*

pre-configure:
	@${RM} -fr ${WRKSRC}/util
	@${MV} ${WRKSRC}/Makefile.am ${WRKSRC}/Makefile.am.orig
	@${SED} -e s/util// -e /SUBDIRS/q \
		<${WRKSRC}/Makefile.am.orig >${WRKSRC}/Makefile.am
	@${CP} ${FILESDIR}/mntent* ${WRKSRC}/fam

.include <bsd.port.mk>
