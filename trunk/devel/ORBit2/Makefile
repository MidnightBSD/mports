# $MidnightBSD$

PORTNAME=	ORBit2
PORTVERSION=	2.14.19
PORTREVISION?=	4
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance CORBA ORB with support for the C language

LICENSE=	gpl2

USES=		tar:bzip2

.if !defined(REFERENCE_PORT)

GNU_CONFIGURE=	yes
USES+=		gettext gmake libtool:keepla pathfix pkgconfig
USE_LDCONFIG=	yes
USE_GNOME=	libidl referencehack
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/src/orb/orb-core/orbit-typelib.c
	@${REINPLACE_CMD} -e 's|-DG_DISABLE_DEPRECATED||g' \
		${WRKSRC}/configure ${WRKSRC}/linc2/src/Makefile.in
	@${REINPLACE_CMD} '/DESTDIR.*RANLIB/d' \
		${WRKSRC}/src/services/name/Makefile.in

post-install:
	@${ECHO_CMD} "ORBIIOPIPv4=0" > ${PREFIX}/etc/orbit2rc.default
	@${ECHO_CMD} "ORBIIOPIPv6=0" >> ${PREFIX}/etc/orbit2rc.default
	@if [ ! -f ${PREFIX}/etc/orbit2rc ]; then \
		${CP} -p ${PREFIX}/etc/orbit2rc.default ${PREFIX}/etc/orbit2rc ; \
	fi
	@${MKDIR} ${PREFIX}/lib/orbit-2.0/idl-backends

.include <bsd.port.mk>

.endif
