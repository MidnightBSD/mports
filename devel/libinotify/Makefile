PORTNAME=	libinotify
PORTVERSION=	20240724
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libinotify-kqueue/libinotify-kqueue/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kevent based inotify compatible library
WWW=		https://github.com/libinotify-kqueue/libinotify-kqueue

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

USES=		libtool
CONFIGURE_ARGS=	--enable-skip-subfiles=fusefs,smbfs
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

.include <bsd.port.mk>
