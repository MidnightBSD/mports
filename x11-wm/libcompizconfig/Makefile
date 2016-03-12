# $MidnightBSD$
# $FreeBSD: ports/x11-wm/libcompizconfig/Makefile,v 1.5 2008/04/19 17:55:55 miwi Exp $
#

PORTNAME=	libcompizconfig
PORTVERSION=	0.8.8
CATEGORIES=	x11-wm
MASTER_SITES=	http://releases.compiz.org/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alternative configuration system for Compiz

LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/compiz.pc:${PORTSDIR}/x11-wm/compiz 

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

USES=		gmake libtool:keepla pathfix pkgconfig tar:bzip2 gettext
USE_GNOME=	intltool libxml2

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

OPTIONS_DEFINE=	INOTIFY
OPTIONS_DEFAULT=	INOTIFY
INOTIFY_DESC?=	Enable inotify support

INOTIFY_LIB_DEPENDS=	libinotify.so:${PORTSDIR}/devel/libinotify
INOTIFY_LDFLAGS=	-linotify

.include <bsd.port.pre.mk>

post-patch:
.if empty(PORT_OPTIONS:MINOTIFY)
	@${REINPLACE_CMD} -e 's|sys/inotify.h||' ${WRKSRC}/configure
.endif
	@echo "OSVERSION=${OSVERSION}"
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|'	\
		${WRKSRC}/src/main.c			\
		${WRKSRC}/src/lists.c			\
		${WRKSRC}/src/filewatch.c		\
		${WRKSRC}/src/ini.c			\
		${WRKSRC}/backend/ini.c

post-install:
.for l in compizconfig/backends/libini.so compiz/libccp.so libcompizconfig.so.0.0.0
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/${l}
.endfor

.include <bsd.port.post.mk>
