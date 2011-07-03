# $MidnightBSD$
# $FreeBSD: ports/devel/libsoup-gnome/Makefile,v 1.1 2010/11/20 15:36:36 kwm Exp $

PORTREVISION=	0
CATEGORIES=	devel gnome
PKGNAMESUFFIX=	-gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNOME wrapper for libsoup
LICENSE=	gpl2

MASTERDIR=	${.CURDIR}/../libsoup
#BUILD_WRKSRC=	${WRKSRC}/gsf-gnome
#INSTALL_WRKSRC=	${WRKSRC}/gsf-gnome
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

SOUP_SLAVE=	yes

#post-install:
#	@${MKDIR} ${PREFIX}/libdata/pkgconfig
#	@${INSTALL_DATA} ${WRKSRC}/libsoup-gnome-2.4.pc \
#		${PREFIX}/libdata/pkgconfig/

.include "${MASTERDIR}/Makefile"
