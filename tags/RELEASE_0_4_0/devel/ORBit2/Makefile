# $MidnightBSD: mports/devel/ORBit2/Makefile,v 1.12 2012/02/29 01:43:27 laffer1 Exp $

PORTNAME=	ORBit2
PORTVERSION=	2.14.19
PORTREVISION?=	2
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance CORBA ORB with support for the C language
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack libidl ltverhack referencehack
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

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
