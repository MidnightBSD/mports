# $MidnightBSD$
# $FreeBSD: ports/devel/libopensync022/Makefile,v 1.18 2007/07/04 10:00:00 lofi Exp $

PORTNAME=	libopensync
PORTVERSION=	0.22
PORTREVISION=	5
CATEGORIES=	devel
MASTER_SITES=	http://www.opensync.org/download/releases/${PORTVERSION}/
PKGNAMESUFFIX=	022

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Freedesktop synchronization framework

LICENSE=	lgpl

CONFLICTS=	libopensync-0.[3-9]*

BUILD_DEPENDS=	${LOCALBASE}/lib/libsqlite3.so:${PORTSDIR}/databases/sqlite3
RUN_DEPENDS=	${LOCALBASE}/lib/libsqlite3.so:${PORTSDIR}/databases/sqlite3
SWIG_LANGUAGES=	python
GNU_CONFIGURE=	yes
USES=		libtool pathfix pkgconfig python tar:bzip2
USE_GNOME=	glib20 libxml2
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

CONFLICTS=	libopensync-0.[3-9]*

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile*" | ${XARGS} ${REINPLACE_CMD} \
	    -e 's|-Werror||g'
	@${REINPLACE_CMD} -e 's|$${libdir}/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
