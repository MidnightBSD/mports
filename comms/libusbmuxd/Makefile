# $MidnightBSD$

PORTNAME=	libusbmuxd
PORTVERSION=	1.0.9
CATEGORIES=	comms
MASTER_SITES=	http://www.libimobiledevice.org/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Communication interface library for usbmuxd

LICENSE=	lgpl2.1 lgpl3
LICENSE_COMB=	dual

LIB_DEPENDS=	libplist.so:${PORTSDIR}/devel/libplist

CONFLICTS_INSTALL=usbmuxd-1.0.[6-8]

USES=		libtool pathfix pkgconfig tar:bzip2
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS README

OPTIONS_DEFINE=	DOCS INOTIFY

INOTIFY_DESC=	Use inotify instead of polling (saves energy)

INOTIFY_LIB_DEPENDS=	libinotify.so:${PORTSDIR}/devel/libinotify
# *_CONFIGURE_WITH can't be used as --with-inotify doesn't work.
INOTIFY_CONFIGURE_OFF=	--without-inotify
INOTIFY_CFLAGS=		-I${LOCALBASE}/include
INOTIFY_LDFLAGS=	-L${LOCALBASE}/lib -linotify

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}

.include <bsd.port.mk>
