# New ports collection makefile for:	libgsf
# Date created:				11 September 2002
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/devel/libgsf-gnome/Makefile,v 1.2 2008/06/17 18:11:32 laffer1 Exp $
# $FreeBSD: ports/devel/libgsf-gnome/Makefile,v 1.9 2007/09/05 15:50:26 mezz Exp $
#   $MCom: ports/devel/libgsf-gnome/Makefile,v 1.10 2006/03/05 21:26:56 marcus Exp $
#

PORTREVISION=	1
CATEGORIES=	devel gnome
PKGNAMESUFFIX=	-gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNOME wrapper for libgsf
LICENSE=	gpl2

MASTERDIR=	${.CURDIR}/../libgsf
BUILD_WRKSRC=	${WRKSRC}/gsf-gnome
INSTALL_WRKSRC=	${WRKSRC}/gsf-gnome
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

BUILD_DEPENDS+=	gnome-config:${PORTSDIR}/x11/gnome-libs

USE_GNOME=	gnomehack libgsf gnomevfs2 libbonobo ltverhack intlhack
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc/gsf \
		--with-bz2 --with-gnome --without-gvfs
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -lgsf-1"

GSF_SLAVE=	yes

post-install:
	@${MKDIR} ${PREFIX}/libdata/pkgconfig
	@${INSTALL_DATA} ${WRKSRC}/libgsf-gnome-1.pc \
		${PREFIX}/libdata/pkgconfig/

.include "${MASTERDIR}/Makefile"
