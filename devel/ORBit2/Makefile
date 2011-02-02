# New ports collection makefile for:   orbit2
# Date Created:			16 Aug 1998
# Whom:				Chia-liang Kao <clkao@CirX.ORG>
#
# $FreeBSD: ports/devel/ORBit2/Makefile,v 1.121 2006/09/04 18:54:14 marcus Exp $
#    $MCom: ports/devel/ORBit2/Makefile,v 1.50 2006/04/13 07:52:31 bland Exp $
# $MidnightBSD: mports/devel/ORBit2/Makefile,v 1.9 2010/02/28 15:58:27 laffer1 Exp $
#

PORTNAME=	ORBit2
PORTVERSION=	2.14.17
PORTREVISION?=	0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance CORBA ORB with support for the C language
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack libidl ltverhack referencehack
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/src/orb/orb-core/orbit-typelib.c

post-install:
	@${ECHO_CMD} "ORBIIOPIPv4=0" > ${PREFIX}/etc/orbit2rc.default
	@${ECHO_CMD} "ORBIIOPIPv6=0" >> ${PREFIX}/etc/orbit2rc.default
	@if [ ! -f ${PREFIX}/etc/orbit2rc ]; then \
		${CP} -p ${PREFIX}/etc/orbit2rc.default ${PREFIX}/etc/orbit2rc ; \
	fi
	@${MKDIR} ${PREFIX}/lib/orbit-2.0/idl-backends

.include <bsd.port.mk>

.endif
