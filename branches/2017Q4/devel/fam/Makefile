# $MidnightBSD$
# $FreeBSD: ports/devel/fam/Makefile,v 1.35 2008/08/20 00:56:36 ade Exp $

PORTNAME=	fam
PORTVERSION=	2.6.10
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	ftp://oss.sgi.com/projects/fam/download/
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File alteration monitor

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

CFLAGS+=	-Wno-deprecated

USES=		autoreconf cpe gmake libtool
CPE_VENDOR=	sgi
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
SUB_FILES=	pkg-message

#CONFLICTS_INSTALL=	gamin-[0-9]*

post-patch:
	${REINPLACE_CMD} -e "s/-lstdc++//g" ${WRKSRC}/libfam/Makefile.am

pre-configure:
	@${RM} -fr ${WRKSRC}/util
	@${MV} ${WRKSRC}/Makefile.am ${WRKSRC}/Makefile.am.orig
	@${SED} -e s/util// -e /SUBDIRS/q \
		<${WRKSRC}/Makefile.am.orig >${WRKSRC}/Makefile.am
	@${CP} ${FILESDIR}/mntent* ${WRKSRC}/fam

.include <bsd.port.mk>
